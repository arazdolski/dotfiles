# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git aws terraform)
source $ZSH/oh-my-zsh.sh

# Command prompt
PS1="%F{#ef3b7d}%~ >%f%b"

# AWS Profile management
alias awsp="source _awsp"
aws_prompt_info() {}

# EveryPay
source /Users/aleksandr/.dev_profile.local.sh
alias kip='python3 /Users/aleksandr/everypay/infrastructure/aws/helpers/kip2.py'

function kipfind(){
  if [ ! $# -gt 1 ]
  then
    echo "USAGE $0 <env> <machine>"
  fi
  kip $1 | grep "\b$2\b"
}
 
function kipip(){
  kipfind $1 $2 | head -n 1 | cut -f2 -d"	"
}
 
function kipssh(){
  login="aleksandrrazdolski"
  if [ ! $# -gt 1 ]
  then
    echo "USAGE $0 <env> <machine>"
  fi
  ssh $login@$(kipip $1 $2)
}

# AWS 
export AWS_REGION="eu-west-1"
export AWS_DEFAULT_REGION="eu-west-1"

# Ruby
eval "$(rbenv init - zsh)"
export GEM_HOME="$HOME/.gem"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# Python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Golang
GOPATH="$HOME/go"
GOROOT="/usr/local/go"

# EB CLI
echo 'export PATH="/Users/aleksandr/.ebcli-virtual-env/executables:$PATH"' >> ~/.zshenv && source ~/.zshenv

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
