set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'guangbin79/vim-sensible'
Plugin 'laishulu/vim-macos-ime'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wincent/terminus'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'myusuf3/numbers.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'luochen1990/rainbow'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'chrisbra/matchit'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-expand-region'
Plugin 'junegunn/fzf.vim'
Plugin 'guangbin79/vim-bookmarks'
Plugin 't9md/vim-choosewin'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'skwp/greplace.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'Shougo/echodoc.vim'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" leader key
let mapleader=" "

" vim-macos-ime
let g:macosime_macism_path=expand('<sfile>:p:h') . '/.vim/bundle/vim-macos-ime/macism'
let g:macosime_normal_ime='com.apple.keylayout.ABC'
let g:macosime_cjk_ime='com.apple.inputmethod.SCIM.ITABC'

" colors
syntax enable
colorscheme solarized
set background=dark

" rainbow
let g:rainbow_active=1

" vim-easymotion
" nmap <leader><leader> <plug>(easymotion)
nmap ; <plug>(easymotion-s)

" supertab
let g:SuperTabDefaultCompletionType="<c-n>"

" vim-expand-region
vmap v <plug>(expand_region_expand)
vmap V <plug>(expand_region_shrink)

" fzf.vim
set rtp+=/usr/local/opt/fzf
nnoremap <leader>/ :Ag<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>l :Lines<cr>

" vim-bookmarks
let g:bookmark_save_per_working_dir=1
let g:bookmark_prefer_fzf=1
let g:bookmark_fzf_preview=1
let g:bookmark_no_default_key_mappings=1
nmap <leader><leader>m <plug>BookmarkToggle
nmap <leader><leader>i <plug>BookmarkAnnotate
nmap <leader>m <plug>BookmarkShowAll

" vim-choosewin
nmap ` <plug>(choosewin)

" nerdtree && nerdtree-tabs
nmap <leader>n <plug>NERDTreeTabsToggle<cr>

" tagbar
nmap <leader>t :let g:gutentags_enabled=!g:gutentags_enabled<cr> :TagbarToggle<cr>

" nerdcommenter
let g:NERDCreateDefaultMappings=0
nmap \\ <plug>NERDCommenterToggle
vmap \\ <plug>NERDCommenterToggle

" greplace.vim
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" vim-gitgutter
let g:gitgutter_map_keys=0

" vim-gutentags
let g:gutentags_enabled=0
