# neovim config repository

## Repo rules

- always use builtin lua vim bindings where applicable.

## Repo structure

- `lua/src/init.lua` – entry point.
- `lua/src/` – core modules (`autocmd.lua`, `opts.lua`, `keymaps.lua`,
  `lazy.lua`).
- `lua/src/plugins/` – each file is a [lazy](https://github.com/LazyVim/LazyVim/blob/main/README.md) plugin module.
