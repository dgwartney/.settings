# Ignore annoying message about deprecation of bash shell on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1

# Enable command line editing with VI
set -o vi

# Python configuration
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

#
# MySQL Configuration
#
MYSQL_HOME=/usr/local/mysql
export PATH=$PATH:$MYSQL_HOME/bin

#
#
#
#export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
#export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

#alias java8='export JAVA_HOME=$JAVA_8_HOME'
#alias java11='export JAVA_HOME=$JAVA_11_HOME'
# default to Java 11
#java11

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
export PATH="/usr/local/opt/openjdk/bin:$PATH"


#
# Alias
#

#
# Short cuts for GIT commands
#
export GITS=$HOME/git
alias gits="cd $GITS"
alias ab="cd $GITS/ab-inbev-salesforce"
alias git-log='git log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'


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
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidgwartney/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/davidgwartney/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidgwartney/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/davidgwartney/Downloads/google-cloud-sdk/completion.bash.inc'; fi
export GOOGLE_APPLICATION_CREDENTIALS=/Users/davidgwartney/SpeakEasy-f58f5d46a47e.json
