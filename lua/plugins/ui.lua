return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = { show_hidden = true },
      sort = {
        { "name", "asc" },
      },
    },
    init = function()
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>" },
      { "<leader>bb", ":tabnew<Return>", desc = "Create a new tab page" },
      { "<leader>bd", ":tabclose<Return>", desc = "Close the current tab page" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "meuter/lualine-so-fancy.nvim",
    },
    enabled = true,
    lazy = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    config = function()
      -- local icons = require("config.icons")
      require("lualine").setup({
        options = {
          theme = "auto",
          -- theme = "catppuccin",
          globalstatus = true,
          icons_enabled = true,
          -- component_separators = { left = "│", right = "│" },
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "alfa-nvim",
              "help",
              "neo-tree",
              "Trouble",
              "spectre_panel",
              "toggleterm",
            },
            winbar = {},
          },
        },
        sections = {
          lualine_a = {},
          lualine_b = {
            "fancy_branch",
          },
          lualine_c = {
            {
              "filename",
              path = 1, -- 2 for full path
              symbols = {
                modified = "  ",
                -- readonly = "  ",
                -- unnamed = "  ",
              },
            },
            {
              "fancy_diagnostics",
              sources = { "nvim_lsp" },
              symbols = { error = " ", warn = " ", info = " " },
            },
            { "fancy_searchcount" },
          },
          lualine_x = {
            "fancy_lsp_servers",
            "fancy_diff",
            "progress",
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          -- lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "neo-tree", "lazy" },
      })
    end,
  },
  -- -- filename
  -- {
  --   "b0o/incline.nvim",
  --   -- dependencies = { "craftzdog/solarized-osaka.nvim" },
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     -- local colors = require("solarized-osaka.colors").setup()
  --     require("incline").setup({
  --       highlight = {
  --         groups = {
  --           -- InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
  --           -- InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
  --           InclineNormal = { guibg = "#1d2021", guifg = "#f2e5bc" },
  --           InclineNormalNC = { guibg = "#1d2021", guifg = "#7c6f64" },
  --         },
  --       },
  --       window = { margin = { vertical = 0, horizontal = 1 } },
  --       hide = {
  --         cursorline = true,
  --       },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --         if vim.bo[props.buf].modified then
  --           filename = "[+] " .. filename
  --         end
  --
  --         local icon, color = require("nvim-web-devicons").get_icon_color(filename)
  --         return { { icon, guifg = color }, { " " }, { filename } }
  --       end,
  --     })
  --   end,
  -- },
}
