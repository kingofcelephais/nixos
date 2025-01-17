{ pkgs, inputs, lib, config, ... }:

{
  options = { neovim.enable = lib.mkEnableOption "enables neovim"; };
  config = lib.mkIf config.neovim.enable {
    nixpkgs = {
      overlays = [
        (final: prev: {
          vimPlugins = prev.vimPlugins // {
            neopywal-nvim = prev.vimUtils.buildVimPlugin {
              name = "neopywal";
              src = inputs.plugin-neopywal;
            };
          };
        })
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        lua-language-server
        lua54Packages.luacheck
        stylua

        haskell-language-server
        hlint
        stylish-haskell

        nixd
        nixfmt-classic

        clang-tools
        prettierd
        rustfmt
        rust-analyzer

        pylyzer
        pylint
        black

        yaml-language-server
        yamllint
        yamlfmt

        ocamlPackages.ocaml-lsp
        ocamlPackages.ocamlformat

        gopls

        wl-clipboard

      ];

      plugins = with pkgs.vimPlugins; [

        telescope-fzf-native-nvim
        lualine-nvim
        nvim-web-devicons
        neodev-nvim
        vim-nix
        nvim-jdtls

        {
          plugin = nvim-tree-lua;
          type = "lua";
          config = builtins.readFile ./lua/plugins/nvimtree.lua;
        }

        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile ./lua/plugins/lsp.lua;
        }

        plenary-nvim

        {
          plugin = formatter-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/formatter.lua;
        }

        {
          plugin = nvim-lint;
          type = "lua";
          config = builtins.readFile ./lua/plugins/lint.lua;
        }

        {
          plugin = comment-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/comment.lua;
        }

        {
          plugin = nvim-treesitter.withAllGrammars;
          type = "lua";
          config = builtins.readFile ./lua/plugins/treesitter.lua;
        }

        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/telescope.lua;
        }

        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./lua/plugins/cmp.lua;
        }

        {
          plugin = nvim-scrollbar;
          type = "lua";
          config = builtins.readFile ./lua/plugins/scrollbar.lua;
        }

        {
          plugin = indent-blankline-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/ibl.lua;
        }

        {
          plugin = lualine-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/lualine.lua;
        }

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/gitsigns.lua;
        }

        cmp_luasnip
        cmp-nvim-lsp
        cmp-buffer
        cmp-cmdline
        cmp-path

        fuzzy-nvim
        cmp-fuzzy-buffer

        luasnip
        friendly-snippets
        coc-snippets

        {
          plugin = bufferline-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/bufferline.lua;
        }

        {
          plugin = toggleterm-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/term.lua;
        }

        {
          plugin = neopywal-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/neopywal.lua;
        }

        {
          plugin = nvim-colorizer-lua;
          type = "lua";
          config = builtins.readFile ./lua/plugins/colorizer.lua;
        }

      ];

      extraLuaConfig = ''
        ${builtins.readFile ./lua/options.lua}
        ${builtins.readFile ./lua/keymaps.lua}
      '';
    };
  };
}
