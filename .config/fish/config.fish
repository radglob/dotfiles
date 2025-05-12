if status is-interactive
    # Commands to run in interactive sessions can go here
end

~/.local/bin/mise activate fish | source

if test -d "$HOME/.cargo"
    source "$HOME/.cargo/env.fish"
end

if test -d /opt/homebrew/
    /opt/homebrew/bin/brew shellenv | source
end

alias vim=nvim
