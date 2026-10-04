source /usr/lib/git-core/git-sh-prompt

function set_bash_prompt () {
        # Color codes for easy prompt building
        COLOR_DIVIDER="\[\e[30;1m\]"
        COLOR_CMDCOUNT="\[\e[34;1m\]"
        COLOR_USERNAME="\[\e[34;1m\]"
        COLOR_USERHOSTAT="\[\e[34;1m\]"
        COLOR_HOSTNAME="\[\e[34;1m\]"
        COLOR_GITBRANCH="\[\e[33;1m\]"
        COLOR_VENV="\[\e[33;1m\]"
        COLOR_PATH_OK="\[\e[32;1m\]"
        COLOR_PATH_ERR="\[\e[31;1m\]"
        COLOR_NONE="\[\e[0m\]"

        # Change the path color based on return value
        if [ $? -eq 0 ]; then
                PATH_COLOR=${COLOR_PATH_OK}
        else
                PATH_COLOR=${COLOR_PATH_ERR}
        fi

        # Top Line: bruno@GINQO34 >> [Count] Path
        PS1="${COLOR_USERNAME}\u${COLOR_USERHOSTAT}@${COLOR_HOSTNAME}\h${COLOR_NONE} ${COLOR_DIVIDER}[${COLOR_CMDCOUNT}\#${COLOR_DIVIDER}] ${PATH_COLOR}\w"

        # Top Line: Append Git Branch if it exists
        if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
                GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
                PS1="${PS1} ${COLOR_GITBRANCH}(${GIT_BRANCH})"
        fi

        # Top Line: Append Python VirtualEnv if it exists
        if [ -n "$VIRTUAL_ENV" ]; then
                PS1="${PS1} ${COLOR_VENV}($(basename "$VIRTUAL_ENV"))"
        fi

        # End Top Line with a colon, then move down (\n) to the next line for typing
        PS1="${PS1}${COLOR_DIVIDER}:\n${COLOR_NONE}\$ "
}
export PROMPT_COMMAND=set_bash_prompt

alias ls="echo && command ls -F --color=always --group-directories-first"
alias ll="echo && command ls -lhF --color=always --group-directories-first"
alias la="echo && command ls -lahF --color=always --group-directories-first"
alias ide='~/dotfiles/ide.sh'
