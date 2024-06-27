# The /etc/zshenv and .zshenv configuration files are used to define environment variables. They are always invoked each time a zsh session is started, therefore they should contain the less possible content. Only commands that don’t produce output should be written in these files.
ZDOTDIR=$HOME/.config/zsh

if [ -f /etc/profile ]; then
    . /etc/profile
fi

if [ -f $HOME/.config/zsh/.profile ]; then
    . $HOME/.config/zsh/.profile
fi

skip_global_compinit=1
