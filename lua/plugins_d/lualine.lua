local function config()
    require("lualine").setup()
end

local function run()
  require('packer').use(
    {
      'nvim-lualine/lualine.nvim',
      config = config,
      requires = {
          'nvim-tree/nvim-web-devicons', opt=true
      }
    }
  )
end

return {
  run=run
}
