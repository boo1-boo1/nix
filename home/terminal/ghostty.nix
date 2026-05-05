{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package =
      if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then pkgs.ghostty else pkgs.emptyDirectory;
    enableZshIntegration = true;
    settings = {
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 14;
      theme = "Catppuccin Mocha";
      window-colorspace = "display-p3";
      window-padding-x = 8;
      window-padding-y = 8;
      macos-titlebar-style = "hidden";
    };
  };
}
