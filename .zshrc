# aliases
alias ls='ls -G'
alias ll='ls -la'

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

