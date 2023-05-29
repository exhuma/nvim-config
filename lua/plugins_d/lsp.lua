local function map_keys()
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end,
    })
end

local function config()
  require("mason").setup()
  require("mason-lspconfig").setup(
      { ensure_installed = { "lua_ls", "pyright" } }
  )
  require("lspconfig").lua_ls.setup({
      settings = {
          Lua = {
              diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { 'vim' },
              },
          },
      },
  })
  require("lspconfig").pyright.setup({})
  vim.cmd [[:MasonUpdate]]
end

local function run()
    require('packer').use({"williamboman/mason.nvim"})
    require('packer').use({"williamboman/mason-lspconfig.nvim", after="mason.nvim"})
    require('packer').use({"neovim/nvim-lspconfig", config=config, after="mason-lspconfig.nvim"})
    map_keys()
end

return {
    run = run
}
