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

