function t --wraps tmux --description 'Attaches to an existing tmux session'
    tmux attach -t $argv
end
