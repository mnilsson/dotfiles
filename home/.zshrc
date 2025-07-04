 LC_CTYPE=en_US.UTF-8
 LC_ALL=en_US.UTF-8


#
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/config.zsh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/git.zsh
source $HOME/.zsh/docker.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/jenv.zsh


add_to_path $HOME/.local/bin



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
