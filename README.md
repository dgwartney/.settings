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

```
$ brew cask install anaconda
```

Add configuration to `.bash_profile`:

```
export PATH="/usr/local/anaconda3/bin:$PATH"
```

### Docker

```
$ brew cask install docker
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
