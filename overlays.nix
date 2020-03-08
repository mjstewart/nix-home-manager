self: super:
{
   my-vscode = super.vscode-with-extensions.override {

     vscodeExtensions = with self.vscode-extensions; [
       bbenoist.Nix
       justusadam.language-haskell
    ] ++ self.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vim";
          version = "1.11.3";
          publisher = "vscodevim";
          # nix-prefetch-url https://vscodevim.gallery.vsassets.io/_apis/public/gallery/publisher/vscodevim/extension/vim/1.11.3/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1smzsgcrkhghbnpy51gp28kh74l7y4s2m8pfxabb4ffb751254j0";
        }
        {
          name = "vscode-docker";
          version = "0.8.1";
          publisher = "ms-azuretools";
          # nix-prefetch-url https://ms-azuretools.gallery.vsassets.io/_apis/public/gallery/publisher/ms-azuretools/extension/vscode-docker/0.8.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "0n59whmcrx8946xix6skvc50f2vsc85ckvn8cs06w9mqmymm1q0s";
        }
        {
          name = "vscode-xml";
          version = "0.9.1";
          publisher = "redhat";
          # nix-prefetch-url https://redhat.gallery.vsassets.io/_apis/public/gallery/publisher/redhat/extension/vscode-xml/0.9.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "12nl2wm01y6kv4csnfz8hgkf227k5vkpnzcnfyr8cxd11wkb5nna";
        }
        {
          name = "vscode-proto3";
          version = "0.3.0";
          publisher = "zxh404";
          # nix-prefetch-url https://zxh404.gallery.vsassets.io/_apis/public/gallery/publisher/zxh404/extension/vscode-proto3/0.3.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1iylw9hihqz0pab4iisykgrq20141v5f1r6l4cif1z4237nd3z60";
        }
        {
          name = "daml";
          version = "0.13.46";
          publisher = "digitalassetholdingsllc";
          # nix-prefetch-url https://digitalassetholdingsllc.gallery.vsassets.io/_apis/public/gallery/publisher/digitalassetholdingsllc/extension/daml/0.13.46/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "08km1cjhari2wqjmwsc80vz8kf3sx8ddlrm2n6wimi1lz0kf12v2";
        }
        {
          name = "dhall-lang";
          version = "0.0.4";
          publisher = "panaeon";
          # nix-prefetch-url https://panaeon.gallery.vsassets.io/_apis/public/gallery/publisher/panaeon/extension/dhall-lang/0.0.4/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "0qcxasjlhqvl5zyf7w9fjx696gnianx7c959g2wssnwyxh7d14ka";
        }
        {
          name = "haskell-ghcid";
          version = "0.2.1";
          publisher = "ndmitchell";
          # nix-prefetch-url https://ndmitchell.gallery.vsassets.io/_apis/public/gallery/publisher/ndmitchell/extension/haskell-ghcid/0.2.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "16ibf8ckcmsq000qlvn34ki16qxyvd2wcd76kpjbfk6p3jfcakca";
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
