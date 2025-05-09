if status is-interactive
    # Commands to run in interactive sessions can go here
end

~/.local/bin/mise activate fish | source

source "$HOME/.cargo/env.fish"

alias vim=nvim
