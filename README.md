**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

## Backup old nvim config.
```bash
mv ~/.config/nvim ~/.config/nvim-old
```
Or remove old nvim config.
```bash
rm -rf ~/.config/nvim
```
Remove local/state and local/share
```bash
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

## Install NvChad custom with working go setup
Includes: formatting, autocompletion, debuggr, linting....
```bash
git clone https://github.com/pansachin/NChad-settings ~/.config/nvim && nvim
```

