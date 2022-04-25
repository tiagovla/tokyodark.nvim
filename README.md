![tokyodark.nvim](https://user-images.githubusercontent.com/30515389/141231977-82476546-eb48-47e4-a5fc-45ace7eacb0d.png)

![image](https://user-images.githubusercontent.com/30515389/115807570-42385080-a3bf-11eb-8286-c981b5093ffa.png)

### About

A clean dark theme written in lua for neovim 0.7.

### Features

- Support for numerous plugins
- Customizable
- Italic Support

### Installation

Install with your favorite package manager:

[packer](https://github.com/wbthomason/packer.nvim)

``` lua
use 'tiagovla/tokyodark.nvim'
```

[vim-plug](https://github.com/junegunn/vim-plug)

``` vim
Plug 'tiagovla/tokyodark.nvim'
```

### Available configuration

**Note:** The configuration options should be placed before
`colorscheme tokyodark` .

- `tokyodark_transparent_background`: Set to enable transparent
  background.
- `tokyodark_enable_italic_comment`: Set to enable italic in `Comment` .
- `tokyodark_enable_italic`: Set to italicize keywords. This option is
  designed to use with fonts that support italic styles, for example
  [Fira Code, MonoLisa, Dank Mono](https://www.nerdfonts.com/).
- `tokyodark_color_gamma`: Change to adjust the brightness of the theme.
  (Darker \< 1.0 \< Lighter).

#### Default configuration

``` lua
-- init.lua
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd("colorscheme tokyodark")
```

``` vim
" .vimrc
let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"
colorscheme tokyodark
```

### Inspiration

- [tokyonight-vim](https://github.com/ghifarit53/tokyonight-vim)
- [tokyo-night-vscode-theme](https://github.com/enkia/tokyo-night-vscode-theme)
