{ lib }:

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

    ghcid.command = lib.strings.concatStringsSep " " [
      "--command=cabal repl"
      "-S --clear --no-height-limit --reverse-errors"
      "--topmost"
      "--color=always"
    ];
  };

  snippets = {
    "exercise ignore contract id" = {
      prefix = "exercise_";
      body = [
        "exercise_ \${1:contractId} \${2:Transfer} with \${3:newOwner} = \${4:value}"
        "$5"
      ];
    };
  };
}
