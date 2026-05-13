# ============================================================
#  ZSH CONFIG - Capitão Stardev Enterprise
# ============================================================

# ===========================
# HISTÓRICO
# ===========================
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt share_history hist_ignore_dups hist_ignore_space append_history HIST_FIND_NO_DUPS

# ===========================
# TECLADO & QUALIDADE DE VIDA
# ===========================
bindkey -e
setopt correct no_beep auto_cd

# ===========================
# FUNÇÃO UTILITÁRIA DE PATH
# ===========================
add_to_path() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$1:$PATH" ;;
  esac
}

# ===========================
# PATHS GERAIS
# ===========================
add_to_path "/opt/homebrew/bin"
add_to_path "/usr/local/share/dotnet"
add_to_path "$HOME/.composer/vendor/bin"
add_to_path "$HOME/.asdf/shims"
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/bin"
add_to_path "/opt/nvim-linux-x86_64/bin"

# ===========================
# ANDROID SDK
# ===========================
export ANDROID_HOME="$HOME/Android"
export ANDROID_SDK_ROOT="$ANDROID_HOME/Sdk"
add_to_path "$ANDROID_HOME/cmdline-tools/latest/bin"
add_to_path "$ANDROID_HOME/platform-tools"
add_to_path "$ANDROID_HOME/emulator"
add_to_path "$ANDROID_HOME/tools"

# ===========================
# GOLANG
# ===========================
export GOLANG_HOME="$HOME/go"
add_to_path "$GOLANG_HOME/bin"

# ===========================
# DOTNET
# ===========================
export DOTNET_ROOT="$HOME/.asdf/installs/dotnet-core/7.0.410"
add_to_path "$DOTNET_ROOT"
add_to_path "$DOTNET_ROOT/tools"

# ===========================
# VERSION MANAGERS & SDKs
# ===========================
export ASDF_DIR="$HOME/.asdf"
[ -f "$ASDF_DIR/asdf.sh" ] && . "$ASDF_DIR/asdf.sh"
[ -f "$ASDF_DIR/completions/asdf.bash" ] && . "$ASDF_DIR/completions/asdf.bash"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ===========================
# AUTOCOMPLETE & SUGESTÕES
# ===========================
autoload -Uz compinit
compinit
zstyle :compinstall filename "$HOME/.zshrc"

# Sugestões & Highlighting
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#7D7D7D'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autocomplete avançado
 source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
 zstyle ':autocomplete:*' default-context history-incremental-search-backward
 zstyle ':autocomplete:*' min-input 1
 zstyle ':autocomplete:*' list-lines 8
 bindkey -M menuselect '\r' .accept-line

# ===========================
# FZF + FZF-TAB
# ===========================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --preview 'bat --style=numbers --color=always --line-range :500 {} || cat {}'
  --preview-window=right:60%
"

# ===========================
# OUTROS INITs
# ===========================
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config ~/Desktop/docs/scripts/custom-ohmyposh-theme.json)"
source <(ng completion script)
eval $(thefuck --alias)

# ===========================
# FUNÇÕES PERSONALIZADAS
# ===========================

zt() { sudo zerotier-cli "$@"; }

nnote() {
  local notepath=~/Desktop/docs/notes
  local note="$1"

  if [[ -z "$note" ]]; then
    echo -n "New note name [default Current DateTime]: "
    read note
  fi

  if [[ -z "$note" ]]; then
    echo "Name not informed, use date composition? (y/n)"
    read option
    case "$option" in
      [Yy])
        local localDate=$(date +"%Y-%m-%d")
        cd "$notepath"
        nvim "./newNote-${localDate}.md"
        return
      ;;
      [Nn])
        echo "Abortando..."
        return
      ;;
      *)
        echo "Entrada inválida. Abortando..."
        return
      ;;
    esac
  fi

  [[ "$note" != *.md ]] && note="${note}.md"
  cd "$notepath" && nvim "./${note}"
}

update-dots() {
  local notesbackup="$HOME/ducky-dots/"
  local updatearchives=(".config" ".zshrc" ".bashrc")

  [[ ! -e $notesbackup ]] && mkdir -p "$notesbackup" && echo "Criando $notesbackup..."

  echo "Iniciando backup..."
  for item in $updatearchives; do
    if [[ -e $HOME/$item ]]; then
      cp -r "$HOME/$item" "$notesbackup/" && echo "[OK] - $item copiado."
    else
      echo "[INFO] - $item não existe, ignorando..."
    fi
  done

  echo "Backup concluído."
  echo "Deseja atualizar o repositório git? (y/n)"
  read option
  case "$option" in
    [Yy]) git -C "$notesbackup" add . && git commit -m "backup update" && git push ;;
    [Nn]) echo "Encerrando sem atualizar Git." ;;
    *) echo "Entrada inválida. Abortando..." ;;
  esac
}

# ===========================
# ALIASES
# ===========================

# Navegação
alias ..='cd ..'
alias ...='cd ../..'
alias jump='z'

# Utilitários
alias oc='opencode'
alias c='clear'
alias reload='source ~/.zshrc'
alias update='sudo apt update && sudo apt upgrade -y'
alias vi="nvim"

# Python
alias python='python3'
alias py='python3'
alias pip='pip3'

# Git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias lg='lazygit'
alias gf='git flow'

# LS (eza com estilo)
alias ls='eza -l --icons'
alias la='eza -la --icons'
alias ll='eza -lh --icons'
alias tree='eza -T --icons'

# Fd compatível com fzf
alias fd='fdfind'

# Web Utils
alias web='xdg-open'

# PHP / LAMPP
alias php-start='sudo /opt/lampp/lampp start'
alias php-stop='sudo /opt/lampp/lampp stop'
alias php-panel='sudo /opt/lampp/manager-linux-x64.run'

# ===========================
# VARIÁVEIS GLOBAIS
# ===========================
export H2_HOME="$HOME/.asdf/shims/mvn"
# source ~/.secrets/openai.sh
# export OPENAI_API_KEY="seu_token_aqui"

# ===========================
# MENSAGEM FINAL
# ===========================
[[ $- == *i* ]] || return 
neofetch
echo " Terminal pronto, Capitão. Engajando Warp 9 rumo à produtividade!"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/pato/.lmstudio/bin"
# End of LM Studio CLI section


# opencode
export PATH=/home/pato/.opencode/bin:$PATH
