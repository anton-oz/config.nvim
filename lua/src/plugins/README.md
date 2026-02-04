# Lazy plugins quick tips

Here are some quick guidelines when adding packages to lazy.

## Plugins can be added by using a string or table.

Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.

Alternatively, use `config = function() ... end` for full control over the configuration.
If you prefer to call `setup` explicitly, use:
```lua
{
   'lewis6991/gitsigns.nvim',
   config = function()
       require('gitsigns').setup({
           -- Your gitsigns configuration here
       })
   end,
}
```

## Plugins can also be configured to run Lua code when they are loaded.

This is often very useful to both group configuration, as well as handle
lazy loading plugins that don't need to be loaded immediately at startup.

For example, in the following configuration, we use:
 event = 'VimEnter'

which loads which-key before all the UI elements are loaded. Events can be
normal autocommands events (`:help autocmd-events`).

Then, because we use the `opts` key (recommended), the configuration runs
after the plugin has been loaded as `require(MODULE).setup(opts)`.

## Plugins can specify dependencies.

The dependencies are proper plugin specifications as well - anything
you do for a plugin at the top level, you can do for a dependency.

Use the `dependencies` key to specify the dependencies of a particular plugin

Add any further plugins as seperate files in ./lua/src/plugins, they will be auto added here
