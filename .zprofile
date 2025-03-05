
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
# Docker
#
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

##
#  API data.gov
#
[ -r $HOME/.api.data.gov ] && source $HOME/.api.data.gov

##
# Anthropic API Key
# 
[ -r $HOME/.anthropic ] && source $HOME/.anthropic

##
# Deepgram API Key
#
[ -r $HOME/.deepgram ] && source $HOME/.deepgram

#
# Lang-chain
#
function lang-chain() {
  conda activate lang-chain
  cd $HOME/git/lang-chain
}


##
## Alias
##
##

#
# AWS
#
alias aws-profiles="cat $HOME/.aws/credentials | grep -e '^\[' | tr -d '[]' | sort"

export AWS_DEFAULT_REGION=us-east-1

function vpc-dependencies() {
  if ( $# -ne 1 )
   then
      echo "usage: $(basename $0) vpc_id"
      return 1;
   else
    aws ec2 describe-internet-gateways --filters 'Name=attachment.vpc-id,Values='$vpc | grep InternetGatewayId
    aws ec2 describe-subnets --filters 'Name=vpc-id,Values='$vpc | grep SubnetId
    aws ec2 describe-route-tables --filters 'Name=vpc-id,Values='$vpc | grep RouteTableId
    aws ec2 describe-network-acls --filters 'Name=vpc-id,Values='$vpc | grep NetworkAclId
    aws ec2 describe-vpc-peering-connections --filters 'Name=requester-vpc-info.vpc-id,Values='$vpc | grep VpcPeeringConnectionId
    aws ec2 describe-vpc-endpoints --filters 'Name=vpc-id,Values='$vpc | grep VpcEndpointId
    aws ec2 describe-nat-gateways --filter 'Name=vpc-id,Values='$vpc | grep NatGatewayId
    aws ec2 describe-security-groups --filters 'Name=vpc-id,Values='$vpc | grep GroupId
    aws ec2 describe-instances --filters 'Name=vpc-id,Values='$vpc | grep InstanceId
    aws ec2 describe-vpn-connections --filters 'Name=vpc-id,Values='$vpc | grep VpnConnectionId
    aws ec2 describe-vpn-gateways --filters 'Name=attachment.vpc-id,Values='$vpc | grep VpnGatewayId
    aws ec2 describe-network-interfaces --filters 'Name=vpc-id,Values='$vpc | grep NetworkInterfaceId
  fi
  return 0;
}

#
# Short cuts for GIT commands
#
export GITS=$HOME/git
alias gits="cd $GITS"
alias ae="cd $GITS/kore-app-examples"
alias ai4w="cd $GITS/kore-ai4w-integrations"
alias allegion="cd $GITS/kore-allegion"
alias balsam="cd $GITS/kore-balsam-hill"
alias bank="cd $GITS/kore-bank-demo"
alias bfs="cd $GITS/kore-builders-first-source"
alias broad="cd $GITS/kore-broadcom"
alias caesars="cd $GITS/kore-caesars"
alias cass="cd $GITS/kore-cass-information-systems"
alias calend="cd $GITS/kore-calendly"
alias ccai="cd $GITS/kore-ccai-guide"
alias chat="cd $GITS/chat-server"
alias columbia="cd $GITS/kore-columbia"
alias ebay="cd $GITS/kore-ebay"
alias eqx="cd $GITS/kore-equinix-bot-kit"
alias five9="cd $GITS/kore-five9-botkit"
alias gse="cd $GITS/kore-gale-se"
alias hca="cd $GITS/kore-hca"
alias hotel="cd $GITS/kore-hotel"
alias hunter="cd $GITS/hunter-douglas"
alias insur="cd $GITS/kore-va-applications/openai-agent-api"
alias gale="cd $GITS/kore-gale-se-guide"
alias kct="cd $GITS/kore-citi-testing"
alias kgg="cd $GITS/kore-gale-gui"
alias kwa="cd $GITS/kore-ai-webhook-api"
alias kretail="cd $GITS/kore-retail"
alias kxe="cd $GITS/kore-xo11-eval"
alias kz="cd $GITS/kore-zendesk-agent-assist"
alias lenovo="cd $GITS/kore-lenovo"
alias lh="cd $GITS/kore-language-handling"
alias mshelp="cd $GITS/kore-microsoft-help"
alias onero="cd $GITS/kore-onero"
alias ring="cd $GITS/kore-ring-central"
alias roku="cd $GITS/kore-roku"
alias s3proj="cd $GITS/kore-valvoline"
alias snow="cd $GITS/kore-snow-virtual-agent-api"
alias twitch="cd $GITS/kore-twitch"
alias webp="cd $GITS/web-sdk-playground"

alias git-grep="git rev-list --all | xargs git grep -F"

# Remove local branches
# git branch --merged main | grep -v "main" | xargs -n 1 git branch -d
#
# Autocorrect
# git config --global help.autocorrect 1
#
# git config --global fetch.prune true

#
# Git Respositories
#



function clock() {
   while true; do printf '%s\r' "$(date)" ; sleep 0 ; done
}

alias git-log='git log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'

# Git Repositories
alias flask-rest="cd $GITS/flask-rest"

export PATH=/usr/local/bin:$PATH

#
# NPM repositories
#

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

function my-address() {
  echo "ipv4: $(curl -s -4 icanhazip.com)"
  echo "ipv6: $(curl -s -6 icanhazip.com)"
}

function one-p() {
  pbcopy < ~/.one-password 
}

function use-git() {
   # check to see if an agent is running
   pgrep -fl ssh-agent 2>&1 > /dev/null
#   if [ $? -eq 1 ]
#   then
     eval "$(ssh-agent -s)"
     ssh-add ~/.ssh/id_ed25519
#   fi
}

# OpenAI Keys
[ -f $HOME/.openai ] && source $HOME/.openai

# Google Keys
[ -f $HOME/.google ] && source $HOME/.google

# Hugging Face
[ -f $HOME/.hug ] && source $HOME/.hug
#
# Pinecone
[ -f $HOME/.pinecone ] && source $HOME/.pinecone


#
# Ruby Version Manager
#
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/opt/homebrew/anaconda3/bin:$PATH


eval "$(/opt/homebrew/bin/brew shellenv)"

# FZF
source <(fzf --zsh)

#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
