-- Conform is the thing that enables formatters to be loaded in Lazyvim
return {

  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      markdown = { "prettier" },
      scss = { "prettier" },
      sass = { "prettier" }, -- Prettier only supports SCSS and CSS, not indented SASS
      php = { "phpcbf" },
      html = { "htmlbeautifier" },
    },
    formatters = {
      phpcbf = {
        command = "vendor/bin/phpcbf",
        args = {
          "--standard=phpcs.xml", -- important
          "--no-cache",
          "$FILENAME",
        },
        stdin = false,
        cwd = function(ctx)
          return vim.fn.getcwd()
        end,
      },
    },
  },
}
