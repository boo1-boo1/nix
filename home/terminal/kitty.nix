{ pkgs, ... }:
{
  programs.kitty = {
    enable = false;
    package =
      if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then pkgs.ghostty else pkgs.emptyDirectory;
    themeFile = "Catppuccin-Mocha";
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 14;
    };
    settings = {
      macos_titlebar_color = "background";
      window_padding_width = 8;
    };
    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}
