# nvim-settings

## Plugin Manager

- lazy vim

## Options Location

- ~/.config/nvim

## Key Binds

### Normal Mode

- `<C-h>` to moving into fern window(1`<C-w>`w)

### Insert Mode

- jj to `<Esc>`

### Terminal Mode

- jj to `<C-\><C-n>` # to Terminal-Normal mode

## Custom Commands

- `Term`: Open terminal below.
- `TR <number>`: Change height of the current terminal.

## Plugins and Relating Settings

### Lualine

- Nicer status bar
- It depends on `nvim-tree/nvim-web-devicons`
- Required `brew install font-hack-nerd-font` and change terminal font to it.

### Fern

- File explorer
- The lualine is disabled while in the fern.
- Press `a` to select action.
- Press `?` for help window.

Useful commands:

- s or open:select
- open:right
- l or replace most left file buffer

### ToggleTerm
