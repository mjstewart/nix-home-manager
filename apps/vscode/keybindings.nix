[
    {
        key = "ctrl+\\";
        command = "workbench.action.terminal.toggleTerminal";
        when = "terminal.active";
    }
    {
        key = "shift+ctrl+l";
        command = "workbench.action.nextEditor";
    }
    {
        key = "shift+ctrl+h";
        command = "workbench.action.previousEditor";
    }
    {
        key = "shift+meta+h";
        command = "workbench.action.moveEditorLeftInGroup";
    }
    {
        key = "shift+meta+l";
        command = "workbench.action.moveEditorRightInGroup";
    }
    {
        key = "ctrl+e";
        command = "workbench.files.action.focusFilesExplorer";
    }
    {
        key = "ctrl+h";
        command = "workbench.action.navigateLeft";
    }
    {
        key = "ctrl+l";
        command = "workbench.action.navigateRight";
    }
    {
        key = "ctrl+k";
        command = "workbench.action.navigateUp";
    }
    {
        key = "ctrl+j";
        command = "workbench.action.navigateDown";
    }
    {
        key = "ctrl+space ctrl+e";
        command = "workbench.action.toggleSidebarVisibility";
    }
    {
        key = "ctrl+b";
        command = "-workbench.action.toggleSidebarVisibility";
    }
    {
        key = "alt+enter";
        command = "editor.action.quickFix";
        when = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
    }
    {
        key = "ctrl+.";
        command = "-editor.action.quickFix";
        when = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
    }
]
