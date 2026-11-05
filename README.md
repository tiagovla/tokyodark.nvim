![tokyodark.nvim](https://user-images.githubusercontent.com/30515389/141231977-82476546-eb48-47e4-a5fc-45ace7eacb0d.png)

![tokyodark.nvim screenshot](https://user-images.githubusercontent.com/30515389/115807570-42385080-a3bf-11eb-8286-c981b5093ffa.png)

A clean, customizable dark colorscheme for Neovim, written in Lua.

## ✨ Features

- Detailed Tree-sitter and LSP semantic highlighting
- Plugin highlight support
- Customizable colors, syntax styles, gamma, and transparency
- Matching terminal colors, with exports for Kitty, Alacritty, Ghostty, iTerm2, Konsole, and WezTerm

## 📦 Installation

Add the plugin with `vim.pack`:

```lua
vim.pack.add({
    { src = "https://github.com/tiagovla/tokyodark.nvim" },
})

require("tokyodark").setup() -- optional; pass options to customize
vim.cmd.colorscheme("tokyodark")
```

## ⚙️ Configuration

All options are optional. Defaults:

```lua
require("tokyodark").setup({
    transparent_background = false,
    gamma = 1.00,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        identifiers = { italic = true },
        functions = {},
        variables = {},
    },
    custom_highlights = {},
    custom_palette = {},
    terminal_colors = true,
})

vim.cmd.colorscheme("tokyodark")
```

<details>
<summary>Custom palette and highlights</summary>

```lua
require("tokyodark").setup({
    custom_palette = {
        purple = "#afa8ea",
    },
    custom_highlights = function(_, palette)
        return {
            ["@variable"] = { fg = palette.purple },
        }
    end,
})
```

</details>

## 💡 Inspiration

- [tokyonight-vim](https://github.com/ghifarit53/tokyonight-vim)
- [Tokyo Night VS Code theme](https://github.com/enkia/tokyo-night-vscode-theme)
