" 基础配置
syntax on
set encoding=utf-8
set nu
set ruler

" 自动缩进和Tabs设置
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set ai!
set smartindent

" 基于缩进进行代码折叠
set foldmethod=manual
" 启动 Vim 时关闭折叠
set nofoldenable

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 符号自动匹配
set showmatch

" 搜索自动匹配
set incsearch


filetype plugin on

"F5运行python3
map <F5> :call RunPython()<CR>
func! RunPython()
    exec "W"
    if &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

map <C-r> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "cd %:p:h"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc




" shell、python头文件

autocmd BufNewFile *.py,*.sh exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
        let filetype_name = strpart(expand("%"), stridx(expand("%"), "."))
        if filetype_name == '.sh'
                call setline(1,"\#!/bin/bash")
                call append(line("."), "\# File Name: ".expand("%"))
                call append(line(".")+1, "\# Author: xxx")
                call append(line(".")+2, "\# mail: xxx@gmail.com")
                call append(line(".")+3, "\# Created Time: ".strftime("%c"))
                call append(line(".")+4, "")
        elseif filetype_name == '.py'
                call setline(1,"#!/usr/bin/python3")
                call append(line("."), "# -*- coding:utf-8 -*-")
                call append(line(".")+1, "\# File Name: ".expand("%"))
                call append(line(".")+2, "\# Author: xxx")
                call append(line(".")+3, "\# Mail: xxx@gmail.com ")
                call append(line(".")+4, "\# Created Time: ".strftime("%c"))
                call append(line(".")+6,"")
        else
                call setline(1, "/*************************************************************************")
                call append(line("."), " File Name: ".expand("%"))
                call append(line(".")+1, "Author: xxx")
                call append(line(".")+2, " Mail: xxx@gmail.com ")
                call append(line(".")+3, " Created Time: ".strftime("%c"))
                call append(line(".")+5, "")
        endif
                "新建文件后，自动定位到文件末尾
endfunc
    autocmd BufNewFile * normal G


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'airblade/vim-gitgutter'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tell-k/vim-autopep8'
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

Plug 'Raimondi/delimitMate'

Plug 'maralla/completor.vim'
let g:completor_python_binary = '/usr/bin/python3'

Plug 'vim-syntastic/syntastic'

Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()
