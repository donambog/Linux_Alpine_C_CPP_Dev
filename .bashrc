# List directory contents
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Remove files and directories with prompts
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Clear the terminal
alias cls='clear'

# Add other useful aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias update='sudo apt-get update && sudo apt-get upgrade'

# Custom PS1 prompt with colors
export PS1="'\e[33;1m\u@\h: \e[31m\W\e[0m\$"

