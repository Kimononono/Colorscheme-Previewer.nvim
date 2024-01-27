# Neovim Colorscheme Preview and Save Config

This configuration file for Neovim (.config/nvim/init) enables you to preview colorschemes while tabbing through them using the :colorscheme * command. It also saves the last colorscheme you've selected and reloads it the next time you open Neovim.

Requirements

* Neovim installed
* A set of colorschemes installed

## Setup
  
  1. add file somewhere in your Neovim config (.config/nvim/*)
  
  2. Add the line
  
    require('<PATH TO PREVIEW_COLORSCHEMES FILE>').setup()
   to your init.lua

## Usage

  Start Neovim.
  
  Use :colorscheme [SPACE] to begin tabbing through the available colorschemes. The *Tab* key will enable you to iterate through the available colorschemes.
  
  Once you've found a colorscheme you like, you can exit Neovim. The colorscheme will be automatically saved.
  
  When you start Neovim the next time, the last used colorscheme will be automatically loaded.

Please note that this configuration will only work for colorschemes that are already installed and available for Neovim.


https://github.com/Kimononono/Nvim-Preview-Colorschemes/assets/85222132/167143b7-04d2-4199-a22a-b69c833577da

