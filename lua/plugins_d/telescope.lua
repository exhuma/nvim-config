local function map_keys()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
end

local function config()
    local actions = require('telescope.actions')
    require('telescope').setup({
        defaults={
            mappings={
                i={
                    ["<C-j>"] = {
                        actions.move_selection_next, type = "action",
                        opts = { nowait = true, silent = true }
                    },
                    ["<C-k>"] = {
                        actions.move_selection_previous, type = "action",
                        opts = { nowait = true, silent = true }
                    },
                }
            }
        }
    })
end

local function run()
  require('packer').use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = config
  }
  map_keys()
end

return {
  run=run
}
