-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
-- This file wires up a Mason-based workflow for C/C++:
-- - mason.nvim + mason-lspconfig: install/attach clangd (LSP)
-- - mason-tool-installer: install clang-format
-- - conform.nvim: format-on-save using clang-format, honoring project .clang-format
-- - editorconfig.nvim: optional, to honor .editorconfig for indentation
-- - local options: 4-space indents (expandtab)

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'clangd' },
        automatic_installation = true,
      })
      local lspconfig = require('lspconfig')
      lspconfig.clangd.setup({})
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = { 'clang-format' },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        c = { 'clang_format' },
        cpp = { 'clang_format' },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
    },
  },
  {
    -- Optional: honor .editorconfig settings automatically
    'gpanders/editorconfig.nvim',
  },
  {
    -- Local indentation defaults (4 spaces, no tabs)
    'coobeeyon/local-cpp-options',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 4
      vim.opt.softtabstop = 4
    end,
  },
}
