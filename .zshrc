# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

export BERA_Home=/home/icaro.quadra/www/BERA_Home
export BERA_API_SOURCE=/home/icaro.quadra/www/BERA_API
export BERA_EmbedJS_SOURCE=/home/icaro.quadra/www/BERA_EmbedJS
export FRONTV2_SOURCE=/home/icaro.quadra/www/BERA_ngEmbedded
export BERA_ngHome=/home/icaro.quadra/www/BERA_ngHome
export website=/home/icaro.quadra/www/website
export DASHBOARD_SOURCE=/home/icaro.quadra/www/dashboard-frontend
export COMMUNITY_CDN=/home/icaro.quadra/www/community-cdn
export COMMUNITY_FRONTEND=/home/icaro.quadra/www/web-community
export ENV_FRONT=production

source $(dirname $(gem which colorls))/tab_complete.sh

alias lc='colorls -lA --sd'
alias ls='colorls -1'
alias lsa='colorls -a --sd'
alias lst='colorls --tree'
set -o vi
