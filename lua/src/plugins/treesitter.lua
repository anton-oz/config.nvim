return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  -- lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require 'nvim-treesitter'
    ts.setup()

    -- Install missing parsers (replaces ensure_installed)
    local want = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'typescript',
      'javascript',
      'tsx',
      'css',
      'scss',
      'rust',
      'python',
      'svelte',
    }
    local have = ts.get_installed() or {} -- correct: top-level module, not nvim-treesitter.config
    local missing = vim.tbl_filter(function(p)
      return not vim.tbl_contains(have, p)
    end, want)
    if #missing > 0 then
      -- wait() avoids a race on first launch where parsers aren't ready yet
      ts.install(missing):wait(300000)
    end

    -- Enable highlighting and indentation via FileType autocmd
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        if not lang then
          return
        end

        -- Check a parser is actually installed before starting
        local ok = pcall(vim.treesitter.language.inspect, lang)
        if not ok then
          return
        end

        vim.treesitter.start(ev.buf, lang)
        vim.bo[ev.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
