{ config, pkgs, ... }:

{
  home.username = "Christian";
  home.homeDirectory = "/home/christian";

  home.packages = with pkgs; [
    # Desktop software
    (discord.override { nss = nss_latest; })
    firefox
    mailspring
    alacritty
    bitwarden
    notion-app-enhanced
    spotify

    # Programming
    dotnet-sdk
    vscode
    insomnia

    # CLI tools
    exa
  ];

  programs.git = {
    enable = true;
    userName  = "Christian Sheridan";
    userEmail = "christiansheridan@outlook.com";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ls = "exa -l --icons --group-directories-first --header --git";
      la = "exa -la --icons --group-directories-first --header --git";
    };
    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };

  xdg.configFile.alacritty = {
    source = ./config/alacritty;
    recursive = true;
  };

  xdg.configFile.flameshot = {
    source = ./config/flameshot;
    recursive = true;
  };
  
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
