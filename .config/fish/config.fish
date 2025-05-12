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

# Support for local fish config (using this on client laptops)
if test -e "$HOME/.config/fish/config.local.fish"
    source "$HOME/.config/fish/config.local.fish"
end
