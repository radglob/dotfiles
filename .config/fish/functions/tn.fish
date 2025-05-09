function tn --wraps tmux --description 'Creates a new tmux session'
    tmux new -s $argv
end
