{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
  #  haskell.enable = true;
  #  haskell.hie.enable = true;

    userSettings = {

      telemetry = {
        enableCrashReporter = false;
        enableTelemetry = false;
      };

      files = {
        autoSave = "afterDelay";
        trimFinalNewlines = true;
        insertFinalNewline = true;
        trimTrailingWhitespace = true;

        exclude = {
          "**/.bazel-cache" = true;
          "**/bazel*" = true;
          "**/bower_cmponents" = true;
          "**/node_moules" = true;
        };

        watcherExclude = {
          "**/.bazel-cache" = true;
          "**/bazel*" = true;
        };
      };

      editor = {
        tabSize = 2;
        accessibilitySupport = "off";
        minimap.enabled = false;
        formatOnPaste = true;
        formatOnSave = true;
        # fontFamily = "Fira Code";
        # fontLigatures = true;
        cursorBlinking = "solid";
      };

      workbench = {
        editor = {
          highlightModifiedTabs = true;
        };
      };

      search = {
        location = "panel";
      };

      daml = {
        telemetry = "Disable";
        debug = true;
      };

      extensions = {
        ignoreRecommendations = true;
      };
    };

    extensions = with pkgs.vscode-extensions; [
      alanz.vscode-hie-server
      bbenoist.Nix
      justusadam.language-haskell
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vim";
          version = "1.10.2";
          publisher = "vscodevim";
          # nix-prefetch-url https://vscodevim.gallery.vsassets.io/_apis/public/gallery/publisher/vscodevim/extension/vim/1.10.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "0nvn4kv0dsqd67qz49jxrn0lyqvs63g1ahqbf16qcj9pzzkhk4y7";
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
          version = "0.9.0";
          publisher = "redhat";
          # nix-prefetch-url https://redhat.gallery.vsassets.io/_apis/public/gallery/publisher/redhat/extension/vscode-xml/0.9.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "0v29ap0y1fbvfi9m29v5n00x8r75l5dd5dshhmw3psl47b61fp9h";
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
          version = "0.13.25";
          publisher = "digitalassetholdingsllc";
          # nix-prefetch-url https://digitalassetholdingsllc.gallery.vsassets.io/_apis/public/gallery/publisher/digitalassetholdingsllc/extension/daml/0.13.25/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "0b1qag04j3zwvgln1x16z75y5gp22y5ixvdfrflzh7bgcclddnah";
        }
        {
          name = "dhall-lang";
          version = "0.0.4";
          publisher = "panaeon";
          # nix-prefetch-url https://panaeon.gallery.vsassets.io/_apis/public/gallery/publisher/panaeon/extension/dhall-lang/0.0.4/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "0qcxasjlhqvl5zyf7w9fjx696gnianx7c959g2wssnwyxh7d14ka";
        }
        {
          name = "vscode-dhall-lsp-server";
          version = "0.0.4";
          publisher = "panaeon";
          # nix-prefetch-url https://panaeon.gallery.vsassets.io/_apis/public/gallery/publisher/panaeon/extension/vscode-dhall-lsp-server/0.0.4/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
          sha256 = "0ws2ysra5iifhqd2zf7zy2kcymacr5ylcmi1i1zqljkpqqmvnv5q";
        }
      ];
  };
}
