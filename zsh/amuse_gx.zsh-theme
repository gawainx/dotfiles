# vim:ft=zsh ts=2 sw=2 sts=2

# functions
function get_right_prompt() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo -n "$(git_prompt_short_sha)%{$reset_color%}"
    else
        echo -n "%{$reset_color%}"
    fi
}
function check_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info 2> /dev/null) ]]; then
            echo "%{$fg[blue]%}detached-head%{$reset_color%}) $(git_prompt_info) $(git_prompt_status)
%{$fg[yellow]%} "
        else
            echo "$(git_prompt_info) $(git_prompt_status)%{$fg_bold[cyan]%} "
        fi
    else
        echo "%{$fg_bold[cyan]%} "
    fi
}

# # Must use Powerline font, for \uE0A0 to render.
# ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} !"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%} ?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}^"


# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"

# ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
# ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

# PROMPT='%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info) ⌚ %{$fg_bold[green]%}%*%{$reset_color%}
# λ '
PROMPT='%{$fg_bold[cyan]%}%'${AMUSE_GX_N_DIR_LEVELS:-3}'~%{$reset_color%}$(git_prompt_info) ⌚️ %{$fg_bold[green]%}%*%{$reset_color%}
λ '
RPROMPT='$(get_right_prompt)'
DISABLE_UNTRACKED_FILES_DIRTY="true"

# RPROMPT='$(ruby_prompt_info)'

