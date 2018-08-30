execute pathogen#infect()
" Store pathogen itself in bundle/
runtime! bundle/pathogen/autoload/pathogen.vim

" Start it up
silent! call pathogen#infect()
silent! call pathogen#helptags()
syntax on 
filetype plugin indent on
set path+=**
set wildmenu

:imap jj <Esc>

let g:jsx_ext_required = 0
let g:closetag_filenames = '*.ejs,*.php,*.html,*.js,*.jsx'
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set backspace=2
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set termguicolors

colorscheme cobalt2

:map { :bprevious
:map } :bnext
:noremap [ {
:noremap ] }
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
au BufNewFile,BufRead *.php set filetype=php

let g:UltiSnipsExpandTrigger = "<leader>e"
let g:ycm_path_to_python_interpreter='/usr/bin/python'

if has('python3')
	silent! python3 1
endif

let g:UltiSnipsSnippetDirectories=["UltiSnips", "ayden-snippets"]
set completeopt-=preview
