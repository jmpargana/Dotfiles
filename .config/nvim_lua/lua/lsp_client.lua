local lsp = require 'lspconfig'

local on_attach = function(client, bufnr)

  local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  map('n', '<c-]>', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
  map('', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  map('n', '<space>af', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

  -- conditional keybindings
  if client.resolved_capabilities.document_formatting then
    map('n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    map('n', '<space>F', '<cmd>lua vim.lsp.buf.range_formatting()<cr>', opts)
  end


  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end


-- Loop over all defined servers
local servers = { "pyls", "tsserver", "vuels", "yamlls", "gopls", "jsonls", "dockerls" }
for _, sv in ipairs(servers) do
  lsp[sv].setup { on_attach = on_attach }
end

