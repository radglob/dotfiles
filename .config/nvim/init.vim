call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/fzf'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'roxma/nvim-yarp'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'

call plug#end()

let g:deoplete#enable_at_startup = 1

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 

set splitright
set splitbelow

syntax enable
set number
set background=dark
colorscheme nord

" Use Powerline symbols in Airline.
let g:airline_powerline_fonts = 1
