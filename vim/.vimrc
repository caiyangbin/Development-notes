" =============================================================================
" vim-plug插件管理
" =============================================================================
call plug#begin('~/.vim/plugged')
" 主题配色
Plug 'connorholyday/vim-snazzy'
" 底部状态栏
Plug 'vim-airline/vim-airline'
" 自动补全插件YCM
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',
"           \ 'for': ['s', 'S', 'c', 'h', 'C', 'cpp', 'cc', 'cxx', 'py', 'go', 'java', 'js', 'php', 'sh', 'conf', 'vimrc', 'bashrc', 'config', 'ini', 'mk', 'makefile', 'Makefile'] }
call plug#end()

" =============================================================================
" 基本设置
" =============================================================================
" 开启文件类型检查,根据不同的文件类型加载不同的插件采用不同的缩进
filetype plugin indent on
syntax on               " 打开语法高亮
"set t_Co=256            " 启用256色
set nocompatible        " 不与vi兼容(采用vim自己的操作命令) 
set background=dark     " 设置背景色
set cursorline          " 高亮光标所在行
" 高亮行颜色
highlight CursorLine cterm=Bold ctermbg=Black ctermfg=NONE guibg=Black guifg=NONE
set number              " 显示行号
set laststatus=2        " 是否显示状态栏(0,1,2)
set ruler               " 在状态栏显示当前光标坐标
set showmode            " 底行显示当前处于哪种模式
set showcmd             " 命令模式下,在底行显示键入的指令
set mouse=v             " 鼠标模式(n,v,i,c,h,a,r,A)
set scrolloff=7         " 垂直滚动时光标距离顶部/底部的行数
set sidescrolloff=7     " 水平滚动时光标距离边缘的字符数
set showmatch           " 光标遇到括号时自动高亮对应的另一个括号
"set nobackup            " 不创建备份文件
"set noerrorbells        " 出错时不要发出声音
"set visualbell          " 出错时发出视觉提示(通常时屏幕闪烁)
set history=1024        " 记录历史操作的数量
set autoread            " 打开文件监视,如果在编辑中的文件被外部修改则提示
set autowrite           " 跳转时自动保存
" 文件换行符检测列表
set fileformats=unix,dos,mac
set foldenable          " 默认折叠
set foldmethod=marker   " 折叠方式
set guioptions-=T       " gvim不包含工具栏
set guioptions-=m       " gvim不使用菜单栏
set guioptions-=r       " gvim不显示右边滚动条
set guioptions-=l       " gvim不显示左边滚动条
set helpheight=10       " 帮助窗口的最小高度
set helplang=cn,en      " 帮助手册语言
set hidden              " 允许在有未保存的修改时切换缓冲区
set nowrap              " 不自动折行
set helplang=cn         " 中文帮助优先
"自动向上递归查找tags文件
set tags=./tags;
" 设置主题配色
colorscheme snazzy
"colorscheme janah
"colorscheme jellybeans
"colorscheme molokai
"colorscheme railscasts
"colorscheme vividchalk
"colorscheme onedark
"colorscheme desert
"colorscheme torte
"colorscheme ron

" =============================================================================
" 编码相关
" =============================================================================
" 设置终端显示编码
set termencoding=utf-8
" 设置vim内部编码
set encoding=utf-8 
" 菜单显示编码
set langmenu=zh_CN.UTF-8
" 设置可识别文件编码列表
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936,utf-16,big5,latin1   

" =============================================================================
" 编辑相关
" =============================================================================
set tabstop=4           " 制表符宽度(Tab空格数)
set softtabstop=4       " 软制表符宽度(按Tab键和Backspace键时光标跳转的空格数)
set shiftwidth=4        " 缩进宽度(空格数)
set expandtab           " 制表符替换为空格
set autoindent          " 自动缩进
set cindent             " 特别针对C语言的自动缩进
set cinoptions=:0       " 自动缩进方案
set smartindent         " 插入新行时自动缩进
" 启用退格键删除功能
set backspace=indent,eol,start
set whichwrap=h,l       "使用指定的左右移动光标键可以移到前一行和后一行
" 自动补全模式
set complete=.,w,b,u,t,i,d
" 自动补全选项
set completeopt=longest,menuone
set pumheight=10        " 自动补全菜单显示的最多项目数
" 文件和目录名补全忽略的文件
set wildignore=*.bak,*.o,*.e,*~
set wildmenu            " 命令模式下,按Tab键补全命令
" 命令补全模式
set wildmode=longest:list,full
set hlsearch            " 查找时高亮显示匹配结果
exec "nohlsearch"
set incsearch           " 查找输入时,每输入一个字符,自动跳转到第一个匹配结果
set ignorecase          " 查找时忽略大小写
set smartcase           " 针对只有首字母时大写的查找词不忽略大小写

" =============================================================================
" 自动命令
" =============================================================================
" 打开文件光标自动跳转到上次关闭时的位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" =============================================================================
" 改建区
" =============================================================================
" Leader键设置
let mapleader=' '
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :
noremap j k
noremap k j
noremap K 5j
noremap J 5k
noremap <LEADER><CR> :nohlsearch<CR>
noremap H 0
noremap L $
" 分屏
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>
" 分屏切换
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>j <C-w>k
map <LEADER>k <C-w>j
" 分屏大小调节
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" 恢复撤销
map U <C-r>
" F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc
