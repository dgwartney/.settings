eval "$(/opt/homebrew/bin/brew shellenv)"

# Suppress the Z shell warning on mac
# Ignore annoying message about deprecation of bash shell on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1

# Enable command line editing with VI
set -o vi

#
# MySQL Configuration
#
MYSQL_HOME=/usr/local/mysql
export PATH=$PATH:$MYSQL_HOME/bin


#
# Alias
#

#
# Short cuts for GIT commands
#
export GITS=$HOME/git
alias gits="cd $GITS"

alias resume="cd $GITS/private"
alias git-log='git log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'
alias nlx-services="cd $GITS/nlx-lambda-services"
alias nycta="cd $GITS/aws-lambda-nycta"
alias ual="cd $GITS/aws-lambda-united"
alias peak="cd $GITS/aws-lambda-peaknatural"
alias wma="cd $GITS/aws-lambda-wma"
alias weather="cd $GITS/aws-lambda-weather"
alias sales-force="cd $GITS/aws-lambda-sales-force"
alias zendesk="cd $GITS/aws-lambda-zendesk"
alias paceline="cd $GITS/aws-lambda-paceline"
alias empire="cd $GITS/aws-outbound-calling"
alias connect-air="cd $GITS/aws-lambda-connect-air"

# Git Repositories
alias flask-rest="cd $GITS/flask-rest"
alias nlx-api="cd $GITS/nlx-python-api"

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

function nlx_aws() {
  command=$1

}

function my-address() {
	echo "ipv4: $(curl -s -4 icanhazip.com)"
	echo "ipv6: $(curl -s -6 icanhazip.com)"
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
