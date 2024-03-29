
EcoVim = {
  colorscheme = 'tokyonight',
  ui = {
    float = {
      border = 'rounded'
    }
  },
  plugins = {
    completion = {
      select_first_on_enter = false
    },
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = {'.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile'} -- Default
    },
    zen = {
      kitty_enabled = false,
      enabled = true, -- sync after change
    },
  },
  statusline = {
    path_enabled = true,
    path = 'relative' -- absolute/relative
  },
  lsp = {
    virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
  },
}

