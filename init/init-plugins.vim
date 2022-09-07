"======================================================================
"
" init-plugins.vim - 
"
" Created by skywind on 2018/05/31
" Last Modified: 2020/12/17 15:17:53
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

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


"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['basic', 'enhanced', 'filetypes']
	let g:bundle_group += ['jupyter']
	let g:bundle_group += ['markdown', 'thesis']
	let g:bundle_group += ['airline', 'coc', 'html']
	let g:bundle_group += ['ultisnips']
	let g:bundle_group += ['vimspector']
	let g:bundle_group += ['leaderf']
endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.config/nvim/plugged'))

"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

	" ===
	" === suda.vim
	" ============
	Plug 'lambdalisue/suda.vim'
	cnoreabbrev sudowrite w suda://%
	cnoreabbrev sw w suda://%

	" 展示开始画面，显示最近编辑过的文件
	"Plug 'mhinz/vim-startify'

	" theme
	" 一次性安装一大堆 colorscheme
	"Plug 'flazz/vim-colorschemes'
	Plug 'connorholyday/vim-snazzy'
	Plug 'dracula/vim'
	"select at last

	" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
	"Plug 'zakj/vim-showmarks'
	"Plug 'b-boogaard/ShowMarks'
	Plug 'BenSYZ/vim-signature'
	"Plug 'vim-scripts/Visual-Mark'

	" 用于在侧边符号栏显示 git/svn 的 diff
	Plug 'mhinz/vim-signify'

	" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
	" 使用 :RemoveErrorMarkers 命令或者 <space>ce 清除错误
	Plug 'mh21/errormarker.vim'
	noremap <silent><space>ce :RemoveErrorMarkers<cr>

	" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 't9md/vim-choosewin'
	" 使用 ALT+E 来选择窗口
	nmap <m-t> <Plug>(choosewin)

	if has('macunix')
	    Plug 'BenSYZ/Mac-input.vim'
	    let g:input_en='com.apple.keylayout.Colemak'
	    let g:input_zh='com.apple.inputmethod.SCIM.ITABC'
	    "so $HOME/.config/nvim/plugged/mac-input.vim/plugin/mac-input.vim
	    "Plug 'brglng/vim-im-select'
	elseif has('unix')
	    Plug 'lilydjwg/fcitx.vim'
	endif


	" Git 支持
	Plug 'tpope/vim-fugitive'


	" startify
	" ----------
	" 默认不显示 startify
	"let g:startify_disable_at_vimenter = 1
	"let g:startify_session_dir = '~/.vim/session'


	" vim-signify
	" ----------
	" signify 调优
	let g:signify_vcs_list = ['git', 'svn']
	let g:signify_sign_add               = '+'
	let g:signify_sign_delete            = '_'
	let g:signify_sign_delete_first_line = '‾'
	let g:signify_sign_change            = '~'
	let g:signify_sign_changedelete      = g:signify_sign_change

	" git 仓库使用 histogram 算法进行 diff
	let g:signify_vcs_cmds = {
			\ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
			\}

	" 使用 vim 查看man pages map, 一些keymap 就可以用了
	" Buffer 是文件在内存中的缓存数据，一个 Buffer 总是也只能是对应一个文件，unmap需要 filetype
	" Buffer 负责保存数据，Window 负责展示数据(split)，Tab 为 Window 提供排版布局，Buffer 和 Tab 对 Window 总是一对多的关系。如果把 Vim 想象成一个机房的话，Buffer 就是主机，Window 是显示器，而 Tab 是一个个显示器架子。只不过这个机房里面的显示器可以随意连接到别的主机上面，一个主机可以被多个显示器连接。
	" https://blog.csdn.net/jy692405180/article/details/79775125
	"Plug 'vim-utils/vim-man'
	"Plug 'paretje/nvim-man'
	"上面两个插件和 export MANPAGER='nvim +Man!' 貌似有冲突
	autocmd FileType man unmap <silent> <buffer> k
	"autocmd FileType man unmap <silent> <buffer> K
	"autocmd FileType man nnoremap <silent> <buffer> <c-K>           :call man#get_page_from_cword('horizontal', v:count)<CR>
	autocmd FileType man nnoremap <silent> <buffer> <c-K> :Man<CR>
	autocmd FileType man nnoremap <silent> <buffer> <cr> :Man<CR>
	autocmd FileType man nnoremap <silent> <buffer> M :Man<CR>

endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

	"" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
	"Plug 'terryma/vim-expand-region'
	"" ALT_+/- 用于按分隔符扩大缩小 v 选区
	"map <m-=> <Plug>(expand_region_expand)
	"map <m--> <Plug>(expand_region_shrink)
	Plug 'gcmt/wildfire.vim'

	" 快速文件搜索
	Plug 'junegunn/fzf'

	" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
	Plug 'asins/vim-dict'

	" 使用 :FlyGrep 命令进行实时 grep
	Plug 'wsdjeg/FlyGrep.vim'

	" 使用 :CtrlSF 命令进行模仿 sublime 的 grep
	Plug 'dyng/ctrlsf.vim'

	" 配对括号和引号自动补全
	"Plug 'Raimondi/delimitMate'
	Plug 'jiangmiao/auto-pairs'

	"surround.vim
	"-------
	Plug 'tpope/vim-surround'
		" iw  is a text object, in word
		" ds{, delete surround {
		" cs'", change surround '"
		"  Old text                  Command           New text ~
		"  hello                   ysWfprint<cr>     print("hello")
	" comment
	Plug 'tpope/vim-commentary'

	"==
	"==  vim easy align
	"==============
	Plug 'junegunn/vim-easy-align'
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
		" ga
		" v ip ga 
	"==
	"==  undotree
	"==============
	Plug 'mbbill/undotree'
	nnoremap L :UndotreeToggle<CR>

	" ===
	" === vim-subversive
	" ===
	" substitute, need to config
	Plug 'svermeulen/vim-subversive'
	nmap <space>s <plug>(SubversiveSubstitute)
	nmap <space>ss <plug>(SubversiveSubstituteLine)
	" ===
	" === vim visual multi
	" ==========
	"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	"let g:VM_maps = {}
	"let g:VM_custom_motions = {'i': 'l', 'e': 'k', 'n': 'j', 'H': '0', 'I': '$', 'f': 'e'}
	"let g:VM_maps['i'] = 'u'
	"let g:VM_maps['I'] = 'U'
	"let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
	"let g:VM_maps['Find Subword Under'] = '<C-N>'           " replace visual C-n
	"let g:VM_maps['Find Next'] = ''
	"let g:VM_maps['Find Prev'] = ''
	""let g:VM_maps['Remove Region'] = 'q'
	"let g:VM_maps['Skip Region'] = '<c-n>'
	"let g:VM_maps["Undo"] = 'l'
	"let g:VM_maps["Redo"] = '<C-r>'

	Plug 'terryma/vim-multiple-cursors'
	let g:multi_cursor_use_default_mapping=0

	" Default mapping
	let g:multi_cursor_start_word_key      = '<C-n>'
	let g:multi_cursor_select_all_word_key = '<A-n>'
	let g:multi_cursor_start_key           = 'g<C-n>'
	let g:multi_cursor_select_all_key      = 'g<A-n>'
	let g:multi_cursor_next_key            = '<C-n>'
	let g:multi_cursor_prev_key            = '<C-p>'
	let g:multi_cursor_skip_key            = '<C-x>'
	let g:multi_cursor_quit_key            = '<Esc>'

	" Auto format Chinese and English
	Plug 'hotoo/pangu.vim'
	"autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

endif

"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

	" C++ 语法高亮增强，支持 11/14/17 标准
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

	" 额外语法文件
	Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

	" python 语法文件增强
	Plug 'vim-python/python-syntax', { 'for': ['python'] }
	Plug 'vim-scripts/mediawiki.vim', { 'for': ['wikipedia'] }
endif

"----------------------------------------------------------------------
" Markdown 相关
"----------------------------------------------------------------------
if index(g:bundle_group, 'markdown') >= 0

	" Markdown preview
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['ipynb', 'markdown']}
	"==
	"==  Markdown preview
	"==============
	let g:mkdp_auto_start = 0
	let g:mkdp_auto_close = 1
	let g:mkdp_refresh_slow = 0
	let g:mkdp_command_for_global = 1
	let g:mkdp_open_to_the_world = 0
	let g:mkdp_open_ip = ''
	let g:mkdp_browser = ''
	let g:mkdp_echo_preview_url = 0
	if has('macunix')
	    let g:mkdp_browserfunc = ''
	elseif has('unix')
	    let g:mkdp_browserfunc = 'g:Open_browser'
	endif
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

	function! g:Open_browser(url)
		silent exe '!firefox ' . a:url . "&"
		"silent exe '!chromium --app=' . a:url
		"silent exec "chromium --app=" . a:url . " &"
	endfunction

	"autocmd Filetype markdown nnoremap <space>C :silent !chromium&<CR>:MarkdownPreview<CR>

	"===
	"===  vim-table-mode
	"====================
	Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
	nnoremap <space>tm :TableModeToggle<CR>
endif


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_powerline_fonts = 0
	let g:airline_exclude_preview = 1
	let g:airline_section_b = '%n'
	let g:airline_theme='deus'
	let g:airline#extensions#branch#enabled = 0
	let g:airline#extensions#syntastic#enabled = 0
	let g:airline#extensions#fugitiveline#enabled = 0
	let g:airline#extensions#csv#enabled = 0
	let g:airline#extensions#vimagit#enabled = 0
endif


"----------------------------------------------------------------------
" coc：动态语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'coc') >= 0
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/jsonc.vim'

	"\'coc-clangd',
        "\'coc-project',
	let g:coc_global_extensions = [
		\'coc-vimlsp',
		\'coc-json',
		\'coc-pyright',
		\'coc-html',
		\'coc-sh',
		\'coc-yank',
		\'coc-lists',
		\'coc-gitignore',
		\'coc-texlab',
		\'coc-explorer' ]

	" open all the doc when nothing leader
	inoremap <silent><expr> <c-n> coc#refresh()

	" Use <Tab> and <S-Tab> to navigate the completion list:
	inoremap <silent><expr> <TAB>
		\ coc#pum#visible() ? coc#pum#next(1):
		\ CheckBackspace() ? "\<Tab>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice.
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	function! CheckBackspace() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	if has('nvim')
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" clipboard
	nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

	" Use M for show documentation in preview window
	nnoremap <silent> M :call <SID>show_documentation()<CR>
	function! s:show_documentation()
	    if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	    elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	    else
		execute '!' . &keywordprg . " " . expand('<cword>')
	    endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')
	autocmd CursorHoldI * silent call CocActionAsync('highlight')
	" need  "coc.preferences.currentFunctionSymbolAutoUpdate": true,
	set updatetime=500

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" diagnose
	nmap <silent> <space>- <Plug>(coc-diagnostic-prev)
	nmap <silent> <space>= <Plug>(coc-diagnostic-next)
	" used in def blah blah
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" coc-json(jsonc.vim)
	" --------
	augroup JsonToJsonc
		autocmd! FileType json set filetype=jsonc
	augroup END


	highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
	" highlight in markdown
	let g:markdown_fenced_languages = ['sh', 'css', 'js=javascript', 'python']
	" To get correct comment highlighting in jsonc whose extension is json
	autocmd FileType json syntax match Comment +\/\/.\+$+

	nnoremap tt :CocCommand explorer<CR>

	""==
	""== echodoc：
	""============
	""搭配 coc 在底部显示函数参数
	"Plug 'Shougo/echodoc.vim'
	"set noshowmode
	"let g:echodoc#enable_at_startup = 1

	"" coc-snippets
	"" --------------------
	""" Use <C-l> for trigger snippet expand.
	""imap <C-k> <Plug>(coc-snippets-expand)

	""" Use <C-j> for select text for visual placeholder of snippet.
	""vmap <C-k> <Plug>(coc-snippets-select)

	"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
	"let g:coc_snippet_next = '<c-k>'

	"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
	"let g:coc_snippet_prev = '<c-m>'

	"" Use <C-j> for both expand and jump (make expand higher priority.)
	"imap <C-k> <Plug>(coc-snippets-expand-jump)

	"" Use <leader>x for convert visual selected code to snippet
	""xmap <leader>x  <Plug>(coc-convert-snippet)
	" vim have gh go header
	"Plug 'Yohannfra/Vim-Goto-Header'
	"let g:goto_header_open_in_new_tab = 1
	"let g:goto_header_includes_dirs = [".", "/usr/include", "..", "~"]
	"" [ "DIR2", "DIR3.", "DIR4"]
	""let g:goto_header_use_shorter_path = 1
	"let g:goto_header_associate_cpp_h = 1
	"nnoremap gh :GotoHeader <CR>

endif

if index(g:bundle_group, 'html') >= 0
	"autocmd Filetype html Plug 'mattn/emmet-vim'
	Plug 'mattn/emmet-vim'
	" only enable in html and css html:5
	let g:user_emmet_install_global = 0
	autocmd FileType html,css,markdown EmmetInstall
endif


if index(g:bundle_group, 'ultisnips') >= 0
	"==
	"==  Ultisnips
	"==============
	Plug 'SirVer/ultisnips'
	let g:UltiSnipsExpandTrigger="<c-k>"
	let g:UltiSnipsJumpForwardTrigger="<c-k>"
	let g:UltiSnipsJumpBackwardTrigger="<c-m>"

	let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']

	let g:loaded_python_provider = 1
	let g:python_host_skip_check=1
	let g:python3_host_skip_check=1
	if has('macunix')
	    let g:python3_host_prog = '/usr/local/bin/python3'
	elseif has('unix')
	    let g:python_host_prog = '/usr/bin/python'
	    let g:python3_host_prog = '/usr/bin/python3'
	endif
endif


if index(g:bundle_group, 'vimspector') >= 0
	" ===
	" === vimspector
	" ==========
	Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
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
endif

if index(g:bundle_group, 'thesis') >= 0

	" ===
	" === vimtex
	" ==========
	Plug 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0

	"===
	"===  vim-markdown
	"====================
	" 对代码块进行识别$...$、 $$...$$，# ,etc，然后conceal
	Plug 'plasticboy/vim-markdown'
	" fold the markdown and conceal math
		"zc      折叠
		"zC     对所在范围内所有嵌套的折叠点进行折叠
		"zo      展开折叠
		"zO     对所在范围内所有嵌套的折叠点展开
	let g:tex_conceal = ""
	let g:vim_markdown_math=1
	let g:vim_markdown_conceal=1
	let g:vim_markdown_folding_disabled = 1
	let g:vim_markdown_new_list_item_indent = 0
	let g:vim_markdown_conceal_code_blocks = 0
	""https://vim.fandom.com/wiki/Creating_your_own_syntax_files
	"syn match MatrixMember '\t'
	"syn keyword Matrix begin{pmatrix} nextgroup=MatrixMember skipwhite
	
	" ===
	" === tex-conceal
	" ==========
	" This plugin extends the Conceal feature of Vim for LaTeX.
	" \int -> ∫
	Plug 'BenSYZ/tex-conceal.vim',{'for': ['tex','markdown']}
	autocmd Filetype tex set conceallevel=1
	autocmd Filetype tex let g:tex_conceal='abdmg'
	autocmd Filetype tex hi Conceal guibg=#282a36
	"hi Conceal cterm=underline ctermfg=189 ctermbg=235 gui=underline guifg=#f9f9ff guibg=#192224 guisp=#192224
	"autocmd Filetype tex hi Conceal ctermfg=189 ctermbg=235 guifg=#f9f9ff guibg=#192224 guisp=#192224
	autocmd Filetype markdown set conceallevel=1
	autocmd Filetype markdown let g:tex_conceal='abdmg'
	autocmd Filetype markdown hi Conceal guibg=#282a36
	"autocmd Filetype tex hi clear Conceal
	"autocmd Filetype markdown hi Conceal ctermfg=189 ctermbg=235 guifg=#f9f9ff guibg=#000000 guisp=#192224
	" ===
	" === tex-fold
	" ==========
	Plug 'matze/vim-tex-fold',{'for': 'tex'}
	
	" ===
	" === inkscape
	" ==========
	" https://github.com/gillescastel/inkscape-figures
	
	"inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
	autocmd Filetype tex inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
	"inoremap <C-f> <Esc>: silent exec '.!echo inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/" > /tmp/test'<CR><CR>:w<CR>
	autocmd Filetype tex nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
	"autocmd Filetype markdown inoremap <C-f> <Esc>: silent exec '.!~/.config/nvim/scripts/my_inkscape.sh ' . getline('.')<CR><CR>:w<CR>
	"autocmd Filetype markdown nnoremap <C-f> : silent exec '!inkscape <cfile> > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

	" ===
	" === vim-latex-live-Preview
	" ==========
	Plug 'xuhdev/vim-latex-live-preview'
	let g:livepreview_previewer = 'zathura'
	let g:livepreview_engine = 'pdflatex'
	" ===
	" === Zotero
	" ==========
	"Plug 'lvht/mru'
	Plug 'Shougo/unite.vim'
	Plug 'rafaqz/citation.vim'
	"Plug 'jalvesaq/zotcite'
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
	"let g:citation_vim_collection = ["Thesis", "ref_from Wang Yu"]
	"let g:citation_vim_collection = "gaussian"
	let g:citation_vim_collection = "creative common"

	"let g:citation_vim_bibtex_file="/path/to/your/bib/file/library.bib"
	"let g:citation_vim_mode="bibtex"

	" after change remove ~/.config/nvim/citation/*
	let g:citation_vim_key_format="{author}_{title}_{date}"
	"let g:citation_vim_key_format=""
	let g:citation_vim_cache_path='~/.config/nvim/citation'
	let g:citation_vim_et_al_limit=2
	" recent additions top 1, bottom 0
	let g:citation_vim_reverse_order=0 

	autocmd FileType markdown let g:citation_vim_outer_prefix="["
	autocmd FileType markdown let g:citation_vim_inner_prefix="@"
	autocmd FileType markdown let g:citation_vim_suffix="]"

	autocmd FileType tex let g:citation_vim_outer_prefix="\\cite{"
	autocmd FileType tex let g:citation_vim_inner_prefix=""
	autocmd FileType tex let g:citation_vim_suffix="}"

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
endif

if index(g:bundle_group, 'jupyter') >= 0

	"==
	"==  jupyter-vim
	"==============
	" Make Vim talk to Jupyter kernels
	Plug 'jupyter-vim/jupyter-vim'
		" Plug 'hisaknown/jupyterkernel.vim' "need fix!!!
		" need jupyter_kernel_gateway
		" [jupyter_console need enter to show the result](https://github.com/jupyter/jupyter_console/pull/133)
	" Uncomment when need
	" nnoremap <space>jc :JupyterConnect<CR>
	" vmap <space>jr <Plug>JupyterRunVisual
	" nnoremap <space>jr :JupyterRunFile<CR>
	" nmap " V <Plug>JupyterRunVisual

	" ===
	" === jupytext
	" ================
	" edit ipynb as markdown, need 'jpytertext' or 'notedown'.
	Plug 'goerz/jupytext.vim'
		" old version: ipynb_notedown
		" Both are convert 'ipynb' to 'markdown'
	let g:jupytext_enable = 1
	let g:jupytext_fmt = 'md'
	"jupytext --to=ipynb --from=md --update --output notebook.ipynb notebook.md

	" ===
	" === vimpyter
	" ==========
	"Plug 'szymonmaszke/vimpyter'
	"	" need 'notedown'
	"	" edit ipynb as markdown, need 'jpytertext' or 'notedown'
	"autocmd Filetype ipynb nmap <silent><space>b :VimpyterInsertPythonBlock<CR>
	"autocmd Filetype ipynb nmap <silent><space>j :VimpyterStartJupyter<CR>
	"autocmd Filetype ipynb nmap <silent><space>n :VimpyterStartNteract<CR>
	"let g:vimpyter_color=1


endif
""----------------------------------------------------------------------
"" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
""----------------------------------------------------------------------
"if index(g:bundle_group, 'leaderf') >= 0
"	" 如果 vim 支持 python 则启用  Leaderf
"	if has('python') || has('python3')
"		Plug 'Yggdroot/LeaderF'
"
"		" CTRL+p 打开文件模糊匹配
"		let g:Lf_ShortcutF = '<c-p>'
"
"		" ALT+n 打开 buffer 模糊匹配
"		let g:Lf_ShortcutB = '<m-n>'
"
"		" CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
"		noremap <c-n> :LeaderfMru<cr>
"
"		" ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
"		noremap <m-p> :LeaderfFunction!<cr>
"
"		" ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
"		noremap <m-P> :LeaderfBufTag!<cr>
"
"		" ALT+n 打开 buffer 列表进行模糊匹配
"		noremap <m-n> :LeaderfBuffer<cr>
"
"		" ALT+m 全局 tags 模糊匹配
"		noremap <m-m> :LeaderfTag<cr>
"
"		" 最大历史文件保存 2048 个
"		let g:Lf_MruMaxFiles = 2048
"
"		" ui 定制
"		let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
"
"		" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
"		let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
"		let g:Lf_WorkingDirectoryMode = 'Ac'
"		let g:Lf_WindowHeight = 0.30
"		let g:Lf_CacheDirectory = expand('~/.vim/cache')
"
"		" 显示绝对路径
"		let g:Lf_ShowRelativePath = 0
"
"		" 隐藏帮助
"		let g:Lf_HideHelp = 1
"
"		" 模糊匹配忽略扩展名
"		let g:Lf_WildIgnore = {
"					\ 'dir': ['.svn','.git','.hg'],
"					\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
"					\ }
"
"		" MRU 文件忽略扩展名
"		let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
"		let g:Lf_StlColorscheme = 'powerline'
"
"		" 禁用 function/buftag 的预览功能，可以手动用 p 预览
"		let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
"
"		" 使用 ESC 键可以直接退出 leaderf 的 normal 模式
"		let g:Lf_NormalMap = {
"				\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
"				\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
"				\ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
"				\ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
"				\ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
"				\ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
"				\ }
"
"	else
"		" 不支持 python ，使用 CtrlP 代替
"		Plug 'ctrlpvim/ctrlp.vim'
"
"		" 显示函数列表的扩展插件
"		Plug 'tacahiroy/ctrlp-funky'
"
"		" 忽略默认键位
"		let g:ctrlp_map = ''
"
"		" 模糊匹配忽略
"		let g:ctrlp_custom_ignore = {
"		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"		  \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
"		  \ 'link': 'some_bad_symbolic_links',
"		  \ }
"
"		" 项目标志
"		let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
"		let g:ctrlp_working_path = 0
"
"		" CTRL+p 打开文件模糊匹配
"		noremap <c-p> :CtrlP<cr>
"
"		" CTRL+n 打开最近访问过的文件的匹配
"		noremap <c-n> :CtrlPMRUFiles<cr>
"
"		" ALT+p 显示当前文件的函数列表
"		noremap <m-p> :CtrlPFunky<cr>
"
"		" ALT+n 匹配 buffer
"		noremap <m-n> :CtrlPBuffer<cr>
"	endif
"endif


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
