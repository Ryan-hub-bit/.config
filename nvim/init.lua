if vim.g.vscode then
  -- VSCode only: manually bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    {
      "echasnovski/mini.surround",
      version = false,
      config = function()
        require("mini.surround").setup({
          mappings = {
            add = "ys",
            delete = "ds",
            replace = "cs",
          },
        })
      end,
    },
  })
else
  -- Normal full LazyVim config
  require("config.lazy")
end
