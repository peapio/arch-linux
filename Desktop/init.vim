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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 隐藏GVIM菜单及设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim    "  窗口大小
set lines=35 columns=140       "  分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright                 "  不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b              "  使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist

set nu
set relativenumber
set showtabline=1              "  show顶部标签栏
syntax enable                  "  开启语法高亮
set showmatch                  "  显示匹配的括号"
set mouse=a                    "  启用鼠标"
set hlsearch                   "  高亮搜索项"
exec "nohlsearch"
set smartcase
syntax on                      "  语法高亮
set t_Co=256                   "  支持256色"
set nowrap                     "  默认不换行"
set laststatus=2               "  状态栏显示在底部倒数第二行"
set incsearch                  "  输入搜索内容就显示搜索结果"
set scrolloff=5                "  距离顶部和底部5行，将光标垂直居中放在屏幕上，当滚动或搜索大文件时"
set whichwrap+=<,>,h,l         "  左键右键自动换行"
set cursorline                 "  凸显当前行"
"set cursorcolumn              "  凸显当前列
set autoindent                 "  沿用上一行缩进"
"set smartindent               "  智能缩进
set cindent                    "  可以设置不同缩进风格"
set fileencodings=gbk,utf-8,ucs-bom,gb18030,gb2312,cp936
set encoding=UTF-8
" colorscheme gruvbox
set background=dark
autocmd vimenter * colorscheme gruvbox
let g:SnazzyTransparent = 1
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ }
set clipboard=unnamed
set clipboard=unnamedplus
set wildmenu                   "  开启命令行补全
set showmatch                  "  显示括号配对情况
set softtabstop=4              "  设置按BackSpace的时候可以一次删除掉4个空格
set tabstop=4                  "  设定 tab 长度为 4
set shiftwidth=4
set expandtab
set cindent
set backspace=indent,eol,start "  让退格键和 Delete 键支持删除回车符
set ruler                      "  显示光标的坐标
set list
set listchars=tab:▸-,trail:- 
set encoding=utf-8  
set termencoding=utf-8   
set fileencoding=chinese 
set fileencodings=ucs-bom,utf-8,chinese   
set langmenu=zh_CN.utf-8  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim
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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键的设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " " 
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
noremap n nzz
noremap N Nzz
noremap H 0
noremap L $
noremap <leader>q :bd<CR>
noremap <leader>Q :q!<CR>
noremap <leader>x :q<CR>
noremap <c-k> <c-u>
noremap <c-j> <c-d>
nnoremap <Leader>d :packadd termdebug<CR><ESC>:Termdebug %< <CR><ESC><c-w>w<c-w>H<c-w>w<c-w>w
noremap <leader>o ggVG
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_acceleration_table = [2, 4, 7, 10]
nnoremap <Leader>d :e $MYVIMRC<CR>
noremap <silent> <c-k> :call smooth_scroll#up(&scroll, 40, 4)<CR>
noremap <silent> <c-j> :call smooth_scroll#down(&scroll, 40, 4)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*20, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*20, 0, 4)<CR>
map zl :set splitright<CR>:vsplit<CR>
map zh :set nosplitright<CR>:vsplit<CR>
map zj :set nosplitbelow<CR>:split<CR>
map zk :set splitbelow<CR>:split<CR>
map t= :Tabularize /=<CR>

map <leader>l :call RemSpace()<CR>
func! RemSpace()
    exec "g/^\s*$/d"
    exec "nohl"
endfunc

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




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件安装
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/vim/plugged')
"美化插件
Plug 'hardcoreplayers/spaceline.vim'
Plug 'hardcoreplayers/vim-buffet'
Plug 'luochen1990/rainbow'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'hardcoreplayers/oceanic-material'
Plug 'mhartington/oceanic-next'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight',{'for':'cpp'}          " c++高亮
Plug 'Yggdroot/indentLine'                        " 缩进可视化
Plug 'ryanoasis/vim-devicons'                     " 给各种插件增加文件图标
Plug 'chrisbra/changesPlugin' "文件修改提示
"功能插件
Plug 'junegunn/goyo.vim',{'on':'Goyo'}                          " 专注模式gy开启
Plug 'gcmt/wildfire.vim'                          " 智能选中
Plug 'tweekmonster/startuptime.vim',{'on': 'StartupTime'}
Plug 'suan/vim-instant-markdown',{'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode',{'on':'TableModeToggle'}               " 更规范的表格
Plug 'kshenoy/vim-signature'                      " 书签跳转，ma
Plug 'junegunn/vim-easy-align'                    " 快速对齐 ,a2<space>第二个空格对齐，,a-<space>倒数，,a*<space>所有，,a<Enter>*<space>右对齐
Plug 'easymotion/vim-easymotion',{'on':['<Plug>(easymotion-w)','<Plug>(easymotion-b)']}                  " 快速移动
Plug 'terryma/vim-smooth-scroll'                  " 平滑翻页
Plug 'rhysd/clever-f.vim'                         " 智能F，搜索高亮，f跳转
Plug 'tpope/vim-repeat'                           " 增强．功能，可以重复surround
Plug 'junegunn/vim-slash'                         " 搜索后移动取消高亮
Plug 'itchyny/screensaver.vim',{'on': 'ScreenSaver'}
Plug 'jiangmiao/auto-pairs'                       " 自动补全括号
Plug 'tpope/vim-commentary'                       " 注释插件
Plug 'tpope/vim-surround'                         "yss"加＂号，csw'" ＇修改成＂　ds'删除＇
Plug 'dense-analysis/ale'                         " 错误提示
Plug 'rhysd/accelerated-jk'
" Plug 'vim-scripts/vim-auto-save'
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " 自动补全
Plug 'honza/vim-snippets' 
Plug 'yianwillis/vimcdoc'                        " vim中文手册
Plug 'vim-scripts/fcitx.vim',{'for': ['markdown','cpp','vim','sh']}                      " 切换中文不影响普通模式输入
Plug 'mbbill/undotree',{'on':'UndotreeToggle'}                            " 撤销树（代码回滚）
Plug 'itchyny/vim-cursorword'                     " 光标在单词上会有一个下划线
Plug 'junegunn/fzf', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }
Plug 'junegunn/fzf.vim', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}
Plug 'sbdchd/neoformat', {'on':'Neoformat'}
Plug 'voldikss/vim-floaterm', { 'on': 'FloatermNew' }
Plug 'liuchengxu/vista.vim', {'on':'Vista'}
Plug 'kristijanhusak/defx-git', {'on':'Defx'}
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-icons'
Plug 'tyru/open-browser.vim', {'on':['<Plug>(openbrowser-smart-search)', '<Plug>(openbrowser-open)']}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'voldikss/vim-translator', { 'on':'<Plug>Translate' }

"Plug 'sheerun/vim-polyglot',{'for':['c', 'h', 'cpp', 'py', 'go', 'java', 'vim', 'json', 'hs']}
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 文件搜索
"Plug 'wakatime/vim-wakatime'                      " 统计代码时间
"  Plug 'SirVer/ultisnips'
"  Plug 'rhysd/github-complete.vim'
"Plug 'simnalamburt/vim-mundo'                     "  撤销树可视化
"
"
"


call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""goyo专注模式========================================
noremap <LEADER>gy :Goyo<CR>


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
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \}






"indentLine可视化缩进========================================================
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进




"彩虹括号=====================================================================
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


"coc.nvim自动补全============================================================
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"使用tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')



"Leaderf设置============================================================
"文件搜索
"nnoremap <silent> <Leader>f :Leaderf file<CR>
""历史打开过的文件
"nnoremap <silent> <Leader>m :Leaderf mru<CR>
""Buffer
"nnoremap <silent> <Leader>b :Leaderf buffer<CR>
""函数搜索（仅当前文件里）
"nnoremap <silent> <Leader>F :Leaderf function<CR>
""模糊搜索，很强大的功能，迅速秒搜
"nnoremap <silent> <Leader>rg :Leaderf rg<CR>
"" leaderf个性化设置
"let g:Lf_HideHelp = 1
"let g:Lf_UseCache = 0
"let g:Lf_UseVersionControlTool = 0
"let g:Lf_IgnoreCurrentBufferName = 1
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }






"easymotion快速移动===================================================
filetype plugin on
nmap ] <Plug>(easymotion-w)
nmap [ <Plug>(easymotion-b)







"easyalign快速对齐=============================================================
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }






"撤销树=============================================================
nnoremap <Leader>u :UndotreeToggle<cr>
set undodir=~/.undodir/
set undofile




"vim-commentary====================================================
"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s


"auot save 自动保存=================================================
let g:auto_save = 1 
let g:auto_save_in_insert_mode = 0 

"spaceline==========================================================
"
let g:spaceline_seperate_style= 'curve'
let g:spaceline_git_branch_icon= ' '









" vim-buffet设置===================================================


nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
let g:buffet_always_show_tabline = 1
let g:buffet_powerline_separators = 1
let g:buffet_show_index =1
let g:buffet_use_devicons = 1




"Translator设置=============================================================
nmap <Leader>t <Plug>TranslateW
vmap <Leader>t <Plug>TranslateWV
let g:translator_window_max_width=0.3
let g:translator_window_max_height=0.3
let g:translator_default_engines=['youdao' , 'google']





"OpenBrowser设置=============================================================
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nmap gu <Plug>(openbrowser-open)
vmap gu <Plug>(openbrowser-open)










"Vista设置===================================================================
noremap <LEADER>v :Vista<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_disable_statusline = 1
let g:vista_default_executive = 'ctags'
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_executive_for = {
			\ 'vimwiki': 'markdown',
			\ 'pandoc': 'markdown',
			\ 'markdown': 'toc',
			\ 'yaml': 'coc',
			\ 'typescript': 'coc',
			\ 'typescriptreact': 'coc',
			\ }







" Defx设置====================================================================
noremap <LEADER>e :Defx<CR>

call defx#custom#option('_', {
			\ 'resume': 1,
			\ 'winwidth': 30,
			\ 'split': 'vertical',
			\ 'direction': 'topleft',
			\ 'show_ignored_files': 0,
			\ 'columns': 'mark:indent:git:icons:filename',
			\ 'root_marker': '',
			\ })

call defx#custom#column('git', {
			\   'indicators': {
			\     'Modified'  : '•',
			\     'Staged'    : '✚',
			\     'Untracked' : 'ᵁ',
			\     'Renamed'   : '≫',
			\     'Unmerged'  : '≠',
			\     'Ignored'   : 'ⁱ',
			\     'Deleted'   : '✖',
			\     'Unknown'   : '⁇'
			\   }
			\ })

call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })

augroup user_plugin_defx
	autocmd!
	autocmd FileType defx call <SID>defx_mappings()
	autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif
	autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
augroup END

function! s:jump_dirty(dir) abort
	let l:icons = get(g:, 'defx_git_indicators', {})
	let l:icons_pattern = join(values(l:icons), '\|')

	if ! empty(l:icons_pattern)
		let l:direction = a:dir > 0 ? 'w' : 'bw'
		return search(printf('\(%s\)', l:icons_pattern), l:direction)
	endif
endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_mappings() abort
	setlocal signcolumn=no expandtab
	nnoremap <silent><buffer><expr> <CR>     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
	nnoremap <silent><buffer><expr> <C-h>     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
	nnoremap <silent><buffer><expr> c defx#do_action('copy')
	nnoremap <silent><buffer><expr> m defx#do_action('move')
	nnoremap <silent><buffer><expr> p defx#do_action('paste')
	nnoremap <silent><buffer><expr> d defx#do_action('open')
	nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N defx#do_action('new_file')
	nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> x defx#do_action('remove')
	nnoremap <silent><buffer><expr> r defx#do_action('rename')
	nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> l defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> <C-h> defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
	nnoremap <silent><buffer><expr> a defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
	nnoremap <silent><buffer><expr> q defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
	nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
	nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
	nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
	nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
	nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])

endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

let g:defx_icons_column_length = 2
let g:defx_icons_mark_icon = ''
let g:defx_icons_parent_icon = ""



"Vim-table-mode设置===================================================
map <LEADER>tm :TableModeToggle<CR>



"Vim-buffet设置=======================================================
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)



"floaterm设置========================================================
hi Floaterm guibg=black
hi FloatermBorder guibg=none guifg=cyan
let g:floaterm_position = 'center'
let g:floaterm_wintype = 'floating'
noremap <LEADER>ftn :FloatermNew<CR>
noremap <LEADER>ftk :FloatermKill<CR>


"Neoformat设置
nnoremap <LEADER>= :Neoformat<CR>========================================








"FZF模糊搜索设置=======================================================

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nmap <Leader>cn :<C-u>DashboardNewFile<CR>
nnoremap <Leader>m :History<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>c :Colors<CR>
" nnoremap <Leader>fa :Rg<CR>
nnoremap <Leader>b :Marks<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   )

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>A :Ag<CR>








"Dashboard设置
let g:dashboard_custom_header=[
    \'',
    \' ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ',
    \' ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ',
    \' ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ',
    \' ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ',
    \' ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ',
    \' ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ',
    \' ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ',
    \' ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ',
    \' ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ',
    \' ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
    \' ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ',
    \' ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ',
    \' ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ',
    \' ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ',
    \'',
    \]
let g:dashboard_default_executive ='fzf'
" let g:dashboard_custom_shortcut={
"       \ 'last_session'       : 'Ctrl X',
"       \ 'find_history'       : 'Ctrl H',
"       \ 'find_file'          : 'Ctrl P',
"       \ 'new_file'           : 'Ctrl E',
"       \ 'change_colorscheme' : 'Ctrl T',
"       \ 'find_word'          : 'Ctrl F',
"       \ 'book_marks'         : 'Ctrl M',
"       \ }
let g:dashboard_custom_shortcut={
			\ 'last_session'       : 'SPC s l',
			\ 'find_history'       : 'SPC m',
			\ 'find_file'          : 'SPC f',
			\ 'new_file'           : 'SPC n',
			\ 'change_colorscheme' : 'SPC c',
			\ 'fnd_word'          : 'SPC f a',
			\ 'book_marks'         : 'SPC b',
			\ }
noremap <LEADER>n :DashboardNewFile<CR>
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
let g:indentLine_fileTypeExclude = ['dashboard']







