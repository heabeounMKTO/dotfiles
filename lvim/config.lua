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
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
{'nvim-lua/plenary.nvim'},
-- install without yarn or npm
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
},
{"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
{'nvim-telescope/telescope.nvim'},
  {'crispybaccoon/evergarden'},
  {'jiangmiao/auto-pairs'},
  {'dapt4/vim-autoSurround'},
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
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
},
}
pcall(function()
  require("rust-tools").setup {
    tools = {
      executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
      reload_workspace_from_cargo_toml = true,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = false,
        parameter_hints_prefix = "<-",
        other_hints_prefix = "=>",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
      hover_actions = {
        border = "rounded",
      },
      on_initialized = function()
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
          pattern = { "*.rs" },
          callback = function()
            local _, _ = pcall(vim.lsp.codelens.refresh)
          end,
        })
      end,
    },
    dap = {
      -- adapter= codelldb_adapter,
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
      on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        local rt = require "rust-tools"
        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      end,

      capabilities = require("lvim.lsp").common_capabilities(),
      settings = {
        ["rust-analyzer"] = {
          lens = {
            enable = true,
          },
          cargo = {
            features = "all",
          },
          diagnostics = {
            disabled = "inactive-code"
          },
          checkOnSave = {
            enable = true,
            features = "all",
            command = "clippy",
          },
        },
      },
    },
  }
end)

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "rust",
  "toml",
}
lvim.builtin.project.manual_mode = true
vim.opt.number = true
vim.opt.wrap = true
-- vim.cmd("let g:mkdp_browser = '/usr/bin/google-chrome'")
-- vim.cmd("let g:mkdp_open_ip = 'localhost:8894'")
vim.cmd.colorscheme "catppuccin"
-- vim.cmd("let g:everforest_background = 'hard'") --contrast settings (everforest)
-- vim.cmd("set background=dark") --background color (everforest)
-- vim.cmd("let g:everforest_better_performance = 1")
-- lvim.colorscheme = "everforest"
-- lvim.colorscheme = "everforest"
lvim.builtin.lualine.style = "default"
-- lvim.builtin.alpha.dashboard.section.header.val = {
-- [[                                                                                    ...        ]],              [[                                                                            .,:loxkO00K0Oko:.   ]],
-- [[                                                                    .':ox0XWMMMMMMMMMMMMMW0:  ]],
-- [[                                                                .':okKNMMMMMMMMMMMMMMMMMMMMMK; ]],
-- [[                                                            .,lx0XWNNXXXXNNWMMMMMMMMMMMMMMMMWo ]],
-- [[                                                        ..,codxdoc:,'......';:okKWMMMMMMMMMMMWo ]],
-- [[                                                    ..',;;'..                  .:OWMMMMMMMMMNc ]],
-- [[                                                    ..                            .cXMMMMMMMM0' ]],
-- [[ ___       ___  ___  ________   ________  ________  ___      ___ ___  _____ ______ cXMMMMMMNl   ]],    
-- [[|\  \     |\  \|\  \|\   ___  \|\   __  \|\   __  \|\  \    /  /|\  \|\   _ \  _   \.dWMMMMWk. ]],     
-- [[\ \  \    \ \  \\\  \ \  \\ \  \ \  \|\  \ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \:XMMM:      ]],
-- [[ \ \  \    \ \  \\\  \ \  \\ \  \ \   __  \ \   _  _\ \  \/  / / \ \  \ \  \\|__| \  \:XM:  ]],
-- [[  \ \  \____\ \  \\\  \ \  \\ \  \ \  \ \  \ \  \\  \\ \    / /   \ \  \ \  \    \ \  \X: ]],
-- [[   \ \_______\ \_______\ \__\\ \__\ \__\ \__\ \__\\ _\\ \__/ /     \ \__\ \__\    \ \__\]],
-- [[    \|_______|\|_______|\|__| \|__|\|__|\|__|\|__|\|__|\|__|/       \|__|\|__|     \|__|]],
-- [[                                   vscode , but with extra steps                           ]],    
-- }

-- lvim.builtin.alpha.dashboard.section.header.val = {
-- [[                                         heabeoun's LunarVim                   ]],                                                                                                 
-- [[                                         ███▄ ▄███▓ ██ ▄█▀▄▄▄█████▓ ▒█████     ]],                           
-- [[                            /(           ▓██▒▀█▀ ██▒ ██▄█▒ ▓  ██▒ ▓▒▒██▒  ██▒  ]],                         
-- [[                          #%%(((&        ▓██    ▓██░▓███▄░ ▒ ▓██░ ▒░▒██░  ██▒  ]],                         
-- [[                          ////((/        ▒██    ▒██ ▓██ █▄ ░ ▓██▓ ░ ▒██   ██░  ]],                       
-- [[                          (#%%#%         ▒██▒   ░██▒▒██▒ █▄  ▒██▒ ░ ░ ████▓▒░  ]],                       
-- [[                        *%%%&@#(         ░ ▒░   ░  ░▒ ▒▒ ▓▒  ▒ ░░   ░ ▒░▒░▒░   ]],                        
-- [[                       #%&&&%%&%&&*      ░  ░      ░░ ░▒ ▒░    ░      ░ ▒ ▒░   ]],                         
-- [[                       *#%%@&&&&@@@%%    ░      ░   ░ ░░ ░   ░      ░ ░ ░ ▒    ]],                        
-- [[                       /&&##&&&&@@@@%%#/.       ░   ░  ░                ░ ░    ]],
-- [[                 ,*//( /%&&&#,/(##(/(.,.,  ,,                                  ]],
-- [[                 &#,.@&%#&&&&&%%&%@@@@@@*..(%  .,                              ]],
-- [[                 ,%&%%/%&##%(#%%&((&@@%/(#//(%&#.*/                            ]],
-- [[                ,,,*(#&#%%#(///&@%%#(((////#@@&///(((((#*                      ]],
-- [[             .,/#,,,*%#((&&#((*,*&%#((&%%&&@#//(&@@%.*//*,                     ]],
-- [[            %.   #**,*(%&&@@@#////@@&%&@@@@@@%#@@%#,,(#%(.*(/*                 ]],
-- [[             &@&@&##%%%&@@@@@@&##/@@@&&@@@@@@@@# .(%, %@&.@#*(#                ]],
-- [[            (((((#((#%&@@@&&&@(((@@@#%@@@@@@@@&.* #&.   (@@&*(#                ]],
-- [[              #&&&#(#(###@&##*,/((#&%&@@@@@@@@@#.(%(*,* ..,./,(&               ]],               
-- [[                **#@@@@((#&&@@@*,/((&@@@@@@@@@&&%../*,/*.*///,#%%              ]],
-- [[                &(&%@@@(((@#&/*(%%*/(/.(@@@@&/*@%* .,///, ,.#%#                ]],
-- [[                 ,@@@*  %%(/((,/#(&(**#&(&@#      *#*   ,(#&*                  ]],
-- [[                         &#&#(&(*((#&@&*                                       ]],     
-- [[                        /#%%&%####@@/                                          ]],
-- [[                             ,&&&@(  ]]                                 
--                                                                       
-- }

lvim.builtin.alpha.dashboard.section.header.val = {




      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣤⣴⣦⣶⣶⣶⣶⣦⣦⣤⣤⣄⣀⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⡶⠿⠟⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠛⠛⠻⠶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡾⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⡿⢿⠀⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⠿⢏⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢻⣷⡄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡿⢯⠐⠃⠀⠀⠀⠀⠀⢠⣀⣠⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣾⠯⠴⠏⠀⠀⠀⠀⠀⠀⢀⣾⠟⠉⠉⢻⡧⠀⠀⠀⠀⠀⠀⣸⣶⠶⠶⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⠁⠗⠀⠀⠀⠀⠀⠀⠀⢰⣿⠋⠠⠀⠀⣼⡇⠀⠀⠀⠀⠀⣾⠟⠁⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠙⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⠢⠴⠀⠀⠀⠀⠀⠀⠀⠀⣾⣏⠀⢠⢀⣰⣿⠃⠀⠀⠀⠀⢰⣿⠀⠀⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢼⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⢴⣿⣿⣦⣤⣿⣿⡏⡄⠀⠀⠠⠀⣿⣯⠀⢰⢸⣶⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠅⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠃⠀⠀⣠⣤⠤⣤⣄⠀⠀⢈⣾⣿⣿⣿⣿⣿⡿⠖⠀⠀⠀⢰⣤⣿⣿⣿⣶⣿⣿⡟⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⣠⡶⠉⠄⡐⠠⠙⠻⣦⢸⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⠇⠉⠀⠀⠀⡀⢠⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣸⡿⠀⠀⢿⠁⠌⡐⢀⠂⡐⢀⣿⠻⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⠀⠀⣤⠄⠒⢈⠀⠄⠉⠻⢷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⢀⣄⣠⣧⣿⣧⠀⠀⢸⣦⠐⠀⠄⠂⠄⠈⠀⠀⠙⢿⣿⣿⠿⠁⠀⣀⡀⠀⢠⠰⣿⣿⣿⣷⣯⣿⡇⠀⠠⡏⠠⠈⠄⡈⠄⡁⢂⠈⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⢀⣴⣾⣿⠿⠉⣿⢿⠀⠀⠀⠉⠛⠛⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣰⣿⠀⠀⢹⣿⡿⠟⠋⠀⠀⢐⠠⠀⡁⠄⠠⠐⢀⠂⡐⢺⣿⠇⠀⠀⠀⠀⠀⠀⠀⣧⣤⣤⣿⣇⡀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⢀⣾⡿⡀⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡿⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⣆⠀⠆⢁⠰⠀⠆⠰⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⣿⠉⠉⠹⢿⣿⣷⡀⠀⠀⠀⠀]],
      [[⠀⠀⠀⢀⣿⠏⠇⢁⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠁⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣦⣤⣂⠥⡈⢁⡛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡅⠀⠀⠀⠀⠙⠻⣷⣄⠀⠀]],
      [[⠀⠀⠀ ⣿⣴⣾⣿⡿⣟⠿⣿⣷⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⣀⣠⣥⣄⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣧⡀]],
      [[⠀⠀⣠⣿⣿⢏⠻⣿⣳⣭⢟⡶⣫⡽⣻⢿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⣦⣿⡿⣟⢯⡟⣿⢻⢿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⢿⣷]],
      [[⠀⣰⣿⢿⡽⣎⣷⣻⡗⣮⢻⣼⢳⣝⢧⣻⢼⣻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣰⣿⡿⣟⣭⢗⡯⣞⡽⣮⣕⣊⢶⣏⡿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿]],
      [[⢠⣿⢯⡷⣽⢺⣧⣷⣻⡼⣏⣞⢯⡞⣯⢞⣧⣳⢞⡿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣏⢷⣫⢞⣽⢺⡵⣫⣽⢻⡟⡾⣜⣳⡭⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿]],
      [[⢸⣿⣻⣼⣻⢿⣟⡾⣽⣷⣯⣞⢧⡟⣧⡟⡶⣭⢟⡾⣽⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡟⣮⡽⣳⢽⣚⣮⢟⣼⣳⣭⣷⣻⣝⡾⣱⢯⣻⢼⣿⡆⠀⠀⠀⠀⠀⠀⠀⣸⡏]],
      [[⢸⣿⣳⢾⣽⣻⣾⡽⣷⢯⣿⢿⣷⡽⣎⠿⣵⣛⢮⢷⣹⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣻⢼⡳⣏⢷⣫⢷⣞⡿⣽⢯⣟⣾⣻⡽⣿⣷⢫⡞⣧⢿⣿⠀⠀⣤⢀⡀⢀⣸⡿⠁]],
      [[⠀⢿⣯⢟⣾⣽⣷⡿⣽⣻⣞⣿⣻⣾⡭⣟⢮⣝⡯⣞⣭⣻⣿⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣿⣯⡳⣏⢿⢮⢷⣽⣾⢯⡿⣽⣻⣞⡷⣯⢿⣽⣿⣷⡹⣧⢟⣿⡆⠀⠈⠀⣠⣿⠟⠁⠀]],
      [[⠀⠸⣿⣟⣾⣻⢷⣻⣷⣻⣞⣷⣻⢿⣷⣭⡻⣜⣳⡽⣲⢏⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣯⠷⣏⣟⣮⢿⣾⡽⣯⣟⣷⣻⢾⡽⣯⣟⡾⣽⣻⣝⢧⡟⣿⣇⣀⣤⡶⠟⠃⠀⠀⠀]],
      [[⠀⠀⠙⣿⣷⣻⣯⢿⣞⣷⣻⢾⡽⣯⣿⢶⡻⣝⢶⡻⡵⢯⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣟⡮⣟⡵⢾⣽⣿⢯⣟⣷⣻⢾⡽⣯⣟⡷⣯⣟⣷⣻⢎⡿⣼⣿⠉⠉⢡⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠈⢿⣷⣯⢿⣞⡿⣽⢯⣿⣳⣿⣯⢳⣏⡾⣽⢫⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡵⣫⢞⣯⣿⣯⣟⣾⣳⢯⡿⣽⣳⢯⣟⡷⣯⣿⣳⢏⡷⣽⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠙⢿⣯⡿⣿⣽⣻⣿⣿⣿⣭⠷⣞⣳⣭⣿⣿⠏⠈⠙⠛⠿⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣷⡝⣯⠶⣿⣿⣞⡷⣯⢿⣽⣳⣟⡿⣾⣽⣿⢯⣳⢏⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠙⠿⣷⣯⣻⠿⣟⣳⣾⣯⣽⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠉⠙⠛⠻⠿⠿⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⡞⣽⢻⣿⣿⣿⣽⣟⣾⣳⣯⣿⣽⡿⣞⣳⢯⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⠿⠿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⣿⣭⡷⣫⢟⣿⣿⡿⣿⣷⢻⡽⣫⢷⣭⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣷⣯⣞⣭⣻⣵⣯⣷⣿⣿⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠛⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
}


-- lvim.transparent_window = true
-- enable treesitter integration
