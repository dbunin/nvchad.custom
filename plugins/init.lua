local overrides = require "custom.plugins.overrides"

return {
  ["rcarriga/nvim-notify"] = {},
  -- Override plugin definition options
  ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard
  ["lukas-reineke/indent-blankline.nvim"] = { disable = false },
  ["folke/which-key.nvim"] = { disable = false },
  ["neovim/nvim-lspconfig"] = {
    requires = { "lukas-reineke/lsp-format.nvim" },
    -- on_attach = require("lsp-format").on_attach,
    config = function()
      require "custom.plugins.lspconfig"
    end,
  },
  -- overrde plugin configs
  ["nvim-telescope/telescope.nvim"] = {
    override_options = function()
      return {
        extensions_list = { "themes", "terms", "projects" },
        defaults = {
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      }
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  ["Olical/conjure"] = {
    ft = { "clojure", "funnel" },
    config = function()
      vim.cmd [[
        let g:conjure#mapping#doc_word = v:false
        let g:conjure#mapping#def_word= v:false
        let g:conjure#extract#tree_sitter#enabled = v:true
        let g:conjure#client#clojure#nrepl#test#raw_out = v:true
        let g:conjure#client#clojure#nrepl#eval#print_buffer_size = 8192
        let g:conjure#client#clojure#nrepl#test#runner = "kaocha"
        let g:conjure#client#clojure#nrepl#test#call_suffix = "{:kaocha/color? true :kaocha/reporter [kaocha.report/dots] :config-file \"tests.edn\"}"
        ]]
    end,
  },
  ["CosmicNvim/cosmic-ui"] = {
    requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("cosmic-ui").setup()
    end,
  },
  ["RRethy/vim-illuminate"] = {
    config = function()
      require("illuminate").configure {
        providers = { "lsp" },
      }
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end,
  },
  ["tpope/vim-dispatch"] = {},
  ["clojure-vim/vim-jack-in"] = {},
  ["radenling/vim-dispatch-neovim"] = {},
  ["guns/vim-sexp"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["tpope/vim-sexp-mappings-for-regular-people"] = {},
  ["rbgrouleff/bclose.vim"] = {},
  ["francoiscabrol/ranger.vim"] = {},
  -- ["eraserhd/parinfer-rust"] = {
  --   run = "cargo build --release",
  -- },

  -- postgresql://cockpit:Vut6QuinAd=@127.0.0.1:4335/cockpit
  -- folding
  ["kevinhwang91/nvim-ufo"] = {
    requires = {
      "kevinhwang91/promise-async",
      -- TODO: statuscol requires nvim 0.9
      -- {
      --   "luukvbaal/statuscol.nvim",
      --   config = function()
      --     require("statuscol").setup(
      --       {
      --         foldfunc = "builtin",
      --         setopt = true
      --       }
      --     )
      --   end
      -- }
    },
    config = function()
      require("ufo").setup()
    end,
  },
  -- motions
  ["justinmk/vim-sneak"] = {},
  ["TimUntersberger/neogit"] = {},
  ["windwp/nvim-autopairs"] = {
    config = function()
      require("plugins.configs.others").autopairs()
      require("nvim-autopairs").get_rule("'")[1].not_filetypes =
      { "scheme", "lisp", "clojure", "clojurescript", "fennel" }
    end,
  },
  ["simrat39/rust-tools.nvim"] = {
    requires = { "lukas-reineke/lsp-format.nvim" },
    after = "nvim-lspconfig",
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(client)
            require("lsp-format").on_attach(client)
          end,
        },
      })
    end,
  },
  -- database
  ["tpope/vim-dadbod"] = {},
  ["kristijanhusak/vim-dadbod-ui"] = {},
  ["kristijanhusak/vim-dadbod-completion"] = {},
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
