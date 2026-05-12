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

## What the installer does

1. Installs tmux via apt/dnf/pacman/brew (auto-detects your OS)
2. Installs Ghostty terminfo — no more "unsuitable terminal: xterm-ghostty"
3. Clones TPM (Tmux Plugin Manager)
4. Deploys `tmux.conf` to `~/.tmux.conf` (backs up existing)
5. Deploys which-key config for the visual menu
6. Installs `tmux-which-key` and `vim-tmux-navigator` plugins

## After install

```bash
tmux new -s main      # Start a session
tmux attach -t main   # Reattach after disconnect

# Inside tmux:
Ctrl-a Space           # See ALL keybindings — no memorization
Ctrl-a r               # Reload config after changes
```

## Status Bar Design

The status bar uses the **Kanagawa** color palette — inspired by Hokusai's Great Wave. Pill-style segments with harmonious colors:

| Element | Color | Hex |
|---------|-------|-----|
| Background | Ink | `#1f1f28` |
| Session | Spring Violet | `#957fb8` |
| Active Window | Autumn Red | `#c34043` |
| Inactive Window | Ink 3 | `#363646` |
| Prefix | Carp Yellow | `#e6c384` |
| Which-Key | Surimi Orange | `#ffa066` |
| Time | Spring Blue | `#7fb4ca` |
| Date | Autumn Green | `#76946a` |

The bar displays: session name | windows | `C-a` prefix | `C-Space` which-key | time | date

No memorization needed — every shortcut is visible at a glance.
