{ config, pkgs, inputs, system, services, ... }:

{
  #imports = [ inputs.flatpaks.homeManagerModules.nix-flatpak ];

  home.username = "alan";
  home.homeDirectory = "/home/alan";

  home.packages = with pkgs; [
    nnn # terminal file manager

    zip
    xz
    unzip
    p7zip

    eza # A modern replacement for ‘ls’

    which
    nix-output-monitor
    lsof
    ethtool
    pciutils
    usbutils

    code-cursor
  ];

  services.flatpak.packages = [
    "app.zen_browser.zen"
  ];

  programs.git = {
    enable = true;
    userName = "Alan";
    userEmail = "dev@alanj.in";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';

    shellAliases = {
      vim = "nvim";
    };
  };

  home.stateVersion = "25.05";
}
