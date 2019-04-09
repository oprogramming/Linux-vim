set nu
set number
set mouse=a
set selection=exclusive
set selectmode=mouse,key

set tabstop=4
set shiftwidth=4
set autoindent
set paste
syntax on
filetype on
set cindent
set wildignore=*.swp,*.bak,*.pyc,*.class,*.svn,*.git
set cursorcolumn
set cursorline
set autoindent
set smartindent
set completeopt=longest,menu

set autoindent
set confirm
set showmatch
set matchtime=10
set t_Co=256
set mouse=v //以上是vim最基础的设置

map <C-b> :NERDTreeToggle<CR>

let g:SuperTabMappingBackward="<tab>"
let g:SuperTabMappingForward ="c-tab"
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GobleScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std","_GLIBCXX_STD"]
set completeopt=menuone,menu,longest  //以上是安装NERDTree插件后的快捷键设置

" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle()" 
" 在文件开头加入注释 
func SetComment()
	call setline(1,"/*================================================================") 
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
	call append(line(".")+1, "*   ") 
	call append(line(".")+2, "*   文件名称：".expand("%:t")) 
	call append(line(".")+3, "*   创 建 者：Cui Xiaomin")
	call append(line(".")+4, "*   创建日期：".strftime("%Y年%m月%d日")) 
	call append(line(".")+5, "*   描    述：") 
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/") 
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
	call setline(3, "#================================================================") 
	call setline(4, "#   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
	call setline(5, "#   ") 
	call setline(6, "#   文件名称："Input("%:t")) 
	call setline(7, "#   创 建 者：Input")
	call setline(8, "#   创建日期：".strftime("%Y年%m月%d日")) 
	call setline(9, "#   描    述：Input") 
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
	call setline(13, "")
endfunc 
" 定义函数SetTitle，自动插入文件头 
func SetTitle()
	if &filetype == 'make' 
		call setline(1,"") 
		call setline(2,"")
		call SetComment_sh()
 
	elseif &filetype == 'sh' 
		call setline(1,"#!/system/bin/sh") 
		call setline(2,"")
		call SetComment_sh()
		
	else
	     call SetComment()
	     if expand("%:e") == 'hpp' 
		  call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H") 
		  call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H") 
		  call append(line(".")+12, "#ifdef __cplusplus") 
		  call append(line(".")+13, "extern \"C\"") 
		  call append(line(".")+14, "{") 
		  call append(line(".")+15, "#endif") 
		  call append(line(".")+16, "") 
		  call append(line(".")+17, "#ifdef __cplusplus") 
		  call append(line(".")+18, "}") 
		  call append(line(".")+19, "#endif") 
		  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H") 
 
	     elseif expand("%:e") == 'h' 
	  	call append(line(".")+10, "#pragma once") 
	     elseif &filetype == 'c' 
	  	call append(line(".")+10,"#include \"".expand("%:t:r").".h\"") 
	     elseif &filetype == 'cpp' 
	  	call append(line(".")+10, "#include \"".expand("%:t:r").".h\"") 
	     endif
	endif
endfunc
