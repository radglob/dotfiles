" vim:set ts=2 sts=2 sw=2 expandtab:

call plug#begin()

" General Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" JavaScript
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Clojure
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'SevereOverfl0w/vim-replant', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" treesitter support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

call plug#end()

"""""""""""""""""""""""""""""""""""""""
" Basic Editor Configuration          "
"""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set history=10000
set expandtab
set tabstop=2
set number
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" Make searches case sensitive only if they contain upper-case characters.
set ignorecase smartcase
set cursorline
set cmdheight=1
set switchbuf=useopen
" Always show tab bar at the top
set showtabline=2
set winwidth=79

" Don't make backups.
set nobackup
set nowritebackup
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
" Display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
set termguicolors
set background=dark
colorscheme monokai_pro

" Enable file type detection.
filetype plugin indent on

" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3

" Turn folding off
set foldmethod=manual
set nofoldenable

set nojoinspaces

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" Show diffs side-by-side
set diffopt=vertical

" Default split configuration
set splitright
set splitbelow

set textwidth=80

""""""""""""""""""""""""""""""""""""""""
" Custom autocmds                      "
""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " For ruby, autoindent with two spaces, always expand tabs
  autocmd FileType elixir,eelixir,leex,yaml,html,sass set ai sw=2 sts=2 et

  autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Don't syntax highlight markdown
  autocmd! FileType mkd setlocal syn=off

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=

  " javascript
  autocmd! FileType javascript set sw=2 sts=2 et

  " Two-space indents in JSON
  autocmd! FileType json set sw=2 sts=2 et

  " Unmap Rdoc for ruby files.
  nnoremap K <Nop>

  " Compute syntax highlighting from beginning of file.
  autocmd BufEnter * :syntax sync fromstart

  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd BufNewFile,BufRead .prettierrc,.eslintrc set filetype=json

  " Enable rainbow parens for Clojure(Script)
  autocmd FileType clojure RainbowParentheses
augroup END

""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3lm%02c%03V%)

""""""""""""""""""""""""""""""""""""""""
" Misc keymaps
""""""""""""""""""""""""""""""""""""""""
" Change splits without <C-W>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 

" Fuzzy find with <C-P>
nmap <C-P> :Files<CR>

nnoremap <C-F> :Rg<CR>

""""""""""""""""""""""""""""""""""""""""
" LSP Config
""""""""""""""""""""""""""""""""""""""""

lua << EOF
require'lspconfig'.elixirls.setup{
  cmd={"/home/jln/bin/elixir-ls/language_server.sh"},
  filetypes={ "elixir", "eelixir" }
}

require'lspconfig'.clojure_lsp.setup{}

require'lspconfig'.pyls.setup{
  cmd={ "pylsp" },
  filetypes={ "python" }
}
EOF

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

autocmd BufWritePre *.clj lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cljs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between production and test code for Elixir 
""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_test = match(current_file, '^test/') != -1
  let going_to_test = !in_test
  let in_lib = match(current_file, '^lib/') != -1

  if going_to_test
    if in_lib
      let new_file = substitute(new_file, '^lib/', '', '')
    end
    let new_file = substitute(new_file, '\.ex$', '_test.exs', '')
    let new_file = 'test/' . new_file
  else
    let new_file = substitute(new_file, '_test\.exs$', '.ex', '')
    let new_file = substitute(new_file, '^test/', '', '')
    let new_file = 'lib/' . new_file
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  let in_test_file = match(expand("%"), '_test.exs$') != -1

  if in_test_file
    call SetTestFile(command_suffix)
  elseif !exists("t:jln_test_file")
    return
  end
  call RunTests(t:jln_test_file)
endfunction

function! RunNearestTest()
  let test_line_number = line('.')
  call RunTestFile(":" . test_line_number)
endfunction

function! SetTestFile(command_suffix)
  let t:jln_test_file=@% . a:command_suffix
endfunction

function! RunTests(filename)
  if expand("%") != ""
    :w
  end
  if executable(a:filename)
    exec ":!./" . a:filename
  elseif filereadable("mix.exs") && strlen(glob("test/**/*.exs"))
    exec ":!mix test " . a:filename
  end
endfunction
