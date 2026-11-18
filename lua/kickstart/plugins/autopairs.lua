-- autopairs
-- https://github.com/windwp/nvim-autopairs

vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
require('nvim-autopairs').setup { fast_wrap = {}, disable_filetype = { 'TelescopePrompt', 'vim' } }

-- Insert () after accepting function completions
require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
