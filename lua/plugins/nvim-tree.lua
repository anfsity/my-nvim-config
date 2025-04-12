vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 -- 修正拼写

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "before",
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = true,
          color = true,
        }
      },

    },
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})
