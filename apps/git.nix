{ google-chrome, meld }:

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
        browser = "${google-chrome}/bin/google-chrome";
      };
      core = {
        editor = "vim";
      };
      diff = {
        tool = "meld";
      };
      difftool = {
        prompt = false;
        cmd = "${meld}/bin/meld $LOCAL $REMOTE";
      };
      merge = {
        tool = "meld";
      };
      mergetool = {
        cmd = "${meld}/bin/meld $LOCAL $MERGED $REMOTE";
        keepBackup = false;
      };
    };
  };
}
