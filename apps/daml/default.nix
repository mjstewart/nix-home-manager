{ stdenv }:

# There are a few interesting observations here
# 1. Read what the different phases do
#    https://nixos.org/nixpkgs/manual/#ssec-controlling-phases
#    fetchTarball will drop you into the unpacked sources directory, you see this by looking at the src
#    path in the derivation that gets built.
#
#    `nix show-derivation hash`
#
# 2. for derivation creation to be successful, we always need to create $out/bin
#    $out is what nix provides for us to store the final built artifacts. Using bin
#    as the convention enables other build phases to install in the nix path.
#
# 3. the alternative to patchShebangs would be in the installPhase, copy the entire current directory
#    (source of tarball unpack) and copy it into $out. the fixPhase then rewrites all shebangs with the
#    nix store bash version so all the daml install scripts would work without having bash errors. The build
#    environment is pure, no reference to system deps is allowed.
let
 config = ''
   update-check: never
 '';

 version = "0.13.38";

 # Each version upgrade, manually get the hash, or do a typo in the hash and let nix tell you what it should be.
 # If you are using prefetch, make the sure --name and mkDerivation.name match since prefetch caches it by this name.
 # nix-prefetch-url --unpack --print-path --name daml-sdk https://github.com/digital-asset/daml/releases/download/v0.13.38/daml-sdk-0.13.38-linux.tar.gz
 sha256 = "1l66fzbph6wcsk24xbdvgx8d168q30rry9jy8n67gfw98yhy669z";

 url = "https://github.com/digital-asset/daml/releases/download/v${version}/daml-sdk-${version}-linux.tar.gz";
in
  stdenv.mkDerivation {
    name = "daml-sdk";
    src = fetchTarball {
      inherit url;
      inherit sha256;
    };
    installPhase = ''
      echo "installing DAML ${version}"

      mkdir -p $out/bin on

      # need to use nix's bash in any bash script used in sdk install process
      patchShebangs install.sh daml

      # the install script is actually in haskell and reads $HOME to install the sdk
      # nix blocks you from using system HOME for purity reasons.
      # this will result in the install script writing the final .daml artifact to $out ready for symlinking next.
      export HOME=$(readlink -f $out)
      ./install.sh

      # symlink lets nix install daml in the nix path. see `which daml`.
      ln -s $out/.daml/bin/daml $out/bin

      echo ${config} >> $out/.daml/daml-config.yaml
    '';
  }
