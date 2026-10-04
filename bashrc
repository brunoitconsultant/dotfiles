source /usr/lib/git-core/git-sh-prompt

# ADDED: Configure git-sh-prompt flags to enable indicators (*, %, =)
export GIT_PS1_SHOWDIRTYSTATE=1      # Shows '*' for unstaged modifications
export GIT_PS1_SHOWUNTRACKEDFILES=1  # Shows '%' for untracked files
export GIT_PS1_SHOWUPSTREAM="auto"   # Shows '=' when synced, '<' or '>' when out of sync

function set_bash_prompt () {
        # CHANGED: Capture exit status immediately to fix command tracking bug
        local EXIT_STATUS=$?

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

        # CHANGED: Evaluates the saved EXIT_STATUS instead of volatile $?
        if [ $EXIT_STATUS -eq 0 ]; then
                PATH_COLOR=${COLOR_PATH_OK}
        else
                PATH_COLOR=${COLOR_PATH_ERR}
        fi

        # Top Line: bruno@GINQO34 >> [Count] Path
        PS1="${COLOR_USERNAME}\u${COLOR_USERHOSTAT}@${COLOR_HOSTNAME}\h${COLOR_NONE} ${COLOR_DIVIDER}[${COLOR_CMDCOUNT}\#${COLOR_DIVIDER}] ${PATH_COLOR}\w"

        # CHANGED: Replaced manual branch parsing with Git's official dynamic prompt function
        if declare -f __git_ps1 >/dev/null; then
                local git_info
                git_info=$(__git_ps1 " (%s)") # Safely builds the dynamic " (branch *%=)" text
                if [ -n "$git_info" ]; then
                        PS1="${PS1}${COLOR_GITBRANCH}${git_info}${COLOR_NONE}"
                fi
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

