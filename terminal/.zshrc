# path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  git
  bundler
  dotenv
  zsh-autosuggestions
  rake
  zsh-syntax-highlighting
  rbenv
  ruby
  npm
)

PROMPT_EOL_MARK=''

source $ZSH/oh-my-zsh.sh

# export GOROOT="/usr/local/Cellar/go/1.16.6/libexec"
export GOROOT=""
export GOPATH="/Users/Shared/Development/go-workspace"
export PATH="$PATH:$GOPATH/bin"

# rust bin configs
export PATH="$PATH:/Users/andreasbigger/.foundry/bin"
export PATH="$PATH:/Users/andreasbigger/.huff/bin"
export PATH="$PATH:$(yarn global bin)"

# rust stuff
export CARGO_NET_GIT_FETCH_WITH_CLI=true

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# aliases
alias dc="docker-compose"
alias kx="kubectx"
alias k="kubectl"
alias python=/usr/bin/python3
alias spark="cargo +nightly fmt --all"
alias sleep="pmset sleepnow"
alias flint="cargo check --all && cargo +nightly fmt -- --check && cargo +nightly clippy --all --all-features -- -D warnings && cargo test --all --all-features"
alias rock='spark && flint'
alias eagle="cargo test -- --show-output"


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH


