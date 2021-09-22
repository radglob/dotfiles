local cmd = vim.cmd

cmd(':command SptToggle exec ":!spt pb -t"')
cmd(':command -nargs=+ SptPlaySong exec ":!spt p --name \"<args>\" --track"')
cmd(':command -nargs=+ SptPlayPlaylist exec ":!spt p --name \"<args>\" --playlist"')
cmd(':command -nargs=+ SptPlayAlbum exec ":!spt p --name \"<args>\" --album"')
cmd(':command SptToggleShuffle exec ":!spt pb --shuffle"')
cmd(':command SptShow exec ":!spt pb -s"')
cmd(':command SptNext exec ":!spt pb -n"')
cmd(':command SptPrev exec ":!spt pb -p"')
cmd(':command SptLike exec ":!spt pb --like"')
