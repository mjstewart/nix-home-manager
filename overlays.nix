self: super:
{
  # my-kitty = super.kitty.overrideAttrs(old: {
  #   src = super.fetchFromGitHub {
  #     owner = "kovidgoyal";
  #     repo = "kitty";
  #     rev = "fbccfb9d0d3f0368ec59e8ea0362e8258b5e9541";
  #     sha256 = "q2axiHJ/99y+wTHtXCLFd8RceDq0xopkk8E8JMtpG/g=";
  #   };
  # });

   my-vscode = super.vscode-with-extensions.override {
     vscodeExtensions = with self.vscode-extensions; [
       bbenoist.nix
    ] ++ self.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vim";
          version = "1.24.3";
          publisher = "vscodevim";
          # nix-prefetch-url https://vscodevim.gallery.vsassets.io/_apis/public/gallery/publisher/vscodevim/extension/vim/1.24.3/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "02alixryryak80lmn4mxxf43izci5fk3pf3pcwy52nbd3d2fiwz1";
        }
        {
          name = "vscode-xml";
          version = "0.23.2022111903";
          publisher = "redhat";
          # nix-prefetch-url https://redhat.gallery.vsassets.io/_apis/public/gallery/publisher/redhat/extension/vscode-xml/0.23.2022111903/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1rxs1fgn9y9zzq1hdb4j3g6iy78znjkh5dgihpj4lxybfg7yk6cb";
        }
        {
          name = "haskell-ghcid";
          version = "0.3.1";
          publisher = "ndmitchell";
          # nix-prefetch-url https://ndmitchell.gallery.vsassets.io/_apis/public/gallery/publisher/ndmitchell/extension/haskell-ghcid/0.3.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1rivzlk32x7vq84ri426nhd6a4nv3h7zp7xcsq31d0kp8bqczvi9";
        }
        {
          name = "better-align";
          version = "1.1.6";
          publisher = "wwm";
          # nix-prefetch-url https://wwm.gallery.vsassets.io/_apis/public/gallery/publisher/wwm/extension/better-align/1.1.6/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1ldvpava9xlqy3zwwc0c04pk9dh09jwcwz5lk3b2cr1z8bxn54lh";
        }
      ];
   };
}
