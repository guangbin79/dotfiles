" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-obsession'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'myusuf3/numbers.vim'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'wincent/terminus'
Plug 'voldikss/vim-floaterm', { 'on': 'FloatermToggle' }
Plug 't9md/vim-choosewin'
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/readablefold.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.dotfiles/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'guangbin79/vim-bookmarks'
Plug 'preservim/nerdtree', { 'on': [ 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdcommenter', { 'on': '<plug>NERDCommenterToggle' }
Plug 'brooth/far.vim', { 'on': [ 'Far', 'F' ] }
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'chrisbra/vim-diff-enhanced'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/echodoc.vim'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'romainl/vim-qf'
Plug 'guangbin79/vim-sensible'

" Initialize plugin system
call plug#end()

" colors
set termguicolors
colorscheme nord

" rainbow
let g:rainbow_active = 1

" leader key
let mapleader="\<space>"
inoremap jj <esc>
inoremap <c-l> <esc>
vnoremap <c-l> <esc>
lnoremap <c-l> <esc>
cnoremap <c-l> <esc>
vnoremap P "0p

" floaterm
let g:floaterm_autoclose = 2
let g:floaterm_width = 0.618
let g:floaterm_height = 0.618
nnoremap <silent> <leader>t :FloatermToggle<cr>
tnoremap <silent> <leader>t <c-\><c-n>:FloatermToggle<cr>

" vim-choosewin
nmap gw <Plug>(choosewin)

" vim-easymotion
let g:EasyMotion_do_mapping = 0
nmap gc <plug>(easymotion-s)

" vim-matchup
let g:matchup_surround_enabled = 1

" fzf.vim
set rtp +=/usr/local/opt/fzf
nnoremap <silent> <leader>/ :Rg<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>l :Lines<cr>
"maintain consistency with tmux
set splitright
set splitbelow
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'vsplit',
  \ 'ctrl-v': 'split' }

" vim-bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_prefer_fzf = 1
let g:bookmark_fzf_preview = 1
let g:bookmark_no_default_key_mappings = 1
nmap mm <plug>BookmarkToggle
nmap mi <plug>BookmarkAnnotate
nmap mn <plug>BookmarkNext
nmap mp <plug>BookmarkPrev
nmap <leader>m <plug>BookmarkShowAll

" nerdtree
nmap <silent> <leader>n :NERDTreeToggle<cr>
nmap <silent> <leader>N :NERDTreeFind<cr>

" tagbar
nmap <silent> <leader>s :TagbarToggle<cr>

" nerdcommenter
let g:NERDCreateDefaultMappings = 0
nmap <c-_> <plug>NERDCommenterToggle
vmap <c-_> <plug>NERDCommenterToggle<cr>gv

" far.vim
let g:far#enable_undo = 1

" vim-gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
nmap <leader>g :GitGutterToggle<cr>
