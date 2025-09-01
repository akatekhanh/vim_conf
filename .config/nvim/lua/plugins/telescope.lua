return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      -- Override default options
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        -- Layout configuration
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        -- Search configuration
        file_ignore_patterns = { "node_modules", "%.git/", "%.cache", "%.DS_Store" },
        hidden = true,
        no_ignore = false,

        -- Sorting
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,

        -- Preview
        preview = {
          timeout = 500,
          filesize_limit = 1, -- MB
        },

        -- Mappings
        mappings = vim.tbl_deep_extend("force", opts.defaults.mappings or {}, {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },
          n = {
            ["q"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        }),
      })

      -- Pickers configuration
      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        find_files = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["d"] = actions.delete_buffer,
            },
          },
        },
        live_grep = {
          only_sort_text = true,
          theme = "dropdown",
        },
        grep_string = {
          only_sort_text = true,
          theme = "dropdown",
        },
        lsp_references = {
          theme = "dropdown",
          initial_mode = "normal",
        },
        lsp_definitions = {
          theme = "dropdown",
          initial_mode = "normal",
        },
        lsp_declarations = {
          theme = "dropdown",
          initial_mode = "normal",
        },
        lsp_implementations = {
          theme = "dropdown",
          initial_mode = "normal",
        },
      })

      -- Extensions
      opts.extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      }

      return opts
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- Load extensions
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")
    end,
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },

  -- Telescope UI Select extension for better UI
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}