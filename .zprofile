
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
#  API Airlabs
#
[ -r $HOME/.airlabs ] && source $HOME/.airlabs

##
# Anthropic API Key
# 
[ -r $HOME/.anthropic ] && source $HOME/.anthropic
#

##
# Aviation Stack API Key
# 
[ -r $HOME/.aviationstack ] && source $HOME/.aviationstack
#

##
#  Brave Search API Key
#
[ -r $HOME/.brave ] && source $HOME/.brave



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

# Genesys Keys
[ -f $HOME/.genesys ] && source $HOME/.genesys

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
# Send Grid
#
[ -f $HOME/.send-grid ] && source $HOME/.send-grid

#
# Specify a title on the MacOS terminal
#
function title() {
  printf "\033]0;%s\007" "$1"
}

#
# sound-chek
#
function sound-check() {
    afplay $HOME/.local/share/sound-check/piano2.wav
}


#
# Document Tools
#
function gen-pdf() {
  local md_file="$1"
  local option="$2"
  local toc_depth="$3"

  if [[ -z "$md_file" ]]; then
    echo "Usage: gen-pdf <markdown-file> [--toc [depth]]"
    echo "Example: gen-pdf mydoc.md --toc 3"
    return 1
  fi

  # Extract base name without extension
  local base_name="${md_file%.md}"

  # Base pandoc command
  local cmd=(
    pandoc "${base_name}.md"
    -o "${base_name}.pdf"
    --pdf-engine=xelatex
    --variable mainfont="DejaVu Sans"
    --variable monofont="DejaVu Sans Mono"
    --variable geometry:margin=1in
    --syntax-highlighting=tango
##    --number-sections
  )

  # Handle --toc option (with optional depth)
  if [[ "$option" == "--toc" ]]; then
    cmd+=(--toc)
    # If a numeric depth is provided, add it
    if [[ "$toc_depth" =~ ^[0-9]+$ ]]; then
      cmd+=(--toc-depth="$toc_depth")
    else
      # Default to 3 if not provided or invalid
      cmd+=(--toc-depth=3)
    fi
  fi

  # Execute the command
  echo "Running: ${cmd[*]}"
  "${cmd[@]}"
}

#
# AWS
#
alias aws-profiles="cat $HOME/.aws/credentials | grep -e '^\[' | tr -d '[]' | sort"

# export AWS_DEFAULT_REGION=us-east-1

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
#
export GITS=$HOME/git

[ -r $HOME/.aliases ] && source $HOME/.aliases

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
# Inkscape
#
export PATH=$PATH:/Applications/Inkscape.app/Contents/MacOS

#
# Node Version Manager
#
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"


#
# Ruby Version Manager
#
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(/opt/homebrew/bin/brew shellenv)"

#
# JetBrains Toolbox
#
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# FZF
# source <(fzf --zsh)

#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

#
# AWS Configuration
#
#export AWS_REGION=us-east-1
#export AWS_PROFILE=NA-AI-Innovation-822233328621
#export CLAUDE_CODE_USE_BEDROCK=1 # Use AWS Bedrock inference models with Claude Code CLI, uses SSO to configure tokens

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH

# uv tools
export PATH="$HOME/.local/bin:$PATH"


