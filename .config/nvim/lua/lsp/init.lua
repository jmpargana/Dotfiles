local opts = { noremap = true, silent = true }

-- General Diagnostics
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dl', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
vim.api.nvim_set_keymap('n', ']d', ":Lspsaga diagnostic_jump_next<cr>", opts)
vim.api.nvim_set_keymap('n', '[d', ":Lspsaga diagnostic_jump_prev<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>dc', "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", opts)
vim.api.nvim_set_keymap('n', ';e', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Mappings
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", 'v:lua.vim.lsp.omnifunc')


  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', "<cmd>lua require'lspsaga.hover'.render_hover_doc()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-k>', "<cmd>lua require'lspsaga.signaturehelp'.signature_help()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', "<cmd>Lspsaga rename<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ';ca', "<cmd>lua require('lspsaga.codeaction').code_action()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh',"<cmd>lua require'lspsaga.provider'.lsp_finder()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
end




local cmp = require 'cmp'
local lspkind = require('lspkind')


local next_suggestion = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = next_suggestion,
    ['<C-n>'] = next_suggestion,
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
  },
  sources = {
    {name = 'nvim_lsp'}, -- For vsnip user.
    {name = 'vsnip'}, -- For luasnip user.
    {name = 'buffer'}
  },
  formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})}
})


-- local servers = {
--  'bashls',
--  'ccls',
--  'cssls',
--  'diagnosticls',
--  'dockerls',
--  'gopls',
--  'jsonls',
--  'sqlls',
--  -- 'sumneko_lua',
--  'svelte',
--  'tailwindcss',
--  'tsserver',
--  'vimls',
--  'volar',
--  'yamlls',
-- }


-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150
--     }
--   }
-- end




-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0
--              and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
--              == nil
-- end

-- local feedkey = function(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end





local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end




local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                       .make_client_capabilities())
  local opts = {capabilities = capabilities, on_attach=on_attach}
  if server.name == "sumneko_lua" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        Lua = {
          runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
          diagnostics = {globals = {'vim'}},
          workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
          telemetry = {enable = false}
        }
      }

    }, opts)
  end
  server:setup(opts)
end)
