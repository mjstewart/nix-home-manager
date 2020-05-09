self: super:
{
   my-vscode = super.vscode-with-extensions.override {

     vscodeExtensions = with self.vscode-extensions; [
       bbenoist.Nix
       justusadam.language-haskell
    ] ++ self.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vim";
          version = "1.13.1";
          publisher = "vscodevim";
          # nix-prefetch-url https://vscodevim.gallery.vsassets.io/_apis/public/gallery/publisher/vscodevim/extension/vim/1.13.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "04s0myx4j6ip86ic78cmaj8mb7wds4pmlj2fjy3wmyrbcyadn4h4";
        }
        {
          name = "vscode-docker";
          version = "1.0.0";
          publisher = "ms-azuretools";
          # nix-prefetch-url https://ms-azuretools.gallery.vsassets.io/_apis/public/gallery/publisher/ms-azuretools/extension/vscode-docker/1.0.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1zljdgym3kz4plb2a3z0yxvpqf4lnf215rajjs5sr7dxx3dwrxdg";
        }
        {
          name = "vscode-xml";
          version = "0.11.0";
          publisher = "redhat";
          # nix-prefetch-url https://redhat.gallery.vsassets.io/_apis/public/gallery/publisher/redhat/extension/vscode-xml/0.11.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "12z3ls6rhkf7b5qqs3r5n4vk9lzq90cj7f6d1r4ywraij82lngs5";
        }
        {
          name = "vscode-proto3";
          version = "0.4.2";
          publisher = "zxh404";
          # nix-prefetch-url https://zxh404.gallery.vsassets.io/_apis/public/gallery/publisher/zxh404/extension/vscode-proto3/0.4.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "05da62iahnnjxkgdav14c1gn90lkgyk9gc5rardsqijx2x6dgjn0";
        }
        {
          name = "daml";
          version = "1.0.1";
          publisher = "digitalassetholdingsllc";
          # nix-prefetch-url https://digitalassetholdingsllc.gallery.vsassets.io/_apis/public/gallery/publisher/digitalassetholdingsllc/extension/daml/1.0.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "03wjfwacr7c1spvbwm2im6n36dy02vkbsca7bqznk7nv8lr2v6kk";
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
          version = "0.3.0";
          publisher = "ndmitchell";
          # nix-prefetch-url https://ndmitchell.gallery.vsassets.io/_apis/public/gallery/publisher/ndmitchell/extension/haskell-ghcid/0.3.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "029dwi0y5srn3s0d70m95lbn0jng22rnhcmx14s13dmh34hzm5vb";
        }
        {
          name = "better-align";
          version = "1.1.6";
          publisher = "wwm";
          # nix-prefetch-url https://wwm.gallery.vsassets.io/_apis/public/gallery/publisher/wwm/extension/better-align/1.1.6/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1ldvpava9xlqy3zwwc0c04pk9dh09jwcwz5lk3b2cr1z8bxn54lh";
        }
        {
          name = "ormolu-vscode";
          version = "0.0.5";
          publisher = "sjurmillidahl";
          # nix-prefetch-url https://sjurmillidahl.gallery.vsassets.io/_apis/public/gallery/publisher/sjurmillidahl/extension/ormolu-vscode/0.0.5/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "1yanvj50cg7n4sgfmbhmn74kfb3sqwfxmi67pjkimizd72cggi3r";
        }
      ];
   };
}
