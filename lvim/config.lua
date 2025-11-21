-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--

lvim.plugins={
  { "rose-pine/neovim", name = "rose-pine" },
  {
  "sphamba/smear-cursor.nvim", opts = {
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears and particles will look a lot less blocky.
    legacy_computing_symbols_support = true,

   cursor_color = "#ff4000",
   particles_enabled = true,
   stiffness = 0.5,
   trailing_stiffness = 0.2,
   trailing_exponent = 5,
   damping = 0.6,
   gradient_exponent = 0,
   gamma = 1,
   never_draw_over_target = true, -- if you want to actually see under the cursor
   hide_target_hack = true,       -- same
   particle_spread = 1,
   particles_per_second = 500,
   particles_per_length = 50,
   particle_max_lifetime = 800,
   particle_max_initial_velocity = 20,
   particle_velocity_from_cursor = 0.5,
   particle_damping = 0.15,
   particle_gravity = -50,
   min_distance_emit_particles = 0,
    }}, 
  {'letorbi/vim-colors-modern-borland', name="borland"},
  {'nightsense/strawberry', name="strawberry"},
  {'mellow-theme/mellow.nvim', name="mellow"},
{'mattia72/vim-delphi'},
  -- {'edluffy/hologram.nvim',
  --   config =  require('hologram').setup{auto_display = true
  --     -- WIP automatic markdown image display, may be prone to breaking
  --   }
  -- },
--   {"nvimdev/guard.nvim", 
--    config= function ()
--     local ft = require('guard.filetype')
-- ft('c'):fmt('clang-format')
-- ft('cpp'):fmt('clang-format')
--    end,
--   },
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
  -- {'andweeb/presence.nvim'},
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
{'nvim-lua/plenary.nvim'},
-- install without yarn or npm
-- {
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--     ft = { "markdown" },
--     build = function() vim.fn["mkdp#util#install"]() end,
-- },
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
      "zenbones-theme/zenbones.nvim",
      -- Optionally install Lush. Allows for more configuration or extending the colorscheme
      -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
      -- In Vim, compat mode is turned on as Lush only works in Neovim.
      dependencies = "rktjmp/lush.nvim",
      lazy = false,
      priority = 1000,
      -- you can set set configuration options here
      -- config = function()
      --     vim.g.zenbones_darken_comments = 45
      --     vim.cmd.colorscheme('zenbones')
      -- end
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

{'andweeb/presence.nvim', 
   init = function() 
   require("presence").setup({
      -- General options
      auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
      neovim_image_text   = "the cooler vim",           -- Text displayed when hovered over the Neovim image
      main_image          = "neovim",                 -- Main image display (either "neovim" or "file")
      client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
      log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
      debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
      enable_line_number  = true,                      -- Displays the current line number instead of the current project
      blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
      file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
      show_time           = false,                       -- Show the timer

      -- Rich Presence text options
      editing_text        = "pung kae code jong yey jeng ha ",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
      file_explorer_text  = "pung mer %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
      git_commit_text     = "pung commit",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
      plugin_manager_text = "pung sa re plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
      reading_text        = "pg arn wafak %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
      workspace_text      = "ther ka %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
      line_number_text    = "lemme get a uhhh",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
  }) 
  end
  },

  --[[ {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    config = function()
      require("llm").setup({
        url = "http://192.168.231.52:9997/v1/chat/completions",
        model = "deepseek-chat",
        api_type = "openai",
        max_tokens = 8092,
        temperature = 0.3,
        top_p = 0.7,

        prompt = "You are a helpful Coding assistant.",

        prefix = {
          user = { text = "  ", hl = "Title" },
          assistant = { text = "  ", hl = "Added" },
        },

        -- history_path = "/tmp/llm-history",
        save_session = true,
        max_history = 15,
        max_history_name_length = 20,

        -- stylua: ignore
        keys = {
          -- The keyboard mapping for the input window.
          ["Input:Submit"]      = { mode = "n", key = "<cr>" },
          ["Input:Cancel"]      = { mode = {"n", "i"}, key = "<C-c>" },
          ["Input:Resend"]      = { mode = {"n", "i"}, key = "<C-r>" },

          -- only works when "save_session = true"
          ["Input:HistoryNext"] = { mode = {"n", "i"}, key = "<C-j>" },
          ["Input:HistoryPrev"] = { mode = {"n", "i"}, key = "<C-k>" },

          -- The keyboard mapping for the output window in "split" style.
          ["Output:Ask"]        = { mode = "n", key = "i" },
          ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
          ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

          -- The keyboard mapping for the output and input windows in "float" style.
          ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
          ["Session:Close"]     = { mode = "n", key = {"<esc>", "Q"} },
        },
      })
    end,
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
      { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
      { "<leader>ts", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
    },
  }, ]]




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
{ "catppuccin/nvim", name = "catppuccin", priority=1000},
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


-- swift 
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "sourcekit" })

-- Configure Swift LSP
local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("sourcekit", {
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift" },
  root_dir = require("lspconfig").util.root_pattern("Package.swift", ".git")
})

-- Optional: Add Swift file type detection
vim.cmd([[
  autocmd BufNewFile,BufRead *.swift set filetype=swift
]])



vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust-analyzer" })
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "rust",
  "toml",
  "python"
}
-- vim.cmd.colorscheme "strawberry-light"
lvim.colorscheme = "rose-pine-dawn"
-- lvim.colorscheme="borland"
vim.opt.background="light"
lvim.builtin.project.manual_mode = true
vim.opt.number = true
vim.opt.wrap = true
vim.g.mellow_italic_functions = true
vim.g.mellow_bold_functions = true

require'lspconfig'.glslls.setup{}
-- formatiing
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  { command = "clang-format", filetypes = { "c", "cpp", "h", "hpp" } },
}
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.c", "*.cpp", "*.h" , "*.hpp"}
-- vim.g.mellow_bold_functions = true
-- lvim.colorscheme = "mellow"
--
--
--
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

lvim.builtin.alpha.dashboard.section.header.val = {
[[                                         heabeoun's LunarVim                   ]],                                                                                                 
[[                                         ███▄ ▄███▓ ██ ▄█▀▄▄▄█████▓ ▒█████     ]],                           
[[                            /(           ▓██▒▀█▀ ██▒ ██▄█▒ ▓  ██▒ ▓▒▒██▒  ██▒  ]],                         
[[                          #%%(((&        ▓██    ▓██░▓███▄░ ▒ ▓██░ ▒░▒██░  ██▒  ]],                         
[[                          ////((/        ▒██    ▒██ ▓██ █▄ ░ ▓██▓ ░ ▒██   ██░  ]],                       
[[                          (#%%#%         ▒██▒   ░██▒▒██▒ █▄  ▒██▒ ░ ░ ████▓▒░  ]],                       
[[                        *%%%&@#(         ░ ▒░   ░  ░▒ ▒▒ ▓▒  ▒ ░░   ░ ▒░▒░▒░   ]],                        
[[                       #%&&&%%&%&&*      ░  ░      ░░ ░▒ ▒░    ░      ░ ▒ ▒░   ]],                         
[[                       *#%%@&&&&@@@%%    ░      ░   ░ ░░ ░   ░      ░ ░ ░ ▒    ]],                        
[[                       /&&##&&&&@@@@%%#/.       ░   ░  ░                ░ ░    ]],
[[                 ,*//( /%&&&#,/(##(/(.,.,  ,,                                  ]],
[[                 &#,.@&%#&&&&&%%&%@@@@@@*..(%  .,                              ]],
[[                 ,%&%%/%&##%(#%%&((&@@%/(#//(%&#.*/                            ]],
[[                ,,,*(#&#%%#(///&@%%#(((////#@@&///(((((#*                      ]],
[[             .,/#,,,*%#((&&#((*,*&%#((&%%&&@#//(&@@%.*//*,                     ]],
[[            %.   #**,*(%&&@@@#////@@&%&@@@@@@%#@@%#,,(#%(.*(/*                 ]],
[[             &@&@&##%%%&@@@@@@&##/@@@&&@@@@@@@@# .(%, %@&.@#*(#                ]],
[[            (((((#((#%&@@@&&&@(((@@@#%@@@@@@@@&.* #&.   (@@&*(#                ]],
[[              #&&&#(#(###@&##*,/((#&%&@@@@@@@@@#.(%(*,* ..,./,(&               ]],               
[[                **#@@@@((#&&@@@*,/((&@@@@@@@@@&&%../*,/*.*///,#%%              ]],
[[                &(&%@@@(((@#&/*(%%*/(/.(@@@@&/*@%* .,///, ,.#%#                ]],
[[                 ,@@@*  %%(/((,/#(&(**#&(&@#      *#*   ,(#&*                  ]],
[[                         &#&#(&(*((#&@&*                                       ]],     
[[                        /#%%&%####@@/                                          ]],
[[                             ,&&&@(  ]]                                 
                                                                      
}

-- lvim.builtin.alpha.dashboard.section.header.val = {
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣤⣴⣦⣶⣶⣶⣶⣦⣦⣤⣤⣄⣀⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⡶⠿⠟⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠛⠛⠻⠶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡾⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⡿⢿⠀⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⠿⢏⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢻⣷⡄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡿⢯⠐⠃⠀⠀⠀⠀⠀⢠⣀⣠⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣾⠯⠴⠏⠀⠀⠀⠀⠀⠀⢀⣾⠟⠉⠉⢻⡧⠀⠀⠀⠀⠀⠀⣸⣶⠶⠶⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⠁⠗⠀⠀⠀⠀⠀⠀⠀⢰⣿⠋⠠⠀⠀⣼⡇⠀⠀⠀⠀⠀⣾⠟⠁⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠙⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⠢⠴⠀⠀⠀⠀⠀⠀⠀⠀⣾⣏⠀⢠⢀⣰⣿⠃⠀⠀⠀⠀⢰⣿⠀⠀⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢼⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⢴⣿⣿⣦⣤⣿⣿⡏⡄⠀⠀⠠⠀⣿⣯⠀⢰⢸⣶⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠅⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠃⠀⠀⣠⣤⠤⣤⣄⠀⠀⢈⣾⣿⣿⣿⣿⣿⡿⠖⠀⠀⠀⢰⣤⣿⣿⣿⣶⣿⣿⡟⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⣠⡶⠉⠄⡐⠠⠙⠻⣦⢸⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⠇⠉⠀⠀⠀⡀⢠⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣸⡿⠀⠀⢿⠁⠌⡐⢀⠂⡐⢀⣿⠻⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⠀⠀⣤⠄⠒⢈⠀⠄⠉⠻⢷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⢀⣄⣠⣧⣿⣧⠀⠀⢸⣦⠐⠀⠄⠂⠄⠈⠀⠀⠙⢿⣿⣿⠿⠁⠀⣀⡀⠀⢠⠰⣿⣿⣿⣷⣯⣿⡇⠀⠠⡏⠠⠈⠄⡈⠄⡁⢂⠈⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⢀⣴⣾⣿⠿⠉⣿⢿⠀⠀⠀⠉⠛⠛⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣰⣿⠀⠀⢹⣿⡿⠟⠋⠀⠀⢐⠠⠀⡁⠄⠠⠐⢀⠂⡐⢺⣿⠇⠀⠀⠀⠀⠀⠀⠀⣧⣤⣤⣿⣇⡀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⢀⣾⡿⡀⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡿⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⣆⠀⠆⢁⠰⠀⠆⠰⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⣿⠉⠉⠹⢿⣿⣷⡀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⢀⣿⠏⠇⢁⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠁⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣦⣤⣂⠥⡈⢁⡛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡅⠀⠀⠀⠀⠙⠻⣷⣄⠀⠀]],
--       [[⠀⠀⠀ ⣿⣴⣾⣿⡿⣟⠿⣿⣷⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⣀⣠⣥⣄⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣧⡀]],
--       [[⠀⠀⣠⣿⣿⢏⠻⣿⣳⣭⢟⡶⣫⡽⣻⢿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⣦⣿⡿⣟⢯⡟⣿⢻⢿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⢿⣷]],
--       [[⠀⣰⣿⢿⡽⣎⣷⣻⡗⣮⢻⣼⢳⣝⢧⣻⢼⣻⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣰⣿⡿⣟⣭⢗⡯⣞⡽⣮⣕⣊⢶⣏⡿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿]],
--       [[⢠⣿⢯⡷⣽⢺⣧⣷⣻⡼⣏⣞⢯⡞⣯⢞⣧⣳⢞⡿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣏⢷⣫⢞⣽⢺⡵⣫⣽⢻⡟⡾⣜⣳⡭⢿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿]],
--       [[⢸⣿⣻⣼⣻⢿⣟⡾⣽⣷⣯⣞⢧⡟⣧⡟⡶⣭⢟⡾⣽⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡟⣮⡽⣳⢽⣚⣮⢟⣼⣳⣭⣷⣻⣝⡾⣱⢯⣻⢼⣿⡆⠀⠀⠀⠀⠀⠀⠀⣸⡏]],
--       [[⢸⣿⣳⢾⣽⣻⣾⡽⣷⢯⣿⢿⣷⡽⣎⠿⣵⣛⢮⢷⣹⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣻⢼⡳⣏⢷⣫⢷⣞⡿⣽⢯⣟⣾⣻⡽⣿⣷⢫⡞⣧⢿⣿⠀⠀⣤⢀⡀⢀⣸⡿⠁]],
--       [[⠀⢿⣯⢟⣾⣽⣷⡿⣽⣻⣞⣿⣻⣾⡭⣟⢮⣝⡯⣞⣭⣻⣿⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣿⣯⡳⣏⢿⢮⢷⣽⣾⢯⡿⣽⣻⣞⡷⣯⢿⣽⣿⣷⡹⣧⢟⣿⡆⠀⠈⠀⣠⣿⠟⠁⠀]],
--       [[⠀⠸⣿⣟⣾⣻⢷⣻⣷⣻⣞⣷⣻⢿⣷⣭⡻⣜⣳⡽⣲⢏⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣯⠷⣏⣟⣮⢿⣾⡽⣯⣟⣷⣻⢾⡽⣯⣟⡾⣽⣻⣝⢧⡟⣿⣇⣀⣤⡶⠟⠃⠀⠀⠀]],
--       [[⠀⠀⠙⣿⣷⣻⣯⢿⣞⣷⣻⢾⡽⣯⣿⢶⡻⣝⢶⡻⡵⢯⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣟⡮⣟⡵⢾⣽⣿⢯⣟⣷⣻⢾⡽⣯⣟⡷⣯⣟⣷⣻⢎⡿⣼⣿⠉⠉⢡⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠈⢿⣷⣯⢿⣞⡿⣽⢯⣿⣳⣿⣯⢳⣏⡾⣽⢫⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡵⣫⢞⣯⣿⣯⣟⣾⣳⢯⡿⣽⣳⢯⣟⡷⣯⣿⣳⢏⡷⣽⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠙⢿⣯⡿⣿⣽⣻⣿⣿⣿⣭⠷⣞⣳⣭⣿⣿⠏⠈⠙⠛⠿⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣷⡝⣯⠶⣿⣿⣞⡷⣯⢿⣽⣳⣟⡿⣾⣽⣿⢯⣳⢏⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠙⠿⣷⣯⣻⠿⣟⣳⣾⣯⣽⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠉⠙⠛⠻⠿⠿⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⡞⣽⢻⣿⣿⣿⣽⣟⣾⣳⣯⣿⣽⡿⣞⣳⢯⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⠿⠿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⣿⣭⡷⣫⢟⣿⣿⡿⣿⣷⢻⡽⣫⢷⣭⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣷⣯⣞⣭⣻⣵⣯⣷⣿⣿⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
--       [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠛⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- }


-- lvim.builtin.alpha.dashboard.section.header.val = {
-- [[                                       ░░░░░                          ]],
-- [[                                     ░░░░░░░░░░                       ]],
-- [[                                   ░░░░░░░░░░░░░                      ]],
-- [[                                  ░░░░░░░░░░░░░░░                     ]],
-- [[                                 ░░░░░░░░░░░░░░░░                     ]],
-- [[                  ░░░░░░░░░░░   ░░░░░░░░░░░░░░░░                      ]],
-- [[                 ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                       ]],
-- [[                ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  ░░░░░░░░░             ]],
-- [[                ░░░░░░░░░░░░░░░░░░░     ░░░░░░░░░░░░░░░░░░            ]],
-- [[                ░░░░░░░░░░░░░░░░          ░░░░░░░░░░░░░░░░░       I got a new boat, you should come with    ]],
-- [[                 ░░░░░░░░░░░░░░            ░░░░░░░░░░░░░░░          I got a section for your luggage   ]],
-- [[                   ░░░░░░░░░░░              ░░░░░░░░░░░░░           Bring some fiction and a nightlight  ]],
-- [[                      ░░░░░░░░              ░░░░░░░░░░░            Record player and your top five   ]],
-- [[                    ░░░░░░░░░░░             ░░░░░░░               Where we goin'? We should get lost    ]],
-- [[                 ░░░░░░░░░░░░░░░          ░░░░░░░░░░               No more questions, let the wharf talk,   ]],
-- [[               ░░░░░░░░░░░░░░░░░░░░     ░░░░░░░░░░░░░░                ]],
-- [[              ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░              ]],
-- [[             ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░             ]],
-- [[            ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░            ]],
-- [[           ░░░░░░░░░░░░░░░░░░░░░░░   ░░░░░░░░░░░░░░░░░░░░░            ]],
-- [[            ░░░░░░░░░░░░░░░░░░░░       ░░░░░░░░░░░░░░░░░░░            ]],
-- [[             ░░░░░░░░░░░░░░░░░            ░░░░░░░░░░░░░░░             ]],
-- [[              ░░░░░░░░░░░░░░                ░░░░░░░░░░░               ]],
-- [[                 ░░░░░░░                                              ]],
-- }



