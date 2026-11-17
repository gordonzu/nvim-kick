-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them.
-- `vim.fs.dir()` iteration order is unspecified and must not be relied upon.

local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

do


  vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", } })

  local harpoon = require("harpoon");
  harpoon:setup()

  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add() end , { desc = "add buffer to harpoon" })
  vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list()) end , { desc = "show harpoon window" })
  vim.keymap.set("n", "1", function()
    harpoon:list():select(1) end, { desc = "pick 1st buff" })
  vim.keymap.set("n", "2", function()
    harpoon:list():select(2) end, { desc = "pick 2nd buff" })
  vim.keymap.set("n", "3", function()
    harpoon:list():select(3) end, { desc = "pick 3rd buff" })
  vim.keymap.set("n", "4", function()
    harpoon:list():select(4) end, { desc = "pick 4th buff" })


  vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "delete open buffer" })
  vim.keymap.set("n", "<leader>[", ":bn<CR>", { desc = "next buffer" })
  vim.keymap.set("n", "<leader>]", ":bp<CR>", { desc = "previous buffer" })


  vim.pack.add({ { src = "https://github.com/stevearc/oil.nvim" } })
  require("oil").setup({
    default_file_explorer = true,
    restore_win_options = true,
    skip_confirm_for_simple_edits = true,

    float = {
      padding = 2,
      max_width = 80,
      max_height = 35,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },

    override = function(conf)
      conf.row = 1
      return conf
    end,

    view_options = {
      show_hidden = true,
      is_hidden_file = function(name)
        return false
      end,
      natural_order = true,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
    },

    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
  })

  vim.keymap.set("n", "-", "<CMD>Oil --float<CR>")

  vim.pack.add({ "https://github.com/seblyng/roslyn.nvim" }, { load = function() end })
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  local opts = {}

  vim.api.nvim_create_autocmd("FileType", {
	  pattern = { "cs", "razor" },
	  once = true,
	  callback = function()
		  vim.cmd.packadd("roslyn.nvim")
		  require("roslyn").setup(opts)
	  end,
  })


  vim.pack.add { 'https://github.com/rebelot/kanagawa.nvim' }
  ---@diagnostic disable-next-line: missing-fields
  require('kanagawa').setup {
    keywordStyle = { italic = false }
  }

  --vim.cmd('colorscheme kanagawa')

  vim.pack.add { 'https://github.com/vague2k/vague.nvim' }
  ---@diagnostic disable-next-line: missing-fields
  require('vague').setup {
  }

  vim.pack.add { 'https://github.com/marko-cerovac/material.nvim' }
  ---@diagnostic disable-next-line: missing-fields
  require('material').setup {
  }

  vim.pack.add { 'https://github.com/zenbones-theme/zenbones.nvim' }
  vim.pack.add { 'https://github.com/rktjmp/lush.nvim' }
  ---@diagnostic disable-next-line: missing-fields
  --require('zenbones').setup { }

  vim.cmd('set background=dark')
  vim.cmd('colorscheme zenbones')


  vim.pack.add { 'https://github.com/savq/melange-nvim' }
end


