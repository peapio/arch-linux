"设置光标不同模式不同形状
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


set nu
set relativenumber
set showtabline=1               ""show顶部标签栏
syntax enable                   "开启语法高亮
set showmatch                   "显示匹配的括号"
set mouse=a                     "启用鼠标"
set hlsearch                    "高亮搜索项"
exec "nohlsearch"
set smartcase
syntax on		"语法高亮"
set t_Co=256  		"支持256色"
set nowrap		"默认不换行"
set laststatus=2		"状态栏显示在底部倒数第二行"
set incsearch		"输入搜索内容就显示搜索结果"
set scrolloff=5		"距离顶部和底部5行，将光标垂直居中放在屏幕上，当滚动或搜索大文件时"
set whichwrap+=<,>,h,l	"左键右键自动换行"
set cursorline		"凸显当前行"
"set cursorcolumn		"凸显当前列"
set autoindent		"沿用上一行缩进"
"set smartindent		"智能缩进"
set cindent		"可以设置不同缩进风格"
set fileencodings=gbk,utf-8,ucs-bom,gb18030,gb2312,cp936
colorscheme snazzy
let g:SnazzyTransparent = 1
let g:lightline = {
            \ 'colorscheme': 'snazzy',
            \ }
set clipboard=unnamed
set clipboard=unnamedplus
set wildmenu 		" 开启命令行补全
set showmatch  		"显示括号配对情况
set softtabstop=4 		" 设置按BackSpace的时候可以一次删除掉4个空格
set tabstop=4 		" 设定 tab 长度为 4
set shiftwidth=4
set expandtab
set cindent
set backspace=indent,eol,start    " 让退格键和 Delete 键支持删除回车符
set ruler			"显示光标的坐标
set list
set listchars=tab:>-,trail:- 
set encoding=utf-8  
set termencoding=utf-8   
set fileencoding=chinese 
set fileencodings=ucs-bom,utf-8,chinese   
set langmenu=zh_CN.utf-8  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim

let delimitMate_expand_cr = 1
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"设置不同模式鼠标的样式，貌似不好使，，
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"设置光标回到上次编辑的位置


set foldenable 		"开启代码折叠功能
"  可组合 {} () <> []使用
"  " zc 关闭当前打开的折叠
"  " zo 打开当前的折叠
"  " zm 关闭所有折叠
"  " zM 关闭所有折叠及其嵌套的折叠
"  " zr 打开所有折叠
"  " zR 打开所有折叠及其嵌套的折叠
"  " zd 删除当前折叠
"  " zE 删除所有折叠
"  " zj 移动至下一个折叠
"  " zk 移动至上一个折叠
"  " zn 禁用折叠
"  " zN 启用折叠
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
noremap n nzz
noremap N Nzz
noremap H 0
noremap L $
noremap Q :q!<CR>
noremap X :wq<CR>
noremap S :w<CR>
nnoremap <Leader>d :packadd termdebug<CR><ESC>:Termdebug %< <CR><ESC><c-w>w<c-w>w<c-w>H
"noremap <Leader>b :Break<CR>
"noremap <Leader>c :Clear<CR>
"noremap <Leader>r :Run<CR>
"noremap <Leader>s :Step<CR>
"noremap <Leader>n :Over<CR>
noremap 0 ggVG



map zl :set splitright<CR>:vsplit<CR>
map zh :set nosplitright<CR>:vsplit<CR>
map zj :set nosplitbelow<CR>:split<CR>
map zk :set splitbelow<CR>:split<CR>
map t= :Tabularize /=<CR>

"C,C++的调试
"map <F5> :call Rungdb()<CR>
"func! Rungdb()
"    exec "w"
"    exec "!g++ % -g -o %<"
"    exec "!gdb ./%<"
"endfunc
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ -g % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ -g % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'py'
        exec "!python %"
        exec "!python %<"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    endif
endfunc


"map <Leader>d :call Rungdb()<CR>
"func! Rungdb()
    "exec "w"
    "if &filetype == 'c'
        "exec "packadd termdebug "
        "exec "Termdebug %< "
        "exec "<c-w>w<c-w>w<c-w>H"
    "elseif &filetype == 'cpp'
        "exec "packadd termdebug "
        "exec "Termdebug %< "
        "exec "<c-w>w<c-w>w<c-w>H"
    "endif
"endfunc
"








"插件安装
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'     "自动补全括号
Plug 'preservim/nerdcommenter'
Plug 'connorholyday/vim-snazzy' "vim配色方案
" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " 专注模式gy开启
"Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' 
Plug 'dense-analysis/ale' 
Plug 'wakatime/vim-wakatime' "统计代码时间
Plug 'neoclide/coc.nvim', {'branch': 'release'} "自动补全
Plug 'Yggdroot/indentLine'   "缩进可视化
Plug 'luochen1990/rainbow'      "彩色括号
Plug 'octol/vim-cpp-enhanced-highlight' "c++高亮
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' 
Plug 'mhinz/vim-startify' "开始界面
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode' 
Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'

call plug#end()


let g:gitgutter_map_keys = 0



"airline插件的设置=====================================
let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"nerdcommenter注释插件设置
let g:NERDDefaultAlign = 'left'
"注释左对齐而不是跟随代码缩进
let g:NERDCompactSexyComs = 1
"多行代码使用紧凑的注释语法
let g:NERDCommentEmptyLines = 1
"允许注释空行

"""goyo专注模式========================================
map gy :Goyo<CR>




"als自动报错===========================================
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
"在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
"let g:ale_lint_on_enter = 0

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <M-s> :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <M-d> :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \}






"indentLine可视化缩进
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进





"彩虹括号
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


"coc.nvim自动补全
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')



""""""""""""""""""""""""""""""
  "Leaderf settings
  """"""""""""""""""""""""""""""
  "文件搜索
  nnoremap <silent> <Leader>f :Leaderf file<CR>
  "
  ""历史打开过的文件
  nnoremap <silent> <Leader>m :Leaderf mru<CR>
  "
  ""Buffer
  nnoremap <silent> <Leader>b :Leaderf buffer<CR>
  "
  ""函数搜索（仅当前文件里）
  nnoremap <silent> <Leader>F :Leaderf function<CR>
  "
  ""模糊搜索，很强大的功能，迅速秒搜
  nnoremap <silent> <Leader>rg :Leaderf rg<CR>

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

"markdown预览

filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_python = 1

" 使用 ss 启用
nmap , <Plug>(easymotion-s2)
