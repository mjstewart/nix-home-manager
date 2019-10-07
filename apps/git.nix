{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Matt Stewart";
    userEmail = "smtp.matt@gmail.com";
    aliases = {
      	st = "status";
	      co = "checkout";
        br = "branch";
        f = "fetch";
        m = "merge";
	      lg = "log --graph --format='%Cred%h%Creset  %<|(15) %C(white)%s %<|(35) %Creset %Cgreen(%cr)%<|(55)  %C(blue)<%an>%Creset%C(yellow)%d%Creset'";
    };
    extraConfig = {
      web = {
        browser = "${pkgs.google-chrome}/bin/google-chrome";
      };
      core = {
        editor = "${pkgs.vscode}/bin/code --wait";
      };
      diff = {
        tool = "meld";
      };
      difftool = {
        prompt = false;
        cmd = "${pkgs.meld}/bin/meld $LOCAL $REMOTE";
      };
      merge = {
        tool = "meld";
      };
      mergetool = {
        cmd = "${pkgs.meld}/bin/meld $LOCAL $MERGED $REMOTE";
        keepBackup = false;
      };
    };

    ignores = [
      "*.swp"
      "*~"
      "#*"
      ".DS_Store"
    ];
  };
}
