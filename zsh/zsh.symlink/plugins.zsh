
case "$OSTYPE" in
    linux*)
        export ZPLUG_HOME=~/.zplug
        source /usr/share/zplug/init.zsh
        ;;
    darwin*)
        export ZPLUG_HOME=/opt/homebrew/opt/zplug
        ;;
    *)
        export ZPLUG_HOME=/usr/share/zplug
        ;;
esac
echo $ZPLUG_HOME
#source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check --verbose; then
	printf "Install [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load
