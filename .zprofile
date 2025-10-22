
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


# User specific bin
PATH=$PATH:$HOME/bin


#
# Docker
#
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

##
#  API data.gov
#
[ -r $HOME/.api.data.gov ] && source $HOME/.api.data.gov


##
#  API data.gov
#
[ -r $HOME/.airlabs ] && source $HOME/.airlabs

##
# Anthropic API Key
# 
[ -r $HOME/.anthropic ] && source $HOME/.anthropic

##
# Deepgram API Key
#
[ -r $HOME/.deepgram ] && source $HOME/.deepgram

##
# Google Gemini API Key
#
[ -r $HOME/.gemini ] && source $HOME/.gemini

##
# OpenAI API Key
#
[ -r $HOME/.openai ] && source $HOME/.openai

# Google Keys
[ -f $HOME/.google ] && source $HOME/.google

# Hugging Face
[ -f $HOME/.hug ] && source $HOME/.hug

# Pinecone
[ -f $HOME/.pinecone ] && source $HOME/.pinecone

#
# Lang-chain
#
function lang-chain() {
  conda activate lang-chain
  cd $HOME/git/lang-chain
}



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

##
## Shortcuts for frequently used local GitHub repositories
##
export GITS=$HOME/git
alias abl="cd $GITS/aws-bedrock-llms"
alias audioc="cd $GITS/AudioConnector_OpenAI_RealtimeAPI"
alias bamm="cd $GITS/bamm-bamm"
alias bedrock="cd $GITS/aws-bedrock"
alias gits="cd $GITS"
alias git-grep="git rev-list --all | xargs git grep -F"
alias gpp="cd $GITS/genesys-platform-python"
alias ghotel="cd $GITS/genesys-hospitality"
alias gtlr="cd $GITS/genesys-technical-learning-resources"
alias gutil="cd $GITS/genesys-utilities"
alias gt="cd $GITS/genesys-guides-tutorial"
alias guides="cd $GITS/genesys-guides-v2"
alias idg="cd $GITS/genesys-idioms-guide"
alias mt="cd $GITS/genesys-multi-intent"
alias papi="cd $GITS/genesys-platform-api-tutorial"
alias roadmap="cd $GITS/genesys-roadmap"
alias sb="cd $GITS/genesys-smile-brands"
alias socal="cd $GITS/genesys-socal-gas-co"
alias tah="cd $GITS/travel-and-hospitality-race-kit"
alias va="cd $GITS/voice-assistant"



# Remove local branches
# git branch --merged main | grep -v "main" | xargs -n 1 git branch -d
#
# Autocorrect
# git config --global help.autocorrect 1
#
# git config --global fetch.prune true


function clock() {
   while true; do printf '%s\r' "$(date)" ; sleep 0 ; done
}

alias git-log='git log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'


export PATH=/usr/local/bin:$PATH

#
# NPM repositories
#

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

#
# Dart
#
export PATH="$PATH":"$HOME/.pub-cache/bin"


#
# Flutter
#
export PATH=$PATH:$HOME/Applications/flutter


#
# Ruby Version Manager
#
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#export PATH=/opt/homebrew/anaconda3/bin:$PATH


eval "$(/opt/homebrew/bin/brew shellenv)"

# FZF
# source <(fzf --zsh)

#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH


