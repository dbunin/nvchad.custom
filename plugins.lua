local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  { "lukas-reineke/indent-blankline.nvim", enabled = true },
  { "folke/which-key.nvim",                enabled = true },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "lukas-reineke/lsp-format.nvim",
      "rcarriga/nvim-notify",
      {
        "RRethy/vim-illuminate",
        config = function()
          require("illuminate").configure {
            providers = { "lsp" },
          }
          vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
          vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
          vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
        end,
      },

      {
        "simrat39/rust-tools.nvim",
        config = function()
          require("rust-tools").setup({
            server = {
              on_attach = function(client)
                require("lsp-format").on_attach(client)
              end,
            },
          })
        end,
      } },
    config = function()
      require "custom.configs.lspconfig"
    end,
  },
  -- overrde plugin configs
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "cljoly/telescope-repo.nvim",
      {
        'notjedi/nvim-rooter.lua',
        config = function() require 'nvim-rooter'.setup() end
      }
    },
    opts = overrides.telescope,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "williamboman/mason.nvim",
    override_options = overrides.mason,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "Olical/conjure",
    ft = { "clojure", "funnel" },
    config = function()
      -- vim.cmd [[
      --   let g:conjure#mapping#doc_word = v:false
      --  let g:conjure#mapping#def_word= v:false
      -- let g:conjure#extract#tree_sitter#enabled = v:true
      --   let g:conjure#client#clojure#nrepl#test#raw_out = v:true
      --   let g:conjure#client#clojure#nrepl#eval#print_buffer_size = 8192
      --   let g:conjure#client#clojure#nrepl#test#runner = "kaocha"
      --   let g:conjure#client#clojure#nrepl#test#call_suffix = "{:kaocha/color? true :kaocha/reporter [kaocha.report/dots] :config-file \"tests.edn\"}"
      --   ]]
    end,
  },
  -- {
  --   "CosmicNvim/cosmic-ui",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("cosmic-ui").setup()
  --   end,
  -- },
  {
    "clojure-vim/vim-jack-in",
    ft = { "clojure", "funnel" },
    dependencies = {
      "tpope/vim-dispatch",
      "radenling/vim-dispatch-neovim",
    }
  },
  {
    "guns/vim-sexp",
    ft = { "clojure", "funnel" },
    dependencies = {
      "tpope/vim-repeat",
      "tpope/vim-surround",
      "tpope/vim-sexp-mappings-for-regular-people",
    }
  },
  -- "francoiscabrol/ranger.vim",
  -- ["eraserhd/parinfer-rust"] = {
  --   run = "cargo build --release",
  -- },

  -- postgresql://cockpit:Vut6QuinAd=@127.0.0.1:4335/cockpit
  -- folding
  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = {
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
  {
    "justinmk/vim-sneak",
    lazy = false
  },
  {
    "TimUntersberger/neogit",
    lazy = false
  },
  {
    "windwp/nvim-autopairs",
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      --require("plugins.configs.others").autopairs()
      require("nvim-autopairs").get_rule("'")[1].not_filetypes =
      { "scheme", "lisp", "clojure", "clojurescript", "fennel" }
    end,
  },
  -- database
  -- "tpope/vim-dadbod",
  -- "kristijanhusak/vim-dadbod-ui",
  -- "kristijanhusak/vim-dadbod-completion",
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins
