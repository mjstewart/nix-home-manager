{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    defaultKeymap = "vicmd";

    shellAliases = {
      mci = "mvn clean install -DskipTests";
      mcit = "mvn clean install";
      mcp = "mvn clean package -DskipTests";
      mcpt = "mvn clean package";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
  };
}
