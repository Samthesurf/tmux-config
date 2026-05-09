# Gotham tmux

One-command tmux setup. Vim keybindings. Visual which-key menu. Ghostty-ready. SSH-persistent.

```
curl -fsSL https://raw.githubusercontent.com/Samthesurf/tmux-config/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/Samthesurf/tmux-config.git
cd tmux-config
./install.sh
```

## What you get

| Feature | How |
|---------|-----|
| **Prefix** | `Ctrl-a` (not `Ctrl-b`) |
| **Which-key menu** | `Ctrl-a Space` — see every keybinding |
| **Pane nav** | `Ctrl-a h/j/k/l` or `Alt-h/j/k/l` |
| **Pane resize** | `Ctrl-a H/J/K/L` |
| **Split vertical** | `Ctrl-a \|` |
| **Split horizontal** | `Ctrl-a -` |
| **Vi copy mode** | `Ctrl-a [` then `v` to select, `y` to copy |
| **Mouse** | Full mouse support |
| **Vim integration** | Seamless navigation between vim splits and tmux panes |
| **Ghostty support** | Terminfo auto-installed for remote SSH |

## Keybindings

### Panes
| Keys | Action |
|------|--------|
| `Ctrl-a \|` | Split vertical |
| `Ctrl-a -` | Split horizontal |
| `Ctrl-a h/j/k/l` | Navigate panes |
| `Alt-h/j/k/l` | Navigate panes (no prefix) |
| `Ctrl-a H/J/K/L` | Resize panes |
| `Ctrl-a z` | Zoom toggle |
| `Ctrl-a x` | Kill pane |
| `Ctrl-a ;` | Last pane |

### Windows
| Keys | Action |
|------|--------|
| `Ctrl-a c` | New window |
| `Ctrl-a ,` | Rename window |
| `Ctrl-a p/n` | Previous/next window |
| `Ctrl-a Tab` | Last window |
| `Alt-1..9` | Jump to window |
| `Ctrl-a X` | Kill window |

### Sessions
| Keys | Action |
|------|--------|
| `Ctrl-a d` | Detach (keep running) |
| `Ctrl-a s` | Choose session |
| `Ctrl-a $` | Rename session |

### Copy mode (vi keys)
| Keys | Action |
|------|--------|
| `Ctrl-a [` | Enter copy mode |
| `v` | Start selection |
| `y` | Copy selection |
| `Ctrl-a ]` | Paste |

### Config
| Keys | Action |
|------|--------|
| `Ctrl-a Space` | Which-key menu (everything visible) |
| `Ctrl-Space` | Which-key menu (no prefix) |
| `Ctrl-a r` | Reload config |
| `Ctrl-a I` | Install plugins |
| `Ctrl-a U` | Update plugins |

## Files

| File | Purpose |
|------|---------|
| `tmux.conf` | Main tmux configuration |
| `which-key.yaml` | Menu definition for visual keybinding display |
| `ghostty-terminfo.ti` | Ghostty terminal capabilities (for SSH remotes) |
| `install.sh` | One-command deployment script |
