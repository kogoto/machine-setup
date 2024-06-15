return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    }
  },
  config = function()
    require('telescope').setup{
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--trim',
      },
      defaults = {
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
        },
        mappings = {
          i = {
            ["<CR>"] = function(prompt_bufnr)
              local action_state = require('telescope.actions.state')
              local actions = require('telescope.actions')
              local nvim_tree = require('nvim-tree.api')

              local selected_entry = action_state.get_selected_entry()
              local filename = selected_entry.filename or selected_entry[0]

              actions.close(prompt_bufnr)

              vim.cmd(string.format("edit %s", filename))

              nvim_tree.tree.open()
              nvim_tree.tree.find_file(filename)
              nvim_tree.node.open.edit()
            end
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        }
      },
      cache_picker = {
        num_pickers = 10,
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }
    }
    require('telescope').load_extension('fzf')
  end
}

