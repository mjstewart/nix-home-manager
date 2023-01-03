{ zsh }:

{
  settings = {
    telemetry = {
      enableCrashReporter = false;
      enableTelemetry = false;
    };

    files = {
      autoSave = "afterDelay";
      trimFinalNewlines = true;
      insertFinalNewline = true;
      trimTrailingWhitespace = true;
    };

    exclude = {
      "**/node_modules" = true;
    };

    editor = {
      tabSize = 2;
      rulers = [ 120 ];
      accessibilitySupport = "off";
      minimap.enabled = false;
      formatOnPaste = true;
      formatOnSave = true;
      cursorBlinking = "solid";
      lineNumbers = "relative";
      renderControlCharacters = "true";
      renderWhitespace = "boundary";
    };

    workbench = {
      editor = {
        highlightModifiedTabs = true;
        enablePreview = false;
      };
      panel.defaultLocation = "right";
      tree.indent = 20;
    };

    search = {
      location = "panel";
    };

    extensions = {
      ignoreRecommendations = true;
    };

    update.mode = "none";

    terminal.integrated = {
      shell.linux = "${zsh}/bin/zsh";
      copyOnSelection = true;
    };
    alignment.operatorPadding = "left";

    haskell = {
      formattingProvider = "stylish-haskell";
    };
  };
}
