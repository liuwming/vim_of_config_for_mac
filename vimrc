"***************************vundle插件管理*************************************
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mileszs/ack.vim'
Plugin 'luochen1990/rainbow'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'
Plugin 'posva/vim-vue'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'a.vim'
Plugin 'taglist.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'scrooloose/nerdcommenter'
Plugin 'DoxygenToolkit.vim'
Plugin 'godlygeek/tabular'

call vundle#end()
filetype plugin indent on
"***************************vundle插件管理*************************************

set completeopt=menu
"菜单项高度
set pumheight=10
hi pmenu ctermbg=white
hi pmenu guibg=white


"python设置
autocmd filetype python set expandtab
"java设置
autocmd filetype java setlocal omnifunc=javacomplete#complete

"界面及功能
set nocompatible				"关闭vi兼容模式
set shortmess=ati				"不显示欢迎画面
set guioptions-=m				"隐藏菜单栏
set guioptions-=t				"隐藏工具栏
"set guifont=新宋体:h11			"字体
au  guienter * simalt ~x 		"全屏显示
au  guienter * set t_vb= 		"关闭beep
set visualbell t_vb= 			"关闭visual bell
set autoread					"文件在外部被修改时，自动重新读取
set nobackup					"不生成备份文件
set history=2000				"历史操作的数量
"set t_co=16                   	"16位颜色显示
syntax on						"开启文件类型侦测
syntax enable					"语法高亮
filetype on						"侦测文件类型  
filetype plugin on				"载入文件类型插件

"状态行
set laststatus=2 
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler                                                 "在编辑过程中，在右下角显示光标位置的状态行
 
set ruler

"编辑
set magic						"设置魔术
set showmatch					"显示括号配对情况
set cindent shiftwidth=4		"自动缩进4空格
set shiftwidth=4				"换行时行间交错使用4个空格
set autoindent					"自动缩进，继承前一行的缩进方式
set number						"显示行号
set smartindent					"智能自动缩进
set tabstop=4					"设置tab键的宽度
set expandtab                   "空格替换tab
set backspace=2					"设置退格键可用
set fdm=manual					"设置手工定义折叠
set wildmenu					"增强模式中的命令行自动完成操作
set showcmd						"输入的命令显示
"set cursorline					"突出显示当前行
set ruler
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行

set foldenable					"允许折叠
set foldmethod=manual           "手动折叠

augroup ft_vim
	au!
	au fileType vim set foldmethod=marker
augroup END

"搜索与匹配
set hlsearch					"开启高亮显示结果
set ignorecase					"搜索忽略大小写

"编码方式
set enc=utf-8					"Vim内部使用的编码方式，包括buffer、菜单、消息文本等
" set ffs=unix					"设置文件格式
set fencs=utf-8,chinese			"fenc的顺序列表(chinese是别名，在Unix表示gb2312，Windows表示cp936，GBK的代码页)Vim当前编辑文件的字符编码方式，保存时会设置为该编码；不设置保持文件默认编码
set tenc=utf-8					"Vim所工作的终端的编码方式
if has("win32")
	set ffs=dos						
	set tenc=cp936
	language messages zh_CN.utf-8	"console输出乱码
	set langmenu=zh_CN.utf-8		"中文菜单乱码
	source $VIMRUNTIME/delmenu.vim	"中文菜单乱码
	source $VIMRUNTIME/menu.vim		"中文菜单乱码
endif	

"*******************************插件管理*************************************
let mapleader=","

"Colorschemes
set t_Co=256 " required
colorscheme  Tomorrow-Night-Eighties

"vim-cpp-enhanced-highlight.vim
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
" let g:cpp_no_function_highlight = 1


"vim-vue
autocmd BufEnter * :syntax sync fromstart

"ctags
set hidden						"放在buffer里不保存
set tags=tags
set tags+=~/.vim/ctag/tags
set autochdir
"nnoremap <F5> :!ctags -f ~/.vim/ctag/tags -R /home/lwm/Teld/CSCU_A1 --languages=c++ --langmap=c++:+.cpp+.cc+.h -h +.h --c++-kinds=+plx --fields=+aiKSzms --extra=+q<CR>        
nnoremap <F5> :!ctags -f ~/.vim/ctag/tags -R ~/work/yeelight/* --languages=c++ --langmap=c++:+.cpp+.cc+.h -h +.h --c++-kinds=+plx --fields=+aiKSzms --extra=+q<CR>        
nnoremap <silent> <F2> :Tlist<CR>

"a.vim
nnoremap <silent> <F4> :A<CR>

"Taglist
let Tlist_Show_One_File=1
let Tlist_Sort_Type="name"
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Show_Menu=0
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
"let Tlist_WinWidth=40
nnoremap <leader>t :Tlist<CR>
nnoremap <C-j> <C-]>


"移动分割窗口
nmap <C-h> <C-W>w

"doxygen toolkit 
let g:DoxygenToolkit_briefTag_funcName = "yes"
"let g:DoxygenToolkit_commentType="C"
"let g:DoxygenToolkit_blockHeader="---------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="---------------------------------------------------------------------------"
let g:DoxygenToolkit_fileTag     ="@file     -- "
let g:DoxygenToolkit_dateTag     ="@date     --"
let g:DoxygenToolkit_briefTag_pre="@brief    -- "
let g:DoxygenToolkit_paramTag_pre="@param[ ] -- "
let g:DoxygenToolkit_returnTag   ="@return   -- "
let g:DoxygenToolkit_authorTag   ="@author   -- "
let g:DoxygenToolkit_authorName  ="liuwming  liuwmingw@gmail.com"
let g:DoxygenToolkit_versionTag  ="@version  -- "
let g:DoxygenToolkit_blockTag    ="@name     -- "
let g:DoxygenToolkit_classTag    ="@class    -- "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_compactDoc="yes"    "insert white line


"nerdcommenter设置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"ctrlp快捷键
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
"设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

"tagbar快捷键
"nmap <F2> :TagbarToggle<CR>
"let g:tagbar_width=32
"启动时自动focus
" let g:tagbar_autofocus = 1

 "Tabularize
 nnoremap <leader>= :Tabularize /
 nnoremap <leader>: :Tabularize /:\zs<CR>


"ack.vim快捷键
"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" let g:ackprg = "grep -rn"
" let g:ackprg = "grep --vimgrep --smart-case"
" let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
"map <c-u> :Ack!<space>-i<space>  "忽略大小写
map <c-u> :Ack!<space>

"调用ag进行搜索
"if executable('ag')
"     let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
" endif
"高亮搜索关键词
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
"在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
let g:ack_autoclose = 1
"使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
let g:ack_use_cword_for_empty_search = 1
"部分功能受限，但对于大项目搜索速度较慢时可以尝试开启
"let g:ack_use_dispatch = 1

"vim-easygrep
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2,
let g:EasyGrepCommand = 1  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"

"airline.vim
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
map <c-l> :AirlineToggle<CR>

"rainbow.vim
let g:rainbow_active = 1 " 彩虹括号, 0代表关闭

let g:rainbow_conf = {
			\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
			\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
			\	'operators': '_,_',
			\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\	'separately': {
			\		'*': {},
			\		'tex': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\		},
			\		'lisp': {
			\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
			\		},
			\		'vim': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 
			\'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\		},
			\		'html': {
			\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
			\		},
			\		'css': 0,
			\	}
			\}

"NERDTree快捷键
nmap <F3> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=32
"let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1 
let g:NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cpp', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('h', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('pro', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('pri', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"YouCompleteMe
"set runtimepath+=~/.vim/bundle/YouCompleteMe
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1           "开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 "注释与字符串中的内容也用于补全
"let g:syntastic_ignore_files=[".*/.py$"]
"let g:ycm_complete_in_comments = 1                          "在注释输入中也能补全
"let g:ycm_complete_in_strings = 1                           "在字符串输入中也能补全
"let g:ycm_show_diagnostics_ui = 0                           "禁用语法检查
"let g:ycm_min_num_of_chars_for_completion = 3               "从第2个键入字符就开始罗列匹配项
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif     "离开插入模式后自动关闭预览窗口

"回车即选中当前项
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
"*******************************插件管理*************************************

"上一次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


