# Set up pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/bryan/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "/home/bryan/miniconda3/etc/profile.d/conda.sh" ]; then
        #. "/home/bryan/miniconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="/home/bryan/miniconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup
# <<< conda initialize <<<


# Created by `pipx` on 2022-10-05 14:34:05
export PATH="$PATH:/home/bryan/.local/bin"
