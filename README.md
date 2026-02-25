Bash Shell Configuration
========================

Repository to store Bash settings

## Installation

Run the following command to configure the bash shell configuration files:

```
./setup
```

## Additional Installation For Environment

### Misc

```
$ mkdir $HOME/git
```

- Brew

### Basic Utilities

```
$ brew install wget
```

### Python 3

Use brew to install the Anaconda Python 3 distribution

*NOTE*: Alternative is to use `uv`.

```
$ brew cask install anaconda
```

Add configuration to `.bash_profile`:

```
export PATH="/usr/local/anaconda3/bin:$PATH"
```

### Node Version Manager

```
brew install nvm
```

```
mkdir ~/.nvm
```

```
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
```

### Docker

```
$ brew install --cask docker
```

### Virtual Box

```
$ brew cask install virtualbox
```

### Vagrant

```
$ brew cask install vagrant
```

Vagrant-Manager helps you manage all your virtual machines in one place directly from the menubar.

```
$ brew cask install vagrant-manager
```

### Pandoc

```
$ brew install pandoc
```


### LaTex

```
$ brew install --cask mactex-no-gui
```

### DejaVu Sans Font

```
$ brew install --cask font-dejavu
```

### Poppler

```
$ brew install poppler
```

### CVSKIT

```
$ brew install cvskit
```
