{
  lib,
  ...
}:
{
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      presets = [ "jetpack" ];
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;

      antidote = {
        enable = true;
        plugins = [
          "mattmc3/ez-compinit"
          "zsh-users/zsh-completions"
          "zsh-users/zsh-autosuggestions kind:defer"
          "zdharma-continuum/fast-syntax-highlighting kind:defer"
          "zsh-users/zsh-history-substring-search kind:defer"
        ];
      };

      shellAliases = {
        l = "colorls --git-status --sort-files --report -all --long";
        ls = "colorls --git-status --sort-files --report";
        mux = "tmuxinator";
      };

      initContent = lib.mkMerge [
        (lib.mkOrder 500 /* bash */ ''
          # nix-your-shell
          nix-your-shell zsh | source /dev/stdin
        '')
        (lib.mkOrder 1000 /* bash */ ''
          # zsh-autosuggestions
          bindkey '^ ' autosuggest-accept

          # tmuxinator
          bindkey -s ^f "mux-sessionizer\n"
        '')
      ];
    };

  };
}
