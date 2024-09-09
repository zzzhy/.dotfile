set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'rudes/vim-java'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Fix Backspace for MacOSX
set backspace=indent,eol,start
"" syntax
syntax on
set number
set nu

" use fzf 命令提示
set rtp+=/usr/local/opt/fzf

" 设置默认进行大小写不敏感查找
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase 

"" encodings configure
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" set noswapfile
set directory=$HOME/.vim/swapfiles//

"" jump to the last position when reopening a file
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" nerdTree
"" 将F2设置为开关NERDTree的快捷键
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"" 修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"" 窗口位置
let g:NERDTreeWinPos='left'
"" 窗口尺寸
let g:NERDTreeSize=36
"" 窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
"" 不显示隐藏文件
let g:NERDTreeHidden=0
"" 打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" 打开vim时自动打开NERDTree
autocmd vimenter * NERDTree
wincmd w
autocmd VimEnter * wincmd w

" 以下为自动同步文件路径
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
 
function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction
nmap <C-n> :call ToggleNerdTree()<CR>
let NERDTreeIgnore = ['.*\.pyc', '.*\.gitignore', '.DS_Store', '__pycache__']

"" YCM
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

"" fzf.vim 
nnoremap <leader>fo :Files<CR>"映射
nnoremap <leader>fif :Rg<CR> "映射
