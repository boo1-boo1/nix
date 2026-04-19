{
  pkgs,
  ...
}:
{
  programs = {
    neovim = {
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };

    lazyvim = {
      enable = true;

      extras = {
        coding.yanky.enable = true;

        dap = {
          core.enable = true;
          nlua.enable = true;
        };

        editor = {
          harpoon2.enable = true;
          refactor.enable = true;
        };

        formatting = {
          black.enable = true;
          prettier.enable = true;
        };

        linting.eslint.enable = true;

        ui.treesitter-context.enable = true;

        util = {
          dot.enable = true;
          mini_hipatterns.enable = true;
        };

        test.core.enable = true;

        lang = {
          git.enable = true;
          haskell.enable = true;
          json.enable = true;
          markdown.enable = true;
          nix.enable = true;
          python.enable = true;
          rust.enable = true;
          tailwind.enable = true;
          toml.enable = true;
          typescript.enable = true;
          yaml.enable = true;
        };
      };

      extraPackages = with pkgs; [
        bash-language-server
        shfmt
        haskell-language-server
        fourmolu
        hlint
        haskellPackages.hoogle
        haskellPackages.fast-tags
        haskellPackages.haskell-debug-adapter
        haskellPackages.ghci-dap
        vscode-langservers-extracted
        lua-language-server
        stylua
        marksman
        markdown-toc
        markdownlint-cli2
        nixd
        nixfmt
        statix
        pyright
        ruff
        rust-analyzer
        tailwindcss-language-server
        taplo
        vtsls
        yaml-language-server
        black
        prettier
      ];

      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        tmux
        graphql
      ];

      config.keymaps = /* lua */ ''
        vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/mux-sessionizer<CR>")
      '';

      plugins.lsp = /* lua */ ''
        return {
        	"neovim/nvim-lspconfig",
        	opts = {
        		servers = {
        			nil_ls = { enabled = false },
        			nixd = {},
        		},
        	},
        }
      '';

      plugins.colorscheme = /* lua */ ''
        return {
        	{
        		"catppuccin/nvim",
            name = "catppuccin",
            lazy = true,
            priority = 1000,
        		opts = {
        			transparent_background = true,
        			float = {
        				transparent = true,
        			},
        		},
        	},
        	{
        		"LazyVim/LazyVim",
        		opts = {
        			colorscheme = "catppuccin-mocha",
        		},
        	},
        }
      '';
    };
  };
}
