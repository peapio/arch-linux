---
title: '我的neovim的配置🐟'
date: 2020-09-06 11:47:27
tags: [vim,linux,工具]
published: true
hideInList: false
feature: /post-images/wo-de-neovim-de-pei-zhi.png
isTop: false
---
![](https://peapio.github.io/post-images/1599368573964.png)
        断断续续使用vim已经一年多的时间,期间也折腾过不少次配置文件,现在使用的vim已经和当时完全不同了,所以想通过博客记录一下,如果以后有人能看到这篇博客,希望能对你有一点点帮助.
        对我而言,使用vim写的最多的就是c++算法题了,所以这份配置主要安装的都是c++有关的插件(其实也没有多少),不过就算改成其他的语言编辑器也很方便.
        这份配置参考了许多别人的vim配置,包括 spacevim thinkvim, vimplus,我只挑选了它们其中一些我认为非常使用的插件和配置,最终构成了这份我用起来很顺手的neovim,
        我认为对vim本身的配置基本大同小异,最主要的还是插件,使用的插件会大大提升编辑效率,所以这篇文章我会主要推荐一些插件.
        ## 插件管理器 vim-plug
简洁使用(据说) ,不过确实安装插件非常方便,只要使用格式
```vimscript
call plug#begin('~/.config/nvim/vim/plugged')
Plug '你想要安装的插件'    
call plug#end()
```
并且可以懒加载,
```
Plug 'voldikss/vim-floaterm',        { 'on': 'FloatermNew' }         "在指定命令下才加载文件
Plug 'vim-scripts/fcitx.vim',      {'for': ['markdown','cpp','vim','sh']}    "在指定文件格式下加载文件
```
```
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
Plug 'octol/vim-cpp-enhanced-highlight',{'for':'cpp'} " c++高亮
Plug 'Yggdroot/indentLine'                            " 缩进可视化
Plug 'ryanoasis/vim-devicons'                         " 给各种插件增加文件图标
Plug 'chrisbra/changesPlugin'                         " 文件修改提示
Plug 'itchyny/vim-cursorword'                         " 光标在单词上会有一个下划线
Plug 'kristijanhusak/defx-icons'
"功能插件 :使用更顺畅
Plug 'gcmt/wildfire.vim'                                                                  " 智能选中enter
Plug 'suan/vim-instant-markdown',  {'for': 'markdown'}                                    " markdown预览
Plug 'dhruvasagar/vim-table-mode', {'on':'TableModeToggle'}                               " 更规范的表格
Plug 'kshenoy/vim-signature'                                                              " 书签跳转，ma
Plug 'junegunn/vim-easy-align'                                                            " 快速对齐 ,a2<space>第二个空格对齐，,a-<space>倒数，,a*<space>所有，,a<Enter>*<space>右对齐
Plug 'easymotion/vim-easymotion',  {'on':['<Plug>(easymotion-w)','<Plug>(easymotion-b)']} " 快速移动
Plug 'terryma/vim-smooth-scroll'                                                          " 平滑翻页
Plug 'rhysd/clever-f.vim'                                                                 " 智能F，搜索高亮，f跳转
Plug 'rhysd/accelerated-jk'                                                               " 加速jk键
Plug 'tpope/vim-repeat'                                                                   " 增强．功能，可以重复surround
Plug 'junegunn/vim-slash'                                                                 " 搜索后移动取消高亮
Plug 'itchyny/screensaver.vim',    {'on': 'ScreenSaver'}                                  " 屏幕保护程序
Plug 'jiangmiao/auto-pairs'                                                               " 自动补全括号
Plug 'tpope/vim-commentary'                                                               " 注释插件
Plug 'tpope/vim-surround'                                                                 " yss"加＂号，csw'" ＇修改成＂　ds'删除＇
Plug 'vim-scripts/fcitx.vim',      {'for': ['markdown','cpp','vim','sh']}                 " 切换中文不影响普通模式输入
" 功能插件:
Plug 'dense-analysis/ale'                                                                                    " 错误提示
Plug 'neoclide/coc.nvim',            {'branch': 'release'}                                                   " 自动补全
Plug 'honza/vim-snippets'                                                                                    " 代码片
Plug 'yianwillis/vimcdoc'                                                                                    " vim中文手册
Plug 'mbbill/undotree',              {'on':'UndotreeToggle'}                                                 " 撤销树（代码回滚）
Plug 'junegunn/fzf',                 {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }                   " fzf模糊查找文件
Plug 'junegunn/fzf.vim',             {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}
Plug 'sbdchd/neoformat',             {'on':'Neoformat'}                                                      " 格式化文件(我还没用过)leader>nf
Plug 'voldikss/vim-floaterm',        { 'on': 'FloatermNew' }                                                 " 浮动终端
Plug 'liuchengxu/vista.vim',         {'on':'Vista'}                                                          " 查看函数什么的
Plug 'kristijanhusak/defx-git',      {'on':'Defx'}                                                           " 查看文件树
Plug 'Shougo/defx.nvim',             { 'do': ':UpdateRemotePlugins'}
Plug 'tyru/open-browser.vim',        {'on':['<Plug>(openbrowser-smart-search)', '<Plug>(openbrowser-open)']} " gx google搜索, gu打开连接
Plug 'mg979/vim-visual-multi',       {'branch': 'master'}                                                    " <c-n> 多鼠标操作
Plug 'voldikss/vim-translator',      { 'on':'<Plug>Translate' }                                              " 划词翻译 leader>tl
Plug 'junegunn/goyo.vim',            {'on':'Goyo'}                                                           " 专注模式gy开启
Plug 'tweekmonster/startuptime.vim', {'on': 'StartupTime'}                                                   " 查看启动所需时间
" 可选
"Plug 'sheerun/vim-polyglot',{'for':['c', 'h', 'cpp', 'py', 'go', 'java', 'vim', 'json', 'hs']}
"Plug 'vim-scripts/vim-auto-save'
"Plug 'kien/rainbow_parentheses.vim'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 文件搜索
"Plug 'wakatime/vim-wakatime'                      " 统计代码时间
"Plug 'SirVer/ultisnips'
"Plug 'rhysd/github-complete.vim'
"Plug 'simnalamburt/vim-mundo'                     "  撤销树可视化


call plug#end()

```

