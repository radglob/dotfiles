" vim:set ts=2 sts=2 sw=2 expandtab:

call plug#begin()

" General Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'lifepillar/vim-solarized8'

" JavaScript
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'

" Ruby
Plug 'vim-ruby/vim-ruby'

Plug 'elixir-editors/vim-elixir'

" Semantic Support
Plug 'dense-analysis/ale'

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
set background=light
colorscheme solarized8

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
" vim-ruby configuration               "
""""""""""""""""""""""""""""""""""""""""
:let g:ruby_indent_block_style = 'do'
:let g:ruby_indent_assignemtn_style = 'variable'

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
  autocmd FileType ruby,haml,eruby,yaml,html,sass set ai sw=2 sts=2 et

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
augroup END

""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3lm%02c%03V%)

""""""""""""""""""""""""""""""""""""""""
" vim-ale config
""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
  \  'javascript': ['eslint', 'tsserver'], 
  \  'javascript.jsx': ['eslint', 'tsserver'],
  \  'typescript': ['tsserver', 'eslint', 'tsserver'], 
  \  'typescript.tsx': ['tsserver', 'eslint', 'tsserver'],
  \  'ruby': ['standardrb', 'solargraph'],
  \  'elixir': ['elixir-ls']
\}
let g:ale_fixers = {
  \  'javascript': ['prettier'], 
  \  'javascript.jsx': ['prettier'],
  \  'typescript': ['prettier'], 
  \  'typescript.tsx': ['prettier'],
  \  'ruby': ['standardrb'],
  \  'elixir': ['mix_format']
\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_set_loclist = 0
let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_executable = 'eslint --cache'
let g:ale_ruby_standardrb_executable = 'bundle'
let g:ale_elixir_elixir_ls_executable = expand("~/bin/elixir-ls")
let g:ale_completion_enabled = 1
nnoremap gj :ALENextWrap<cr>
nnoremap gk :ALEPreviousWrap<cr>
nnoremap g1 :ALEFirst<cr>
" Kill all ALE-related processes.
nnoremap g0 :ALEStopAllLSPs<cr>

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

"""""""""""""""""""""""""""""""""""""""""
" Switch between production and test code
"""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
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

  let in_test_file = match(expand("%"), '\(_spec.rb\|.test.ts[x]\|.test.js[x]\)$') != -1

  if in_test_file
    call SetTestFile(command_suffix)
  elseif !exists("t:jln_test_file")
    return
  end
  call RunTests("t:jln_test_file")
endfunction

function! RunNearesttest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
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
  elseif filereadable("bin/test")
    exec ":!bin/test " . a:filename
  elseif filereadable("bin/rspec")
    exec ":!bin/rspec --color " . a:filename
  elseif filereadable("Gemfile") && strlen(glob("spec/**/*.rb"))
    exec ":!bundle exec rspec --color " . a:filename
  end
endfunction
