{ lib, zsh }:

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
      "**/.bazel-cache" = true;
      "**/bazel*" = true;
      "**/bower_components" = true;
      "**/node_modules" = true;
    };

    watcherExclude = {
      "**/.bazel-cache" = true;
      "**/bazel*" = true;
    };

    editor = {
      tabSize = 2;
      accessibilitySupport = "off";
      minimap.enabled = false;
      formatOnPaste = true;
      formatOnSave = true;
      cursorBlinking = "solid";
      lineNumbers = "relative";
    };

    workbench = {
      editor = {
        highlightModifiedTabs = true;
      };
      panel.defaultLocation = "right";
      tree.indent = 20;
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

    update.mode = "none";

    terminal.integrated.shell.linux = "${zsh}/bin/zsh";
    alignment.operatorPadding = "left";
  };

  snippets = {
    "exercise ignore contract id" = {
      scope = "daml";
      prefix = "exercise_";
      body = [
        "exercise \${1:contractId} \${2:Transfer} with \${3:newOwner} = \${4:value}"
        "$5"
      ];
    };
  };

  keybindings = [
    {
      key = "ctrl+,";
      command = "workbench.action.focusActiveEditorGroup";
      when ="terminalFocus";
    }
    {
      key = "ctrl+,";
      command = "workbench.action.terminal.focus";
      when = "!terminalFocus";
    }
  ];
}
