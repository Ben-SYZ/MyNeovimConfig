"
"=== Auto load for the first time
"
"Do NOT forget install curl firstly
"coc for python need 'python3 -m pip install --user --upgrade pynvim'
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



let mapleader=" "
"colorscheme peachpuff
"color delek 
"set autoindent
"set cindent
"???"filetype indent on
"let g:instant_markdown_autostart = 0
"Plugin 'suan/vim-instant-Markdown'
set relativenumber nu
"""""""""""""""""""""""""""""""""""""
"Keyboard map
nnoremap : '
nnoremap ' :
"c/C short for ctrl, s/S short for Shift, CR/cr  short for Enter

"
" Direction
" =================
" col
noremap h h
noremap n j
noremap e k
noremap i l
noremap N 5j
noremap E 5k

" line
noremap b b
noremap f e
noremap B 5b
noremap F 5e

" insert
noremap k i
noremap K I

" copy
noremap Y y$

" undo
" noremap l u
" noremap L u

" add
noremap a a
noremap A A

" search
noremap m n
noremap M N


tnoremap <Esc> <C-\><C-n>


"nnoremap <C-h> 0
"nnoremap <C-i> $
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap <leader>R :source $MYVIMRC<CR>
nnoremap <leader>rc :e ~/.config/nvim/init.vim<CR>
nnoremap <LEADER>i3 :e ~/.config/i3/config<CR>
" Indentation
nnoremap < <<
nnoremap > >>
"nnoremap <LEADER>mrc :e ~/.config/nvim/markdown.vim<CR>
"no opperation
"map s <nop>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sn :set splitbelow<CR>:split<CR>
nnoremap se :set nosplitright<CR>:split<CR>
nnoremap si :set splitright<CR>:vsplit<CR>

"edit a new file
":e a.py 

"exchange split window
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>n <C-w>j
nnoremap <LEADER>e <C-w>k
nnoremap <LEADER>i <C-w>l
"resize the split window
nnoremap <up> :res -5<CR>
nnoremap <down> :res +5<CR>
nnoremap <left> :vertical resize +5<CR>
nnoremap <right> :vertical resize -5<CR>
"change the vertical split to horizontal, vise versa
nnoremap sv <C-w>t<C-w>H
nnoremap sh <C-w>t<C-w>K
"在shell里打开几个文件并且分屏:
" vim -O file1 file2 ...
" vim -o file1 file2 ...
" O: vertical
" o: horizontal(default)
"new tab
nnoremap tk :tabe<CR>
"exchange in tab
nnoremap th :-tabnext<CR>
nnoremap ti :tabnext<CR>
"vim a b c change between buffers
nnoremap <LEADER>bh :bp<CR>
nnoremap <LEADER>bi :bn<CR>


"highlight
"syntax off
"default on
set cursorline
"change lines automatially to make all the content can show in the window.
set wrap
"default on??

"show what you type at the bottom left
set showcmd

"in normal mode using tab can help you show the connecting words.
set wildmenu

"high light search
set hlsearch
"exec the following cmd, default on seems
exec "nohlsearch"
"high light when you typing word
set incsearch
"at 1 line leader=" " no highlight
noremap <LEADER><CR> :nohlsearch<CR>

"ignore the case
set ignorecase
"if your searching contents the lower and higher case, care the case
set smartcase

"avoid the uncompatibel between vim and vi
set nocompatible
"most plugin need the following 4 lines, let vim know the filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"you can use mouse in vim
"set mouse=a
set encoding=utf-8
"some terminal cannot show the color not correctly
"????????????????
"let &t ut=''
"???????????????????????
""expandtab
"set expandtab
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2

"show the blank at the end of the line??
set list 
set listchars=tab:▸\ ,trail:▫
set scrolloff=10
"indentation(缩进) behavior
set tw=0
set indentexpr=
"backspace can del the <CR>
set backspace=indent,eol,start
"make the code can be folded
"set foldmethod=indent
"zc      折叠
"zC     对所在范围内所有嵌套的折叠点进行折叠
"zo      展开折叠
"zO     对所在范围内所有嵌套的折叠点展开
"change the cursor at different mode
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"status bar 2 line
set laststatus=2
"vim exec *** , exec at the dir where the file is
set autochdir
"let the cursor be at the position where you exit
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" Compile function
nnoremap <LEADER>r :call CompileRunGcc()<CR>
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
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc




call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim'


"Markdown
"-----
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'

"Undo tree
"-----
Plug 'mbbill/undotree'

"coc
"-----
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"youcompleteme
"-------
"Plug 'Valloric/YouCompleteMe'
" cd ~/.config/nvim/plugged/YouCompleteMe
" ./install.py --clang-completer


"surround.vim
"-------
Plug 'tpope/vim-surround'
" iw  is a text object, in word
" ds{, delete surround {
" cs'", change surround '"
"  Old text                  Command           New text ~
"  hello                   ysWfprint<cr>     print("hello")
"
Plug 'junegunn/vim-easy-align'
" ga
" v ip ga 

" Jupyter Interactive
"-----
" Make Vim talk to Jupyter kernels
Plug 'jupyter-vim/jupyter-vim'
" Plug 'hisaknown/jupyterkernel.vim' "need fix!!!
" need jupyter_kernel_gateway

" jupytext
"------
Plug 'goerz/jupytext.vim'
" edit ipynb as markdown, need 'jpytertext' or 'notedown'.
" Both are convert 'ipynb' to 'markdown'
" old version: ipynb_notedown

" " vimpyter
" "------
" Plug 'szymonmaszke/vimpyter'
" "need 'notedown'
" edit ipynb as markdown, need 'jpytertext' or 'notedown'


" ultisnips
"-----
Plug 'SirVer/ultisnips'

" brackets
"-----
Plug 'jiangmiao/auto-pairs'

" fcitx
"-----
Plug 'vim-scripts/fcitx.vim'

" " nerd tree
" " -----
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

"Plug 'vim-scripts/mru.vim'

"Plug 'lvht/mru'
call plug#end()



let g:SnazzyTransparent = 1
colorscheme snazzy


"==
"==  Markdown
"==============

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
	\ 'mkit': {},
	\ 'katex': {},
	\ 'uml': {},
	\ 'maid': {},
	\ 'disable_sync_scroll': 0,
	\ 'sync_scroll_type': 'middle',
	\ 'hide_yaml_meta': 1,
	\ 'sequence_diagrams': {}
	\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


nnoremap <LEADER>mp :MarkdownPreview<CR>

"===
"===  vimwiki
"====================
" let g:vimwiki_list = [{
" 	\'path': '~/vimwiki/', 
" 	\ 'syntax': 'markdown', 
" 	\'ext': '.wiki'
" 	\}]

"===
"===  vim-table-mode
"====================

nnoremap <LEADER>tm :TableModeToggle<CR>

"==
"==  undotree
"==============
nnoremap U :UndotreeToggle<CR>

"==
"==  coc
"==============
let g:coc_global_extensions = ['coc-json', 'coc-python',  'coc-html', 'coc-yank', 'coc-lists', 'coc-gitignore' ]
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" " Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"default on
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> tn <Plug>(coc-diagnostic-next)
nmap <silent> tN <Plug>(coc-diagnostic-prev)
" used in def blah blah
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rk <Plug>(coc-rename)
" make error texts have a red color
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
" highlight in markdown
let g:markdown_fenced_languages = ['css', 'js=javascript', 'python']
" clipboard
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" To get correct comment highlighting in jsonc whose extension is json
autocmd FileType json syntax match Comment +\/\/.\+$+

"==============

"" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"inoremap <silent><expr> <Tab>
"	\ pumvisible() ? "\<C-n>" :
"	\ <SID>check_back_space() ? "\<Tab>" :
"	\ coc#refresh()
"" use <c-space>for trigger completion
"inoremap <silent><expr> <c-space> coc#refresh()
"nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"==
"==  vim easy align
"==============
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"try these commands:
"    vipga=
"        visual-select inner paragraph
"        Start EasyAlign command (ga)
"        Align around =
"    gaip=
"        Start EasyAlign command (ga) for inner paragraph
"        Align around =
"

"==
"==  jupyter-vim
"==============
nnoremap <LEADER>jc :JupyterConnect<CR>
vmap <LEADER>jr <Plug>JupyterRunVisual
nnoremap <LEADER>jr :JupyterRunFile<CR>
nmap " V <Plug>JupyterRunVisual

" ===
" === jupytext
" ================
" edit ipynb as markdown
let g:jupytext_enable = 1
let g:jupytext_fmt = 'md'
"jupytext --to=ipynb --from=md --update --output notebook.ipynb notebook.md

"" ===
"" === vimpyter
"" ==========
"autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
"autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
"autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
"let g:vimpyter_color=1



"==
"==  Ultisnips
"==============
let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-e>"

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']

" " ===
" " === Nerdtree
" " ==========
" map <C-t> :NERDTreeToggle<CR>
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }



"==
"==  system
"==============
set clipboard+=unnamedplus " clipboard for system
"let g:clipboard = {
"  \   'name': 'myClipboard',
"  \   'copy': {
"  \      '+': 'tmux load-buffer -',
"  \      '*': 'tmux load-buffer -',
"  \    },
"  \   'paste': {
"  \      '+': 'tmux save-buffer -',
"  \      '*': 'tmux save-buffer -',
"  \   },
"  \   'cache_enabled': 1,
"  \ }

" gx open link in browser

"<operation>_<motion>

"c motion change
"cw delete from current word to the end
"ciw change in world when you at the middle of the word delete the wordi"
"ci" change in "
"you can also use di yi, all these means 'in'

"f motion find the word
" df: delete to (find :) 
"also for c y






"some tricks
"zz let the current line move to the middle line

"get all the file names in tmp vim file
"ranger v :bulkrename

"row visual
"<shift>+v

"after v-LINE insert *** vim will do *** like in normal for every line (position can also be done by hjkl etc. 
":normal *** 
"eg *** i ---hello---

"block visual
"<ctrl> v
"in block mode, do the motion (i,j) at the select words
"<shift> i or c etc




source ~/.config/nvim/markdown.vim
