local function run()
  vim.o.wildignore=table.concat(
    {
      "*.lnk",
      "*~",
      "*.bak",
      "*.pyc",
      "*/.hg/*",
      "*/.svn/*",
      "*/env/*",
      "*.egg-info/*",
      "*/__pycache__/*",
      "doc/_build/*",
    },
    ","
  )
  vim.o.wildmode = "longest:full,full"
end

return {
  run=run
}
