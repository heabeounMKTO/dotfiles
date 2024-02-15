lvim.plugins={
-- {
--   'wfxr/minimap.vim',
--   build = "cargo install --locked code-minimap",
--   cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
--   config = function ()
--     vim.cmd ("let g:minimap_width = 10")
--     vim.cmd ("let g:minimap_auto_start = 1")
--     vim.cmd ("let g:minimap_auto_start_win_enter = 1")
--   end,
-- },
  {'crispybaccoon/evergarden'},
  {"xero/miasma.nvim"},
  {"sainnhe/everforest",
    background="soft"},
  {
      "folke/lsp-colors.nvim",
      event = "BufRead",
    },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
    require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,        -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,              -- Function to run after the scrolling animation ends
          })
    end
  },

  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
     require("nvim-lastplace").setup({
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = {
       "gitcommit", "gitrebase", "svn", "hgcommit",
      },
      lastplace_open_folds = true,
     })
    end,
   },
 {
    'junegunn/vim-easy-align'
  },

}
vim.opt.number = true
vim.opt.wrap = true
vim.cmd("let g:everforest_background = 'hard'") --contrast settings (everforest)
vim.cmd("set background=light") --background color (everforest)
vim.cmd("let g:everforest_better_performance = 1")
lvim.colorscheme = "everforest"
lvim.builtin.lualine.style = "default"
-- lvim.builtin.alpha.dashboard.section.header.val = {
-- [[ █ ▄███▄   ██   ███   ▄███▄   ████▄   ▄      ▄]],   ▄    
-- █   █ █▀   ▀  █ █  █  █  █▀   ▀  █   █    █      █  
-- ██▀▀█ ██▄▄    █▄▄█ █ ▀ ▄ ██▄▄    █   █ █   █ ██   █ 
-- █   █ █▄   ▄▀ █  █ █  ▄▀ █▄   ▄▀ ▀████ █   █ █ █  █ 
--    █  ▀███▀      █ ███   ▀███▀         █▄ ▄█ █  █ █ 
--   ▀             █                       ▀▀▀  █   ██ 
--                ▀                                    

-- }
-- lvim.transparent_window = true

-- enable treesitter integration
