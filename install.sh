#!/usr/bin/env bash
# ================================================================
#  Gotham tmux installer — one command, full armory
#  curl -fsSL <raw-url>/install.sh | bash
# ================================================================
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

banner() {
    echo -e "${CYAN}${BOLD}"
    echo "  ╔══════════════════════════════════════╗"
    echo "  ║       GOTHAM TMUX DEPLOYMENT        ║"
    echo "  ║   vim keys • which-key • ghostty    ║"
    echo "  ╚══════════════════════════════════════╝"
    echo -e "${NC}"
}

info()  { echo -e "${GREEN}[+]${NC} $1"; }
warn()  { echo -e "${RED}[!]${NC} $1"; }

banner

# --- Resolve script directory -----------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Install tmux if missing ------------------------------------
if ! command -v tmux &>/dev/null; then
    info "Installing tmux..."
    if command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y -qq tmux
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y tmux
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm tmux
    elif command -v brew &>/dev/null; then
        brew install tmux
    else
        warn "Could not detect package manager. Install tmux manually."
        exit 1
    fi
else
    info "tmux $(tmux -V) already installed"
fi

# --- Install Ghostty terminfo (for remote SSH users) ------------
TERMINFO_SRC="${SCRIPT_DIR}/ghostty-terminfo.ti"
if [ -f "$TERMINFO_SRC" ]; then
    if ! infocmp xterm-ghostty &>/dev/null 2>&1; then
        info "Installing Ghostty terminfo..."
        if command -v tic &>/dev/null; then
            tic -x "$TERMINFO_SRC" 2>/dev/null && \
                info "Ghostty terminfo installed" || \
                warn "tic failed — terminfo may need sudo: sudo tic -x $TERMINFO_SRC"
        fi
    else
        info "Ghostty terminfo already present"
    fi
fi

# --- Install TPM (Tmux Plugin Manager) --------------------------
TPM_DIR="${HOME}/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    info "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" --quiet
else
    info "TPM already installed"
fi

# --- Deploy tmux.conf -------------------------------------------
CONF_SRC="${SCRIPT_DIR}/tmux.conf"
CONF_DST="${HOME}/.tmux.conf"
if [ -f "$CONF_SRC" ]; then
    if [ -f "$CONF_DST" ]; then
        cp "$CONF_DST" "${CONF_DST}.bak.$(date +%s)"
        info "Backed up existing ~/.tmux.conf"
    fi
    cp "$CONF_SRC" "$CONF_DST"
    info "tmux.conf deployed → ~/.tmux.conf"
fi

# --- Deploy which-key config ------------------------------------
WK_SRC="${SCRIPT_DIR}/which-key.yaml"
WK_DIR="${HOME}/.config/tmux/plugins/tmux-which-key"
WK_DST="${WK_DIR}/config.yaml"
if [ -f "$WK_SRC" ]; then
    mkdir -p "$WK_DIR"
    cp "$WK_SRC" "$WK_DST"
    info "Which-key config deployed → ${WK_DST}"
fi

# --- Create XDG data dir for which-key build output --------------
mkdir -p "${HOME}/.local/share/tmux/plugins/tmux-which-key"

# --- Install plugins via TPM ------------------------------------
info "Installing tmux plugins..."
TMUX_PLUGIN_MANAGER_PATH="${HOME}/.tmux/plugins" \
    bash "${TPM_DIR}/bin/install_plugins" 2>/dev/null && \
    info "Plugins installed" || \
    info "Plugins will install on next tmux start (press Ctrl-a I)"

# --- Done -------------------------------------------------------
echo ""
echo -e "${GREEN}${BOLD}  ✅ Gotham tmux is ready.${NC}"
echo ""
echo -e "  Start:  ${CYAN}tmux new -s main${NC}"
echo -e "  Attach: ${CYAN}tmux attach -t main${NC}"
echo -e "  Menu:   ${CYAN}Ctrl-a Space${NC}  (which-key — all bindings visible)"
echo -e "  Reload: ${CYAN}Ctrl-a r${NC}"
echo ""
