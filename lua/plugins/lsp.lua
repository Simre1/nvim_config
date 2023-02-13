

local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', 'geh', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', 'gel', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)


  local wk = require("which-key")
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  
  wk.register({
    g = {
      name = "Goto",
      d = { vim.lsp.buf.definition, "Go to definition" , buffer = bufnr },
      D = { vim.lsp.buf.declaration, "Go to declaration", buffer = bufnr },
      i = { vim.lsp.buf.implementation, "Go to implementation", buffer = bufnr },
      r = { vim.lsp.buf.references, "Go to references", buffer = bufnr }
      
    }
  })

  wk.register({
    h = { vim.lsp.buf.hover, "Hover", buffer = bufnr },
    a = { vim.lsp.buf.code_action, "Execute code action", buffer = bufnr},
    e = { vim.diagnostic.open_float, "Show error", buffer = bufnr }, 
    l = {
      s = { vim.lsp.buf.signature_help, "Show signature" , buffer = bufnr },
      d = { vim.lsp.buf.type_definition, "Show type definition" , buffer = bufnr},
      r = { vim.lsp.buf.rename, "Rename", buffer = bufnr },
      f = { function() vim.lsp.buf.format { async = true } end, "Format", buffer = bufnr }
    }
  }, { prefix = "<leader>" })

end

local lsp_flags = {}

function activate_lsp(lsp)
  require('lspconfig')[lsp].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  }
end


vim.api.nvim_create_user_command('ActivateLsp', function(lsp) activate_lsp(lsp["args"]) end, { nargs = 1 } )

return {
  {
    "neovim/nvim-lspconfig",
    event = UIEnter,
    config = function()
      -- vim.api.nvim_create_autocmd(
      --   { "BufEnter" },
      --   { pattern = { "*.hs" }, command = "ActivateLsp hls" }
      -- )
      -- vim.api.nvim_create_autocmd(
      --   { "BufEnter" },
      --   { pattern = { "*.java" }, command = "ActivateLsp jdtls" }
      -- ) 
    end
  }
}

