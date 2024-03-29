# default
autoload -U compinit
compinit
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

# aliases
alias ls='ls -G'
alias ll='ls -la'
alias r=rails
alias rs='rails server'
alias rc='rails console'

# apache, mysql
alias startapache='sudo /opt/local/apache2/bin/apachectl start'
alias stopapache='sudo /opt/local/apache2/bin/apachectl stop'
alias restartapache='sudo /opt/local/apache2/bin/apachectl restart'
alias startmysql='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias stopmysql='sudo /opt/local/share/mysql5/mysql/mysql.server stop'

# carbon emacs
alias cemacs='open -n /Applications/Emacs.app'

# for MacPorts
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH

# for mysql
export PATH=$PATH:/opt/local/lib/mysql5/bin

# for android-sdk
export PATH=$PATH:/Developer/SDKs/android-sdk-macosx/tools

# for RVM
#if [[ -s /Users/runeleaf/.rvm/scripts/rvm ]] ; then source /Users/runeleaf/.rvm/scripts/rvm ; fi
 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
