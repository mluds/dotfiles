set -x PYENV_ROOT $HOME/.pyenv
set -x PATH /usr/sbin $PYENV_ROOT/bin $PATH

status --is-interactive; and source (pyenv init -|psub)

fish_vi_key_bindings

function fish_greeting
    cowsay -f tux "I'd just like to interject for a moment. What you're referring to as Linux, is in fact, GNU/Linux, or as I've recently taken to calling it, GNU plus Linux. Linux is not an operating system unto itself, but rather another free component of a fully functioning GNU system made useful by the GNU corelibs, shell utilities and vital system components comprising a full OS as defined by POSIX."
end

function fish_prompt
    set -l color_cwd
    set -l suffix

    switch $USER
    case root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        else
            set color_cwd $fish_color_cwd
        end
        set suffix '#'
    case '*'
        set color_cwd $fish_color_cwd
        set suffix '>'
    end

    echo -ns "$USER" ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end
