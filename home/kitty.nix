{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 14;
    };
    settings = {
      macos_titlebar_color = "background";
      background_opacity = 0.90;
      background_blur = 16;
      window_padding_width = 8;
    };
    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}
