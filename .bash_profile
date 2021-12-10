# Suppress the Z shell warning on mac
export BASH_SILENCE_DEPRECATION_WARNING=1

# Enable command line editing with VI
set -o vi

#
# EC2 Tools
#
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.6.12.2
export PATH=$PATH:$EC2_HOME/bin

[[ -r $HOME/.ec2-credentials ]] && source $HOME/.ec2-credentials

#
# CloudWatch Tools
#
export AWS_CLOUDWATCH_HOME=/usr/local/ec2/CloudWatch-1.0.20.0
export PATH=$PATH:$AWS_CLOUDWATCH_HOME/bin
export AWS_CLOUDWATCH_URL=http://monitoring.us-west-1.amazonaws.com/
export AWS_CREDENTIAL_FILE=$HOME/.cloudwatch-credentials

#
# Alias
#

#
# Shortcuts to GIT repositories
#
export GIT_WORKING=$HOME/git_working
export GITS=$HOME/git
alias gitw="cd $GIT_WORKING"
alias gits="cd $GITS"
alias resume="cd $GITS/private"

export PATH=/usr/local/bin:$PATH


#
# Matlab
#
alias matlab="/Applications/MATLAB_R2015a.app/bin/matlab -nodesktop"

#
# Data Integration
#

function spoon() {
 export PENTAHO_DI_JAVA_OPTIONS="-Xmx4096m -XX:MaxPermSize=4096m"
 pushd /Applications/data-integration > /dev/null 2>&1
 ./spoon.sh > /dev/null 2>&1 &
 popd > /dev/null 2>&1
}


#
# Ruby Version Manager
#
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.cargo/bin:$PATH"
