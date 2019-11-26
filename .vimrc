" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

"脚本测试
function SetTimeOfDayColor()
let currentHour = strftime("%H")
if	currentHour < 6+0
	let ncolorscheme = "darkblue"
elseif currentHour < 12+0
	let ncolorscheme="morning"
elseif currentHour < 18+0
	let ncolorscheme="shine"
else
	let ncolorscheme="morning"
endif
"结尾引号前加上空格，因为命令与值中间需要有一个空格
execute "colorscheme " . ncolorscheme 
endfunction
call SetTimeOfDayColor()
"脚本测试结束
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" personal configure
set shiftwidth=3 
set autoindent
set nu
set ruler " 右下角显示总行数和百分比
set ts=3 "tab空格数

let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1
let g:mkdp_path_to_chrome="/opt/google/chrome/google-chrome"
let g:mkdp_markdown_css=''
set nocompatible
set backspace=2
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'Yggdroot/LeaderF'
call vundle#end()
" filetype off
filetype plugin indent on
