{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    
    extraPackages = with pkgs; [
      rust-analyzer
      clang-tools
      pyright
      nixd
      lua-language-server
      ripgrep
      fd
    ];

    plugins = with pkgs.vimPlugins; [
      #vim-sleuth
      #plenary-nvim
      #telescope-nvim
      #cmp-nvim-lsp
      #cmp-buffer
      { plugin = nvim-treesitter.withAllGrammars; type = "lua"; config = "require('nvim-treesitter.configs').setup { highlight = { enable = true }, indent = { enable = true } }"; }
      #{ plugin = nvim-lspconfig;  type = "lua"; config = builtins.readFile ./lsp.lua; }
      #{ plugin = nvim-cmp;        type = "lua"; config = builtins.readFile ./cmp.lua; }
      #{ plugin = gitsigns-nvim;   type = "lua"; config = "require('gitsigns').setup()"; }
      #{ plugin = mini-nvim;       type = "lua"; config = builtins.readFile ./mini.lua; }
    ];

    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
