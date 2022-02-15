# PATH SECTION
if status --is-login
    set -gx PATH $PATH ~/.local/bin
    set -gx PATH $PATH ~/bin
    set -gx PATH $PATH ~/.local/share/gem/ruby/3.0.0/bin
    set -gx PATH $PATH ~/.emacs.d/bin
    set -gx PATH $PATH ~/scripts
end

# ALIAS SECTION
alias git-show-branches="git log --graph --all --format='%C(cyan) %p %Cred %h %C(white) %s %Cgreen(%cr)%C(cyan) <%an>%C(bold yellow)%d%Creset'"

alias md='mkdir'
alias x='ranger'
alias l='exa --group-directories-first -l -T -L 1'
alias la='exa --group-directories-first -la -T -L 1'
alias ll='exa --group-directories-first -l -T -L 3'
alias lla='exa --group-directories-first -la -T -L 3'
alias vim='nvim'
alias :q='exit'
alias :Q='exit'
alias s='dust -r'
alias mc='mc -u'
alias big='expac -s -H M "%m %n"|sort -rhk 1 | head -n 20'
alias top='btop'

#BINDINGS SECTION
bind \cp 'ipython'
bind \cf 'z (fd -H --type directory | fzf)'

# ENABLE Z
zoxide init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
