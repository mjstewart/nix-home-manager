{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

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
        fontFamily = "Fira Code";
        fontLigatures = true;
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
  }