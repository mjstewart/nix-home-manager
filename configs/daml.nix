{ stdenv, damlVersion }:

stdenv.mkDerivation {
  name = "daml-sdk";
  src = stdenv.fetchTarball {
    url = "https://github.com/digital-asset/daml/releases/download/${damlVersion}/daml-sdk-${damlVersion}-linux.tar.gz";
  };
}
