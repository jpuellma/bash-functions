local uname_a
uname_a=$(uname -a)

# Environment-specific:
case ${uname_a} in
    Darwin*)
        alias ls='ls -G'
        alias ll='ls -l'
        alias l='ls'
        alias lrtail='ls -lrt | tail'
        alias grep='/usr/bin/grep --color=always'
        alias updatedb='/usr/libexec/locate.updatedb'
        alias less='less -RFX'
        alias cdsvn='cd ~/svn'
        ;;
    *Linux*)
        alias ls='/bin/ls --color=always'
        alias ll='ls -l'
        alias l='ls'
        alias lrtail='ls -lrt | tail'
        alias grep='/bin/grep --color=always'
        alias less='less -RFX'
        alias tree='tree -c'
        ;;
    * )
        ;;
esac

# Universal
alias gerp='grep'
alias pat="puppet agent -t 2>&1 | tee ~/pat.out"
alias patd="puppet agent -t --debug 2>&1 | tee ~/pat.out"
alias ppv='puppet parser validate'
alias puppet-lint='puppet-lint --no-autoloader_layout-check --no-hard_tabs-check --no-trailing_whitespace-check --no-2sp_soft_tabs-check --no-single_quote_string_with_variables-check'
