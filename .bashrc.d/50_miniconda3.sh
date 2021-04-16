
function conda_initialize() {
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup

    conda activate base
}

function conda_tab_completion() {
	if (which conda &> /dev/null); then
        if ! (conda list | grep argcomplete &> /dev/null); then 
            conda install argcomplete -y -q &> /dev/null
		fi
        eval "$(register-python-argcomplete conda)"
	fi
}

if [ -d "/opt/miniconda3" ]; then
conda_initialize || true
conda_tab_completion || true


alias @='conda activate'
fi
