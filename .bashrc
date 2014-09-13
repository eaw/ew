# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#------------------------------------------------------------------------------
# My own stuff [ew]

# 2014-06-30 00:25:51 -0700 PDT Mon

# Liberal umask
umask 022

# $PS stuff
if [ -f "$HOME/bin/.ps1" ]; then
  . $HOME/bin/.ps1
else
  export PS1='\[\e[0;1;36;44m\]\u@\h:\w\$\[\e[0m\] '
fi

# $PATH stuff
#
# Add /usr/local/bin at the start of $PATH if it doesn't exist already
# (somewhere in $PATH)
if echo $PATH | egrep -v "(^|:)/usr/local/bin(:|$)" > /dev/null 2>&1; then
  export PATH="/usr/local/bin:$PATH"
fi
# Add ~/bin/ at the start of $PATH if it isn't there already
if echo $PATH | egrep -v "^$HOME/bin:" > /dev/null 2>&1; then
  export PATH="$HOME/bin:$PATH"
fi
#
# TODO:  Should also make sure root has 
#   /usr/local/sbin:/sbin:/usr/sbin
# in $PATH

# Locale stuff
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="POSIX"

# Screen stuff
# TODO: This fucks up the $PS1 prompt, so it's currently commented out.
#export PROMPT_COMMAND='[ "$LINENO" = "0" ] && echo -n -e "\033[999E\033[K"; echo -n -e "\033k\033\0134"'

# Meltwater stuff
export MW_WORKSPACE_HOME=/home/ew/svn_tree
export SVNMERGE=/home/ew/bin/svnmerge.py

# Some more environment variables
export HISTCONTROL="ignoredups"
export EDITOR="vi"
export VISUAL="vi"
export PAGER="less"
export LESS="-QiM"
export LESSKEY=~/.less
#
export LYNX_CFG="~/lynx.cfg"
export PYTHONSTARTUP=~/.pythonrc.py
export RCSINIT='-zLT'
export RSYNC_RSH='ssh'
export UNISONBACKUPDIR=/home/ewtmp/.unison/backup/
export BROWSER=firefox

# source file with ssh-agent environment variables if it's there
if [ -e ~/.ssh-agent-env_$HOSTNAME ]; then . ~/.ssh-agent-env_$HOSTNAME; fi

#------------------------------------------------------------------------------

