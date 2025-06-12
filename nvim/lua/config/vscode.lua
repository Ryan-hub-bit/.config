if vim.g.vscode then
  vim.diagnostic.enable(false)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      client.stop()
    end,
  })
end
