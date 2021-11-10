"================================================
" ProjectLink: https://gitee.com/daotoyi/vimrc.git
" Version: 1.0
" Email: wenhuas.shi@gmail.com
" Modify: 2020/10/22
" Update: 2021/11/06
"=================================================

" General {{{
" =======================================================================
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker	"set fdm=marker
augroup END

autocmd BufWritePost $MYVIMRC source $MYVIMRC


let g:mapleader = ','
set clipboard+=unnamed        " Vim clipboard share with system. 

" syntax
syntax on
set history=2000
filetype plugin indent on

" base
set nocompatible                " don't bother with vi compatibility
set autoread                    " reload files when changed on disk, i.e. via `git checkout`
set autowriteall			        	" wirte all file when jump other tabs.
set shortmess=atI
set magic                       " For regular expressions turn magic on
set title                       " change the terminal's title
set nobackup                    " do not keep a backup file
set novisualbell                " turn off visual bell
set noerrorbells                " don't beep
set visualbell t_vb=            " turn off error beep/flash
set t_vb=
set tm=500

" show location
" set cursorcolumn
set cursorline
set scrolloff=3                 " keep 3 lines when scrolling at top or button

" show
set ruler                       " show the current row and column
set nu   				        " show line numbers/nu or relativenumbser
augroup relative_numbser		" auto show number when Enter Insert,relativenumber when leave Insert 
 autocmd!
 autocmd InsertEnter * :set norelativenumber
 autocmd InsertLeave * :set relativenumber
augroup END

" set nowrap
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis
set cmdheight=1                 " height of cmdline

" search
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

" tab
set expandtab                   " expand tabs to spaces
set smarttab
set shiftround
set noexpandtab					" not space replace tab

" status line
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}		" include file type && decode
set laststatus=2   " Always show the status line - use 2 lines for the status bar(default 1,donnot show )
set encoding=utf-8
set t_Co=256                    " vim colorschem 256
set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color

"}}}

" Formate{{{
" =======================================================================
" indent
set autoindent                  " auto indent
set smartindent                 " smart indent
set cindent                     " c indent
set shiftround
set shiftwidth=4
set softtabstop=4               " insert mode tab and backspace use 4 spaces
set tabstop=4					" width of tabkey

" fold
set foldenable
set foldmethod=indent
set foldlevel=99
let g:FoldMethod = 0

map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
		else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

"}}}

" Lang && Encoding{{{
" =======================================================================

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

if(has("win32") || has("win95") || has("win64") || has("win7") || has("win10"))
  let g:Desk="C:\Users\SWH\Desktop"
  "set langmenu=zh_CN.UTF-8 
  language messages zh_CN.utf-8		" handle prompt messages garbled
endif

" handle menu garbled in win10 system 
if(has("win32") || has("win95") || has("win64") || has("win7") || has("win10"))
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

"}}}

" Others {{{
" =======================================================================
set selection=inclusive
set selectmode=mouse,key
set completeopt=longest,menu
set wildmenu                           " show a navigable menu for tab completion"
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class

" others
set backspace=indent,eol,start  " make that backspace key work the way it should
set whichwrap+=<,>,h,l

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set mouse=a

"}}}

" FileType{{{
" =======================================================================

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd

"below line:MUST in same line;second autocmd maybe earse
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()  
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" auto complete 
autocmd FileType python set omnifunc=pythoncomplete#Complete 
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
autocmd FileType c set omnifunc=ccomplete#Complete 

"}}}

" KeyMapping{{{
" =======================================================================

" direct key
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

" <F1> help
"noremap <F2> :TlistToggle<CR>		" set in taglist plugin
"map <F3> :NERDTreeToggle <CR>		" set in NERDTree plugin

nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F5>            "   when in insert mode, press <F5> to go to paste mode,
                                "     where you can paste mass data that won't be autoindented
au InsertLeave * set nopaste		
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>		" syntax  highlight on/off
nnoremap <F8> :set nu! nu?<CR>
nnoremap <F7> :set list! list?<CR>
nnoremap <F11> :g/^\s*$/d<CR>
map <F10> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'py'
        exec "!python3 %<"
    endif
endfunc

nnoremap ' `
nnoremap ` '
nnoremap ; :

"Keep search pattern at the center of the screen."
"nnoremap <silent> n nzz
"nnoremap <silent> N Nzz
"nnoremap <silent> * *zz
"nnoremap <silent> # #zz
"nnoremap <silent> g* g*zz
"vnoremap < <gv
"vnoremap > >gv

" remove highlight
noremap <silent><leader>/ :nohls<CR>

" buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>


" other
map <C-A> ggVGY			" cogy all
vmap <C-c> "+y			" select mode copy

"}}}

" AutoSetTilte{{{
" =======================================================================
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call AutoSetFileHead()" 
func AutoSetFileHead()  
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: Daoyi") 
		call append(line(".")+2, "# Created Time: ".strftime("%c"))
		call append(line(".")+3, "#########################################################################")
		call append(line(".")+4, "#!/bin/zsh")
		call append(line(".")+5, "") 
	elseif &filetype == 'py'
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: Daoyi") 
		call append(line(".")+2, "# Created Time: ".strftime("%c"))
		call append(line(".")+3, "#########################################################################")
		call append(line(".")+4, "#!/usr/bin/env python")
        call append(line(".")+5, "# encoding: utf-8")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Daoyi") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
    	call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	autocmd BufNewFile * normal G			"after creact new file,auto-locate file end 
""    normal G
""    normal o
""    normal o
endfunc 

"}}}

" GUI {{{
" =======================================================================

" menu,tool bar(hidden
set guioptions-=T             " tool bar show or no;- no 
"set guioptions-=m
"set guioptions-=L            " scrollbar"
"set guioptions-=r
"set guioptions-=b

"set lines=35 columns=140		" windows size
au GUIEnter * simalt ~x         " windows maxizise on start
"set splitbelow
"set splitright
set guioptions+=b               " show horizontal ScrollBar

" set guifont=monaco:h10
" set guifont=monaco:h10:W500:cANSI
" set guifont=Inconsolata-dz_for_Powerline:h10:cANSI
set guifont=Inconsolata_NF:h11:W500:cANSI "font to show statusline ico.

" }}}

" Theme_statusline{{{
" =======================================================================
"set background=dark
" colorscheme desert
colorscheme molokai
"colorscheme Tomorrow-Night

" set mark column color
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" }}}

" PythonVim{{{
" =======================================================================
"set pythondll=/Users/yggdroot/.python2.7.6/lib/libpython2.7.so
"set pythonthreedll='D:\\Program\\Files\\JetBrains\\Anaconda3\\python38.dll'
"set pythonthreedll=python36.dll

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""			Vimrc NoPlugin Config Above; Plugin Config Below
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug {{{
" =======================================================================

call plug#begin('$VIM/vimfiles/bundle/')

""tags.exec "many plugin required catgs
""Plug '/E:/Refinement/Gitee/Vim/winmanager'
""Plug '/E:/Refinement/Gitee/Vim/coc.nvim'
"Plug '/E:/Refinement/Gitee/Vim/vim-fugitive'
"Plug '/E:/Refinement/Gitee/Vim/LeaderF', { 'dir': '$VIM/vimfiles/bundle/Leader', 'do': './install.sh' } 	"required version match python version
"Plug '/E:/Refinement/Gitee/Vim/fzf', { 'dir': '$VIM/vimfiles/bundle/fzf', 'do': './install --all' }
"Plug '/E:/Refinement/Gitee/Vim/fzf.vim'
"Plug '/E:/Refinement/Gitee/Vim/nerdtree-devicons-syntax'
Plug 'https://gitee.com/daotoyi/VimPlugin-devicons'
Plug 'https://gitee.com/daotoyi/VimPlugin-NERD_tree'
Plug 'https://gitee.com/daotoyi/VimPlugin-taglist'
Plug 'https://gitee.com/daotoyi/VimPlugin-minibufexpl'
Plug 'https://gitee.com/daotoyi/VimPlugin-supertab'
Plug 'https://gitee.com/daotoyi/VimPlugin-easymotion'
Plug 'https://gitee.com/daotoyi/VimPlugin-airline'
Plug 'https://gitee.com/daotoyi/VimPlugin-airline-themes'
Plug 'https://gitee.com/daotoyi/VimPlugin-RipGrep'				"rg
Plug 'https://gitee.com/daotoyi/VimPlugin-omnicppcomplete'
Plug 'https://gitee.com/daotoyi/VimPlugin-AutoComplPop'
Plug 'https://gitee.com/daotoyi/VimPlugin-AutoPairs'
Plug 'https://gitee.com/daotoyi/VimPlugin-rainbow_parentheses'
Plug 'https://gitee.com/daotoyi/VimPlugin-gutentags'
Plug 'https://gitee.com/daotoyi/VimPlugin-indentLine'
Plug 'https://gitee.com/daotoyi/VimPlugin-showmarks'
Plug 'https://gitee.com/daotoyi/VimPlugin-ale'
Plug 'https://gitee.com/daotoyi/vimplugin-fcitx'
"Plug 'https://gitee.com/daotoyi/fcitx.vim'
"Plug 'https://gitee.com/daotoyi/VimPlugin-latexSuite'
Plug 'https://gitee.com/daotoyi/VimPlugin-orgmode'
Plug 'https://gitee.com/daotoyi/vimplugin-markdown'
Plug 'https://gitee.com/daotoyi/vimplugin-markdown-preview.nvim'
Plug 'https://gitee.com/daotoyi/vimplugin-nerdcommenter'
Plug 'https://gitee.com/daotoyi/vimplugin-asyncrun'
call plug#end()

"}}}

"""===================== PluginConfig ===================================

" TagList {{{
" =======================================================================
set tags=tags;
set autochdir

if(has("win32") || has("win95") || has("win64") || has("win7") || has("win10"))
"if MySys() == "windows"  
	let Tlist_Ctags_Cmd = 'ctags'
	"let Tlist_Ctags_Cmd="D:/xxx/tags.exe"	”8.3 formate required
else
"elseif MySys() == "linux" 
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
set ignorecase smartcase  

let Tlist_Auto_Open = 1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 30
let Tlist_Show_Menu=1

noremap <F2> :TlistToggle<CR>

"}}}

" Gutentags{{{
" =======================================================================
""" https://www.zhihu.com/question/47691414/answer/373700711
""" https://zhuanlan.zhihu.com/p/36279445

let $GTAGSLABEL = 'native-pygments'
if(has("win32") || has("win95") || has("win64") || has("win7") || has("win10"))
	let $GTAGSCONF = 'D:\Program Files (x86)\Vim\gtags\share\gtags\gtags.conf'
else
	let $GTAGSCONF = '/usr/bin/gtags'
endif

"" if not exist ~/.cache/tags directory, mkdir it
"if !isdirectory(s:vim_tags)
"   silent! call mkdir(s:vim_tags, 'p')
"endif

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'		" name of data-ile

" support tags && gtags.
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags') && executable('gtags')
	let g:gutentags_modules += ['gtags']
endif

" put tags-file to ~/.cache/tags
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" config ctags 
let g:gutentags_ctags_extra_args = ['--fields=+niazS']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"" can't support Exuberant-ctags
" let g:gutentags_ctags_extra_args = [ '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" forbid auto-update
let g:gutentags_auto_add_gtags= 0

" }}}

" Netrw {{{
" =======================================================================
let g:netrw_browse_split = 2	"0: split 1:vsplit 2:new tab 3:pri windows
let g:netrw_liststyle = 3	"4 model, thin/long/wide/tree
let g:netrw_banner = 1		"bannre on top, <l>l r
let g:netrw_winsize = 30	"width 30%
"let g:netrw_sort_by = 'time'
"let g:netrw_sort_direction = 'reverse'

nmap <silent> <leader>fe :Sexplore!<cr>

"}}}

" Nerdcommenter{{{
" =======================================================================
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
            \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
            \ 'less': { 'left': '/**', 'right': '*/' }
        \ }
""}}}

" NERD_tree {{{
" =======================================================================
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1				"view hidden file
let NERDTreeWinSize=30
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeWinPos='right'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\~$','\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
let NERDTreeShowBookmarks=1
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI=1   				 " Start NERDTree in minimal UI mode (No help lines)
let NERDTreeDirArrows=0   				 " Display arrows instead of ascii art in NERDTree
let NERDTreeChDirMode=2 				 " Change current working directory based on root directory in NERDTree

""autocmd vimenter * if !argc()|NERDTree|endif	"auto open nerdtree
map <F3> :NERDTreeToggle <CR>

""}}}

" NerdDevicons {{{
" =======================================================================
"let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
"
"let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:webdevicons_enable_airline_tabline = 1
"let g:webdevicons_enable_airline_statusline = 1
" 
""autocmd vimenter * if !argc()|NERDTree|endif		" Open Nerdtree when there's no file opened"
""autocmd vimenter * NERDTree		    			" Or, auto-open Nerdtree"
"	""Close NERDTree when there's no other windows"
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif      
"	""Customize icons on Nerdtree"
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"let g:NERDTreeIndicatorMapCustom = { 
"        \ "Modified"  : "✹",
"        \ "Staged"    : "✚",
"        \ "Untracked" : "✭",
"        \ "Renamed"   : "➜",
"        \ "Unmerged"  : "═",
"        \ "Deleted"   : "✖",
"        \ "Dirty"     : "✗",
"        \ "Clean"     : "✔︎",
"        \ 'Ignored'   : '☒',
"        \ "Unknown"   : "?"
"    \ }
"
"}}}

" WinManager{{{
" =======================================================================
"" ================== winmanager ========================
"" =========== netrw/NERDTree && taglist ================
"" ======================================================
""let g:winManagerWindowLayout = "FileExplorer|TagList"
"let g:winManagerWindowLayout="NERDTree|TagList"
"
"let g:persistentBehaviour=0
"let g:winManagerWidth = 30
"let g:defaultExplorer = 1
"let g:AutoOpenWinManager = 1
"
"autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary")  | qa | endif
"
"nmap <C-W><C-F> :FirstExplorerWindow<cr>
"nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <leader>wm :WMToggle<cr>
"nmap <silent> <F9>:WMToggle<cr>

"}}}

" MiniBufExplorer{{{
" =======================================================================
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
"autocmd BufWinEnter \[Buf\ List\] setl nonumber

map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>

"}}}

" Airline {{{
" =======================================================================

set backspace=2

let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'		"good molokai;'zenburn','murmur','papercolor' as well


let g:airline#extensions#tabline#enabled = 1			" open tabline
"let g:airline#extensions#tabline#buffer_nr_show = 1

set ambiwidth=double							  		"avoid not show particular symbol

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty='⚡'
  let g:airline_symbols.crypt = '🔒 '
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.spell = '¶'
  let g:airline_symbols.notexists = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

"nmap <tab> :bn<cr> 				"tabKey can change tabs

"}}}

" CompleteCode {{{
" =======================================================================
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 	" show list of function paramter"
let OmniCpp_MayCompleteDot = 1   		" after press .  ;auto-complete"
let OmniCpp_MayCompleteArrow = 1 		" after press -> ;auto-complete"
let OmniCpp_MayCompleteScope = 1 		" after press :: ;auto-complete"
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif		" close complete window auto"
set completeopt=menuone,menu,longest

" ===================== SuperTab =========================
"let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"}}}

" Rainbow_Parentheses{{{
" =======================================================================
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
	
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

"}}}

" easymotion{{{
" =======================================================================
nmap ss <Plug>(easymotion-s2)
"" }}}

" asyncrun {{{
" =======================================================================
" open quickfix window automaicly，height=6
let g:asyncrun_open = 6

" bell notify when task over.
let g:asyncrun_bell = 1

" F10 open/close Quickfix windows
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" }}}

" ale {{{
" =======================================================================
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" }}}

"AutoPairs{{{
" =======================================================================
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
let g:AutoPairs['<']='>'
let b:AutoPairs = g:AutoPairs
let g:AutoPairsShortcutToggle = '<M-p>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCh = 1
let g:AutoPairsMapCR = 1
let g:AutoPairsCenterLine = 1
let g:AutoPairsMapSpace = 1
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 1
"}}}
