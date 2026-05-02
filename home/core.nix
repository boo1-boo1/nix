{
  pkgs,
  ...
}:
{
  home = {
    sessionPath = [ "$HOME/.local/bin" ];

    file = {
      mux-sessionizer = {
        enable = true;
        executable = true;
        source = ./scripts/mux-sessionizer;
        target = ".local/bin/mux-sessionizer";
      };
    };

    packages = with pkgs; [
      colorls
      fzf
    ];

    stateVersion = "25.11";
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "Bhuvan Natesh";
          email = "bhuvan.natesh@gmail.com";
        };
        commit.gpgsign = true;
      };
    };

    gpg.enable = true;

    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "github.com" = {
          addKeysToAgent = "yes";
          identityFile = "~/.ssh/id_ed25519";
        };
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
