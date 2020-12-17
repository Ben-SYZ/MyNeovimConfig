"
"=== Auto load for the first time
"
"Do NOT forget install curl firstly
"coc for python need 'python3 -m pip install --user --upgrade pynvim'
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	if empty(glob('/usr/bin/curl'))
		!echo install curl first
	else
		!echo install python-neovim
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif



inoremap <C-f> <Esc>:silent !~/.config/nvim/screenshot.sh <cfile><CR>
noremap <C-s> <Esc>:silent !python ~/.config/nvim/adb.py<CR>p
"nnoremap <C-z> :silent !okular <cfile>&<CR>

"nnoremap gf :call Gofile()<CR>
"
"function! Gofile()
"python3 << endPython
"filename = vim.eval('expand("<cfile>")')
"print(filename)
"if filename.endswith('.pdf'):
"    vim.command(':silent !okular ' + filename + '&')
"elif filename.endswith(('mp3','mp4','mkv')):
"    vim.command(':silent !vlc ' + filename + '&')
"elif filename.endswith(('.jpg','png','bmp','jpeg')):
"    vim.command(':silent !feh ' + filename + '&')
"elif filename.endswith(('doc','docx')):
"    vim.command(':silent !wps ' + filename + '&')
"elif filename.endswith(('xls','xlsx')):
"    vim.command(':silent !et ' + filename + '&')
"elif filename.endswith(('ppt','pptx')):
"    vim.command(':silent !wpp ' + filename + '&')
"else:
"    vim.command(':e <cfile>')
"endPython
"endfunction



let g:python3_host_prog = '/usr/bin/python3'
"let mapleader=" "
"colorscheme peachpuff
"color delek 
"set autoindent
"set cindent
"???"filetype indent on
"let g:instant_markdown_autostart = 0
"Plugin 'suan/vim-instant-Markdown'
set relativenumber nu
" treat all the number as decimal system, seems oct does not work 0x worked
"set nrformats=
"""""""""""""""""""""""""""""""""""""
"Keyboard map
nnoremap : '
nnoremap ' :
vnoremap : '
vnoremap ' :
nnoremap ; "
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
"noremap B 5b
noremap F E
"noremap W 5w

" insert
noremap u i
noremap U I
" <tab> is <C-i>
nnoremap <c-u> <c-i>
nnoremap <c-y> <c-o>

" copy
noremap Y y$

" undo
noremap l u
noremap L U

" add
noremap a a
noremap A A

" search
noremap k n
noremap K N
noremap t f
" tag yit still worked
noremap j t


tnoremap <Esc> <C-\><C-n>


" C-a num++ c-x num--
"nnoremap <C-a> 0
nnoremap <C-e> $
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap <space>R :source $MYVIMRC<CR>
nnoremap <space>RC :e ~/.config/nvim/init.vim<CR>
nnoremap <space>I3 :e ~/.config/i3/config<CR>
" Indentation
" nnoremap < <<
" nnoremap > >>
"nnoremap <space>mrc :e ~/.config/nvim/markdown.vim<CR>
"no opperation
"map s <nop>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sn :set splitbelow<CR>:split<CR>
nnoremap se :set nosplitright<CR>:split<CR>
nnoremap si :set splitright<CR>:vsplit<CR>

"edit a new file
":e a.py 

"exchange split window
nnoremap <space>h <C-w>h
nnoremap <space>n <C-w>j
nnoremap <space>e <C-w>k
nnoremap <space>i <C-w>l
"resize the split window
nnoremap <up> :res -5<CR>
nnoremap <down> :res +5<CR>
nnoremap <left> :vertical resize +5<CR>
nnoremap <right> :vertical resize -5<CR>
"change the vertical split to horizontal, vise versa
nnoremap sv <C-w>t<C-w>H
nnoremap sV <C-w>t<C-w>K
"在shell里打开几个文件并且分屏:
" vim -O file1 file2 ...
" vim -o file1 file2 ...
" O: vertical
" o: horizontal(default)
"new tab
nnoremap <tab>k :tabe<CR>
"exchange in tab
nnoremap <tab>h :-tabnext<CR>
nnoremap <tab>i :tabnext<CR>
"vim a b c change between buffers
nnoremap <space>Bh :bp<CR>
nnoremap <space>Bi :bn<CR>


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
" like zsh
set wildmenu

"high light search
set hlsearch
"exec the following cmd, default on seems
exec "nohlsearch"
"high light when you typing word
set incsearch
"at 1 line leader=" " no highlight
noremap <space><CR> :nohlsearch<CR>

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
set mouse=iv
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
set listchars=tab:\|\ ,trail:▫
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

autocmd FileType markdown setlocal spell
set spelllang=en_us,cjk
setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
"if &filetype == 'markdown'
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

func! MyFunc()
	echo "hello"
endfunc


" Compile function
nnoremap <space>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    "exec "!g++ % -o %<"
    exec "!gcc % -o %<"
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
    set splitbelow
    :sp
    :term time python3 %
  elseif &filetype == 'html'
    exec "!chromium '%' &"
"  elseif &filetype == 'html'
"    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  elseif &filetype == 'mdp'
    exec "terminal mdp %"
  elseif &filetype == 'tex'
    exec "LLPStartPreview"
  elseif &filetype == 'vim'
    exec "source %"
  endif
endfunc

nnoremap <space>p :call Pandoc()<CR>
func! Pandoc()
	setlocal spell
	set spelllang=en_us
	inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
  exec "w"
  if &filetype == 'markdown'
    exec "!python /home/ben/Documents/SSP/TermPapers/citation.py"
    exec "!wps a.docx"
  endif
endfunc

autocmd Filetype markdown nnoremap <space>C :silent !chromium&<CR>:MarkdownPreview<CR>

au BufRead,BufNewFile *.mdp setfiletype mdp


call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim'
"Plug 'joshdick/onedark.vim'


"Markdown
"-----
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['ipynb', 'markdown']}

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'

"Undo tree
"-----
Plug 'mbbill/undotree'

"coc
"-----
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neoclide/jsonc.vim'


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
Plug 'gcmt/wildfire.vim'

Plug 'junegunn/vim-easy-align'
" ga
" v ip ga 

" Jupyter Interactive
"-----
" Make Vim talk to Jupyter kernels
Plug 'jupyter-vim/jupyter-vim'
" Plug 'hisaknown/jupyterkernel.vim' "need fix!!!
" need jupyter_kernel_gateway
" [jupyter_console need enter to show the result](https://github.com/jupyter/jupyter_console/pull/133)

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
Plug 'lilydjwg/fcitx.vim'

" " nerd tree
" " -----
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

"Plug 'vim-scripts/mru.vim'

"Plug 'lvht/mru'
"
Plug 'lervag/vimtex'
Plug 'BenSYZ/tex-conceal.vim',{'for': ['tex','markdown']}
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lambdalisue/suda.vim'
" fold the markdown and conceal math
Plug 'plasticboy/vim-markdown'


Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}


" substitute, need to config
Plug 'svermeulen/vim-subversive'

" Zotero
Plug 'Shougo/unite.vim'
Plug 'rafaqz/citation.vim'
"Plug 'jalvesaq/zotcite'


"" tty chinese
"Plug 'vim-scripts/VimIM'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}


call plug#end()



let g:SnazzyTransparent = 1
colorscheme snazzy
"syntax on
"colorscheme onedark


"==
"==  Markdown
"==============
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1
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
"let g:mkdp_port = '8091'
let g:mkdp_page_title = '「${name}」'

"===
"===  vim-markdown
"====================
let g:tex_conceal = ""
let g:vim_markdown_math=1
let g:vim_markdown_conceal=1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal_code_blocks = 0

"https://vim.fandom.com/wiki/Creating_your_own_syntax_files
"syn match MatrixMember '\t'
"syn keyword Matrix begin{pmatrix} nextgroup=MatrixMember skipwhite


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

nnoremap <space>tm :TableModeToggle<CR>

"==
"==  undotree
"==============
nnoremap L :UndotreeToggle<CR>

"==
"==  coc
"==============
" coc-marketplace
let g:coc_global_extensions = [
	\'coc-vimlsp',
	\'coc-json',
	\'coc-python',
	\'coc-pyright',
	\'coc-html',
	\'coc-yank',
	\'coc-lists',
	\'coc-gitignore',
	\'coc-texlab',
	\'coc-explorer',
	\'coc-sh',
	\'coc-snippets' ]
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
" open all the doc when nothing leader
inoremap <silent><expr> <c-n> coc#refresh()

" " Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"default on
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <space>- <Plug>(coc-diagnostic-next)
nmap <silent> <space>= <Plug>(coc-diagnostic-prev)
" used in def blah blah
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"" Use K to show documentation in preview window.
"nmap <silent> <space>H :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" no"" Highlight the symbol and its references when holding the cursor.
" no"autocmd CursorHold * silent call CocActionAsync('highlight')
"

" coc-json(jsonc.vim)
" --------
augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END



" no"nmap <leader>rn <Plug>(coc-rename)
" make error texts have a red color
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
" highlight in markdown
let g:markdown_fenced_languages = ['css', 'js=javascript', 'python']
" clipboard
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" To get correct comment highlighting in jsonc whose extension is json
"autocmd FileType json syntax match Comment +\/\/.\+$+

nnoremap tt :CocCommand explorer<CR>

" " --
" " -- coc-snippets
" " -------------------
" " Use <C-l> for trigger snippet expand.
" imap <C-k> <Plug>(coc-snippets-expand)
" " Use <C-j> for select text for visual placeholder of snippet.
" "vmap <C-k> <Plug>(coc-snippets-select)
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-k>'
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-m>'
" " Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-k> <Plug>(coc-snippets-expand-jump)
" let g:UltiSnipsSnippetDirectories=1
" " coc-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-e> <Plug>(coc-snippets-select)
" let g:coc_snippet_next = '<c-e>'
" let g:coc_snippet_prev = '<c-n>'
" imap <C-e> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = 'Ben'
" autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

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
" Uncomment when need
" nnoremap <space>jc :JupyterConnect<CR>
" vmap <space>jr <Plug>JupyterRunVisual
" nnoremap <space>jr :JupyterRunFile<CR>
" nmap " V <Plug>JupyterRunVisual

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
"autocmd Filetype ipynb nmap <silent><space>b :VimpyterInsertPythonBlock<CR>
"autocmd Filetype ipynb nmap <silent><space>j :VimpyterStartJupyter<CR>
"autocmd Filetype ipynb nmap <silent><space>n :VimpyterStartNteract<CR>
"let g:vimpyter_color=1



"==
"==  Ultisnips
"==============
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"

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

" ===
" === vimtex
" ==========
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" ===
" === tex-conceal
" ==========
autocmd Filetype tex set conceallevel=1
autocmd Filetype tex let g:tex_conceal='abdmg'
"hi Conceal cterm=underline ctermfg=189 ctermbg=235 gui=underline guifg=#f9f9ff guibg=#192224 guisp=#192224
autocmd Filetype tex hi Conceal ctermfg=189 ctermbg=235 guifg=#f9f9ff guibg=#192224 guisp=#192224

autocmd Filetype markdown set conceallevel=1
autocmd Filetype markdown let g:tex_conceal='abdmg'
autocmd Filetype markdown hi Conceal guibg=none
"autocmd Filetype markdown hi Conceal ctermfg=189 ctermbg=235 guifg=#f9f9ff guibg=#000000 guisp=#192224

" ===
" === vimlivePreview
" ==========
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'

" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" ===
" === vimspector
" ==========
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <space>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" ===
" === vim-subversive
" ===
nmap <space>s <plug>(SubversiveSubstitute)
nmap <space>ss <plug>(SubversiveSubstituteLine)

" ===
" === Zotero
" ==========
" unite
" -----------
"nmap e <Plug>(unite_loop_cursor_up)

autocmd FileType unite call <SID>unite_buffer_mappings()
function! s:unite_buffer_mappings() " {{{
  nmap <silent><buffer> n <Plug>(unite_loop_cursor_down)
  nmap <silent><buffer> e <Plug>(unite_loop_cursor_up)
  nmap <silent><buffer> u <Plug>(unite_insert_enter)
  nmap <silent><buffer> U <Plug>(unite_insert_head)
  "nmap <silent><buffer> i 
  nmap <silent><buffer> M <Plug>(unite_new_candidate)


  "" use ; to toggle insert mode
  "nmap <silent><buffer> ; i
  "inoremap <silent><buffer> ; <Esc>

  "" use <C-c> to close Unite
  "nmap <silent><buffer> <C-c> <Plug>(unite_exit)
  "imap <silent><buffer> <C-c> <Plug>(unite_exit)

  "" use <Tab> to run the default action
  "nmap <silent><buffer> <Tab> <Plug>(unite_do_default_action)
  "imap <silent><buffer> <Tab> <Plug>(unite_do_default_action)

  "" use <C-a> to show all actions
  "nmap <silent><buffer> <C-a> <Plug>(unite_choose_action)
  "imap <silent><buffer> <C-a> <Plug>(unite_choose_action)

  "" use <C-n> and <C-p> to move between lines in normal mode too
  "noremap <silent><buffer> <C-n> j
  "noremap <silent><buffer> <C-p> k

  "" use ' to start quick-match mode
  "nmap <silent><buffer> ' <Plug>(unite_quick_match_default_action)
  "imap <silent><buffer> ' <Plug>(unite_quick_match_default_action)
endfunction " }}}

" citation.vim
" -----------
"let g:citation_vim_bibtex_file="~/Documents/SSP/TermPapers/ref.bib"
"let g:citation_vim_mode="bibtex"

let g:citation_vim_mode="zotero" "(default)
let g:citation_vim_zotero_path="~/Zotero/"
let g:citation_vim_zotero_version=5

let g:citation_vim_key_format="{author}{date}{title}"
let g:citation_vim_cache_path='~/.config/nvim/citation'
let g:citation_vim_outer_prefix="["
let g:citation_vim_inner_prefix="@"
let g:citation_vim_suffix="]"
let g:citation_vim_et_al_limit=2
" recent additions top 1, bottom 0
let g:citation_vim_reverse_order=0 

nmap <space>l [unite]
nnoremap [unite] <nop>

"To insert a citation:
nnoremap <silent>[unite]c       :<C-u>Unite -buffer-name=citation-start-insert -default-action=append      citation/key<cr>
"To immediately open a file from a citation under the cursor:

nnoremap <silent>[unite]co :<C-u>Unite -input=<C-R><C-W> -default-action=start -force-immediately citation/file<cr>

"Or open a url from a citation under the cursor:
nnoremap <silent><space>cu :<C-u>Unite -input=<C-R><C-W> -default-action=start -force-immediately citation/url<cr>

"To browse the file folder from a citation under the cursor:
nnoremap <silent>[unite]cf :<C-u>Unite -input=<C-R><C-W> -default-action=file -force-immediately citation/file<cr>

"To view all citation information from a citation under the cursor:
nnoremap <silent>[unite]ci :<C-u>Unite -input=<C-R><C-W> -default-action=preview -force-immediately citation/combined<cr>

"To preview, append, yank any other citation data you want from unite:
nnoremap <silent>[unite]cp :<C-u>Unite -default-action=yank citation/your_source_here<cr>

"To integrate with zotcli for note editing (assuming you have zotcli installed):
nnoremap <silent><leader>cn :<C-u>UniteWithCursorWord -default-action=yank -force-immediately citation/title<cr><cr>:!zotcli add-note "<C-R>0"<cr>


" ===
" === vim visual multi
" ==========
let g:VM_maps = {}
let g:VM_custom_motions = {'i': 'l', 'e': 'k', 'n': 'j', 'H': '0', 'I': '$', 'f': 'e'}
let g:VM_maps['i'] = 'u'
let g:VM_maps['I'] = 'U'
let g:VM_maps['Find Under']         = '<C-k>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-k>'           " replace visual C-n
let g:VM_maps['Find Next'] = ''
let g:VM_maps['Find Prev'] = ''
"let g:VM_maps['Remove Region'] = 'q'
let g:VM_maps['Skip Region'] = '<c-n>'
let g:VM_maps["Undo"] = 'l'
let g:VM_maps["Redo"] = '<C-r>'


"" ===
"" === vimim
"" ==========
"let g:vimim_cloud = 'google,sogou,baidu,qq'  
"let g:vimim_map = 'tab_as_gi'  
"" :let g:vimim_mode = 'dynamic'  
"" :let g:vimim_mycloud = 0  
"" :let g:vimim_plugin = 'C:/var/mobile/vim/vimfiles/plugin'  
"" :let g:vimim_punctuation = 2  
"" :let g:vimim_shuangpin = 0  
"" :let g:vimim_toggle = 'pinyin,google,sogou' 

" ==========
"==  system
"==============
set clipboard+=unnamedplus " clipboard for system
"vnoremap Y "+y
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




"source ~/.config/nvim/markdown.vim

nnoremap <space><space> /<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown nnoremap <space>c Bi`<Esc>Ea`<Esc>
autocmd Filetype markdown nnoremap <space>m Bi$<Esc>Ea$<Esc>
autocmd Filetype markdown nnoremap <space>b Bi**<Esc>Ea**<Esc>
"autocmd Filetype markdown nnoremap <space>i bi*<Esc>ea*<Esc>


function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ===
" === Scripts
" ==========
source ~/.config/nvim/scripts/python2to3.vim
source ~/.config/nvim/scripts/Py4eToMdFunction.vim

" ===
" === try
" ==========
"source ~/.config/nvim/entire.vim

"set backupskip+=*.asc
"set viminfo=
"
"augroup GPG
"  autocmd!
"  autocmd BufReadPost  *.asc :%!gpg -q -d
"  autocmd BufReadPost  *.asc |redraw!
"  autocmd BufWritePre  *.asc :%!gpg -q -e -a
"  autocmd BufWritePost *.asc u
"  autocmd VimLeave     *.asc :!clear
"augroup END
" ===
" === tmp
" ==========


function! HelloPython()
python3 << endPython

texCodeZones = ['String']
texCodeZoneIds = vim.eval('map('+str(texCodeZones)+", 'hlID(v:val)')")
texCodeZoneIds = ['647']
print(texCodeZoneIds)

vimeval = vim.eval("synstack(line('.'), col('.') - (col('.')>=2 ? 1 : 0))")

for i in vimeval:
	print(i)#'\t' + vim.synIDattr(i,"name"))
endPython
endfunction
"call HelloPython()

nnoremap <space>d :call RunDunst()<CR>
func! RunDunst()
  exec "w"
  exec "!killall dunst"
  exec "!dunst&"
  exec "!notify-send 'It is a string'"
endfunc

nnoremap <space>a :call Runfeh()<CR>
func! Runfeh()
  exec "!feh <cfile> &"
endfunc

autocmd Filetype markdown nnoremap <space>z i✰<Esc>
func! Novel()
	:%s/^.*BookText">//
	:%s/<br\/><br\/>/\r/g
	:%s/<div id.*//
	:wq
endfunc
" conda environment
