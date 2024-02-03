# Neovim Colorscheme Preview and Save Config

This plugin for Neovim enables you to preview colorschemes while tabbing through them.

## Setup

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```
{
	"jam1015/preview_colorscheme",
	config = function()
		require('preview_colorscheme').setup()
	end
},
```

## Usage

Start Neovim.

Use :colorscheme [SPACE] to begin tabbing through the available colorschemes. The *Tab* key will enable you to iterate through the available colorschemes.

Please note that this configuration will only work for colorschemes that are already installed and available for Neovim.


