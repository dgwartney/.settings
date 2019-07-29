# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/davidgwartney/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/davidgwartney/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/davidgwartney/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/davidgwartney/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

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

#
# Help function that activates the python
# virtual environment in the current working
# directory
function pact() {
  typeset -r version=$1
  if [ "$version" == "2" ]
  then
    typeset -r python_dir="python"
  else
    typeset -r python_dir="python3"
  fi

  if [ -d "./$python_dir" ]
  then
    . $python_dir/bin/activate
  elif [ -d $HOME/$python_dir ] 
  then
    . $HOME/$python_dir/bin/activate
  else
    :
  fi

  return 0
}

alias py="pact 2"
alias py2="pact 2"
alias py3="pact 3"

# added by Anaconda3 2.3.0 installer
export PATH="/anaconda/bin:$PATH"

# particle
export PATH="$HOME/bin:$PATH"


