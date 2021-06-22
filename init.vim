""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set nocompatible         " 设置不兼容原始vi模式
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=1          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

" airline
let g:airline_theme="onedark"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"		" 定义<leader>键

" 写入
nnoremap W :w<CR>

" 退出
nnoremap Q :q<CR>

" 分屏窗口移动
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/autoload')

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 目录树
Plug 'preservim/nerdtree'

" airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" wildfire
Plug 'gcmt/wildfire.vim'

" Go
" Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" vim-polyglot
Plug 'sheerun/vim-polyglot'

" vim-visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" undotree
Plug 'mbbill/undotree'

" git
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'

" 括号自动匹配
Plug 'Raimondi/delimitMate'

" bufferline
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-web-devicons'

" terminal
Plug 'skywind3000/asyncrun.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc
" 自动补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" nerdtree
map tt :NERDTreeToggle<CR>           " 开启关闭目录树

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" undotree
nnoremap ud :UndotreeToggle<CR>

let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" bufferline

lua require("bufferline").setup{}

nnoremap <silent><C-l> :BufferLineCycleNext<CR>
nnoremap <silent><C-h> :BufferLineCyclePrev<CR>
nnoremap <silent> bp :BufferLinePick<CR>

" ASyncRun
let g:asyncrun_open=8
