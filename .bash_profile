# Ignore annoying message about deprecation of bash shell on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1

# Enable command line editing with VI
set -o vi


#
# Alias
#

#
# Shortcuts to GIT repositories
#
export GITS=$HOME/git
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


