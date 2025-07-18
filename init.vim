:autocmd! BufNewFile,BufRead *.h set filetype=c

:set notermguicolors
":set background=dark
:colorscheme habamax
:highlight Normal                       ctermfg=249 ctermbg=16
:highlight Comment                      ctermfg=240     
:highlight Type                         ctermfg=65      
:highlight Identifier                   ctermfg=138 "fg181
:hi @lsp.type.operator.c                ctermfg=255 "fg189
:hi @lsp.type.function                  ctermfg=174
:hi @lsp.typemod.function.declaration.c ctermfg=217
:highlight PreProc                      ctermfg=94             
":highlight Constant                    ctermfg=173            
:highlight String                       ctermfg=66             
:highlight Statement                    ctermfg=140                         
:highlight Special                      ctermfg=146 "fg195                    
:highlight MatchParen                   ctermfg=195 ctermbg=236 cterm=NONE  
:highlight MsgArea                      ctermfg=255 ctermbg=234             
:highlight WinSeparator                 ctermfg=233 ctermbg=0
:highlight StatusLine                   ctermfg=68  ctermbg=233
:highlight StatusLineNC                 ctermfg=238 ctermbg=233
:highlight ModeMsg                      ctermfg=0   ctermbg=68
:highlight TabLineSel                   ctermfg=68  ctermbg=0   cterm=NONE
:highlight TabLine                      ctermfg=238 ctermbg=233
:highlight Title                        ctermfg=143 ctermbg=233 cterm=NONE "fg186
:highlight TabLineFill                              ctermbg=233
:highlight CursorLine                               ctermbg=233
:highlight CursorColumn                             ctermbg=232
:highlight CursorLineNR                 ctermfg=238 ctermbg=0   cterm=NONE
:highlight LineNR                       ctermfg=234 ctermbg=0   cterm=NONE
":autocmd VimEnter * syntax off


:set tabline=%!TabLine()
function! TabLine()

	let s = ''

  " loop through each tab page
	for i in range(tabpagenr('$'))

		" set separators based on current tab
		if i + 1 == tabpagenr()
			let s .= '%#Title#/%#TabLineSel#'
		else
			let s .= '%#Title#\%#TabLine#'
		endif
		"if i + 1 == tabpagenr()
		"  let s .= '%#TabLineSel#' " WildMenu
		"else
		"  let s .= '%#Title#'
		"endif
		
		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T '
		
		" set page number string
		"let s .= i + 1 . ''
		"let s .= '\ '
		
		" get buffer names and statuses
		let n = ''  " temp str for buf names
		let m = 0   " &modified counter
		let buflist = tabpagebuflist(i + 1)
		
		" loop through each buffer in a tab
		for b in buflist
			"remember to ELSEIF
			"if getbufvar(b, "&buftype") == 'help'
			"	let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
			if getbufvar(b, "&buftype") == 'quickfix'
				let n .= '[Q]'
			elseif getbufvar(b, "&modifiable")
				let n .= fnamemodify(bufname(b), ':t') . ', '  "pathshorten(bufname(b))
      endif

      if getbufvar(b, "&modified")
        let m += 1
      endif
    endfor

    "let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, '\( ,\|, $\)\+', '', '')
    let n = substitute(n, '\( ,\|, $\)\+', '', '')

    " add modified label
    if m > 0
			let s .= '+ '
		endif
    "if m == 1
		"	let s .= '+'
		"elseif m > 1
		"	let s .= '++'
    "endif

    " add buffer names
    if n == ''
      let s .= '[New]'
    else
      let s .= n
    endif

    " switch to no underlining and add final space
    let s .= ' '
  endfor

  if tabpagenr() < 5
    let s .= '%#Title#\%#TabLineFill#%<'
  else
    let s .= '%#Title#\'
  endif

	" right-aligned close button
	"if tabpagenr('$') > 1
		"let s .= '%=%#TabLineFill#%999Xclose'
	"endif
	return s
endfunction


:set mouse=a
:set nomousefocus
:set mousemodel=extend
:map <MiddleMouse> <nop>
:map <2-MiddleMouse> <nop>
:map <3-MiddleMouse> <nop>
:map <4-MiddleMouse> <nop>
:map <A-RightMouse> <nop>
:map <ScrollWheelUp> <nop>
:map <S-ScrollWheelUp> <nop>
:map <C-ScrollWheelUp> <nop>
:map <ScrollWheelDown> <nop>
:map <S-ScrollWheelDown> <nop>
:map <C-ScrollWheelDown> <nop>
:map <ScrollWheelLeft> <nop>
:map <S-ScrollWheelLeft> <nop>
:map <C-ScrollWheelLeft> <nop>
:map <ScrollWheelRight> <nop>
:map <S-ScrollWheelRight> <nop>
:map <C-ScrollWheelRight> <nop>
":autocmd VimEnter * aunmenu PopUp.How-to\ disable\ mouse
":autocmd VimEnter * aunmenu PopUp.-1-


"let g:loaded_netrw = 1
"let g:loaded_netrwPlugin = 1
"let g:loaded_netrwSettings = 1
"let g:loaded_netrwFileHandlers = 1
"let g:loaded_netrw_gitignore = 1

let g:netrw_banner=0
"\(^\|\s\s\)\zs\.\S\+
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.*\.o$,.*\.o\.json$,.*\.d$'
let g:netrw_sort_by="name"
let g:netrw_sort_sequence='[\/]$,\<core\%(\.\d\+\)\=\>,\.h$,\.c$,\.cpp$,\.vert$,\.frag$,\.data$,\~\=\*$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'


":set timeoutlen=100
:set wrap
:set sel=old
:set virtualedit=block
":set nowrapscan
":set linebreak 
":set breakat=\	!@*-+;:,./?
":set breakat=\	!@*+;:,./?
:set showbreak=\ \ \ 
:set number
:set signcolumn=auto
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set clipboard^=unnamed,unnamedplus
:set switchbuf=useopen,usetab,newtab
:set splitright
:set splitbelow
:set showtabline=2
:set cmdheight=0
":set showcmd
":set showcmdloc=statusline
":set statusline=
:set notitle
:set foldlevel=0
:set foldmethod=syntax
:set foldignore=#\*/
:set foldnestmax=1
:set nofoldenable
:set noignorecase
:set gdefault
:set guicursor=n-v-sm-c:block,i-ci-ve:ver25,r-cr-o:hor20
:set cul
:set culopt=number
:autocmd ModeChanged n:* set culopt=line,number
":autocmd ModeChanged *:[v] set cuc
:autocmd ModeChanged *:n set nocuc | set culopt=number

:autocmd VimEnter * noremap <C-right> 2zl
:autocmd VimEnter * noremap <C-left> 2zh2h
":noremap <C-right> 2zl
":noremap <C-left>  2zh
":noremap t :noremap <lt>esc> :echo "asdf"<lt>CR><CR>


:noremap <right> zlM
:noremap <down> <C-e>M
:noremap <left> zhMh
:noremap <up> <C-y>M
:noremap <C-down> 2<C-e>M
:noremap <C-up> 2<C-y>M
:noremap <C-end> <end>

:noremap <silent> <A-a> :set foldlevel=0<CR>
:noremap <C-a> za
":noremap <silent> <C-m> :set foldenable<CR>:%foldc<CR>
:noremap <S-m> zi

:noremap! <C-b> <left>
:noremap! <C-f> <right>
:noremap  <C-b> [][{zz
:noremap  <C-f> ]m[{]}][[{zz
:noremap  <C-n> <c-e>
:noremap  <C-p> <c-y>

:nnoremap <C-e> r<C-e>l
:nnoremap <C-y> r<C-y>l
:vnoremap <C-e> <esc>`<v`>
:vnoremap <C-y> <esc>`>v`<

:noremap! <C-t> ^
:noremap! <C-y> &
:noremap! <C-u> *
:noremap r<C-t> r^
:noremap r<C-y> r&
:noremap r<C-u> r*

:noremap  <C-j> 2jzz
:noremap  <C-k> 2kzz
:vnoremap <C-j> 2j
:vnoremap <C-k> 2k
:noremap  <C-l> $
:noremap  <C-h> 0
:noremap  <C-d> <nop>
:noremap  <C-u> <nop>

:noremap <silent> <C-A-j> <c-w>v<c-w>L<c-w>=:Explore<CR>
:noremap <silent> <C-A-k> <c-w>s<c-w>=:Explore<CR>
:noremap <A-j> <C-w>w<C-w>=
":noremap <A-k> <c-w>R<c-w>w<c-w>=
:noremap <A-k> <C-w><bar><C-w>_
:noremap <S-j> <C-w>L
:noremap <S-k> <C-w>K
:nnoremap -   <S-j>
:nnoremap =   :=
:noremap ?    <S-k>
:noremap <silent> <C-A-l> <esc>:tabnew<CR>:Explore<CR>
:noremap <silent> <A-l> <esc>:tabnext<CR>
:noremap <silent> <A-h> <esc>:tabprevious<CR>
:noremap <silent> <S-l> <esc>:tabmove +1<CR>
:noremap <silent> <S-h> <esc>:tabmove -1<CR>

:tnoremap ;; <C-\><C-n>:
:tnoremap ;<esc> <C-\><C-n>
:tnoremap ;q <C-u>exit<CR><C-\><C-n>:tabclose<CR>:tabprevious<CR>
:tnoremap <A-q> <C-u>exit<CR><C-\><C-n>:tabclose<CR>:tabprevious<CR>
:tnoremap ;<esc> <C-\><C-n>
":tnoremap <C-h> <C-b>
":tnoremap <C-l> <C-f>

:nnoremap <silent> <esc> <esc>:noh<CR>:set cmdheight=0<CR>:set statusline=<CR>
:noremap <silent> <A-?> :Inspect<CR>
:noremap <A-v> gv
":noremap <A-;> :!./

:noremap <A-w> ebve"ry:grep --include \*.c --include \*.h -r '\<<C-r>r\>' .<CR>:cfdo %s/\<<C-r>r\>/<C-r>r
:vnoremap <A-w> "ry:grep --include \*.c --include \*.h -r '<C-r>r' .<CR>:cfdo %s/<C-r>r/<C-r>r
":tabdo windo s/<C-r>r/
"
:noremap <silent> <A-t> :tabnew<CR>:ter<CR>i
:noremap <silent> <A-CR> :tabnew<CR>:ter<CR>imake -j$(nproc)<CR>
:noremap <silent> <A-m> :make -C %:h -j$(nproc)<CR>
:noremap <silent> <A-o> :e %:h<CR>
:noremap <silent> <A-r> :so $MYVIMRC<CR>
:noremap <silent> <A-c> :set cmdheight=1<CR>
:noremap <silent> <S-A-w> :SessionSave<CR>
:noremap <silent> <A-q> :q<CR>
:noremap <silent> <C-A-q> :tabclose<CR>
:noremap <silent> <S-A-q> :qa<CR>
":noremap <A-M> :mk<CR>
":noremap <S-A-M> :!rm .exrc<CR>
:inoremap <A-S-i> printf("%d\n",);<left><left>
:inoremap <A-i> SDL_Log("%d",);<left><left>

:noremap b ge
:noremap B gE
:noremap f w
:noremap F W
:noremap w b
:noremap W B

:noremap t f
:noremap T t
:noremap , ;
:noremap > ;
:noremap < ,
:nnoremap , ;
:noremap ; :
:nnoremap : q:
":noremap q; q:

:vnoremap a A
:vnoremap a<C-r> A<C-r>
:vnoremap a<C-r>p A<C-r>+
":vnoremap a<tab> A<tab>
:vnoremap i I

:vnoremap <TAB> >gv
:vnoremap <S-TAB> <gv
:nnoremap <TAB> >>
:nnoremap <S-TAB> <<

:vnoremap / "qy/\V<C-R>q<CR>N
:noremap s "_s
:vnoremap S :s/
:vnoremap <C-s> :s/\V<c-r>+/
:nnoremap S :%s/
:nnoremap <C-s> :%s/\V<c-r>+/
:nnoremap x c<right>
:nnoremap X c
:vnoremap x c
:vnoremap X C
:noremap c x
:noremap C d
:nnoremap d "_d<right>
:nnoremap D "_d
:vnoremap d "_d
:vnoremap D <Nop>
:vnoremap D" "ws""<esc>"wP
:vnoremap D' "ws''<esc>"wP
:vnoremap D( "ws()<esc>"wP
:vnoremap D) "ws()<esc>"wP
:vnoremap D[ "ws[]<esc>"wP
:vnoremap D] "ws[]<esc>"wP
:vnoremap D{ "ws{}<esc>"wP
:vnoremap D} "ws{}<esc>"wP
:vnoremap D< "ws<><esc>"wP
:vnoremap D> "ws<><esc>"wP
:vnoremap D/ "ws/*  */<esc>hh"wP

:vnoremap p P
:vnoremap P p
:inoremap <C-r>p <C-r>+
:cnoremap <C-r>p <C-r>+
:vnoremap \ <C-v>077lA\<esc>
:vnoremap <silent> <A-f> :s/  \\| \t/\t/<CR>:noh<CR>
":nnoremap <silent> <A-f> :s/  \\| \t/\t/<CR>:noh<CR>
":noremap <silent> <A-F> :s/\t/    /<CR>:noh<CR>
:vnoremap <silent> <A-p> <esc>`>a */<esc>`<i/* <esc>
:nnoremap <silent> <A-p> V<esc>`>a */<esc>`<i/* <esc>
":vnoremap <silent> <A-d> :s/\/\* *\\| *\*\/\\|/<CR>:noh<CR>
":nnoremap <silent> <A-d> :s/\/\* *\\| *\*\/\\|   *//<CR>:noh<CR>
:vnoremap <silent> <A-d> :s/\/\* \\| \*\//<CR>:noh<CR>
:nnoremap <silent> <A-d> :s/\/\* \\| \*\//<CR>:noh<CR>

"this sucks but does work
":vnoremap <A-d>p :s/\/\* *\\| *\*\/\\|   *//<CR>`>a */<esc>`<i/* <esc>
":vnoremap <A-d><A-p> :s/\/\* *\\| *\*\/\\|   *//<CR>`>a */<esc>`<i/* <esc>
":s/\/\* \\| \*\//   /<CR>
:vnoremap <silent> <A-s>p :s/\/\* /\/\/ /<CR>gv:s/ \*\// \/\//<CR>`>a */<esc>`<i/* <esc>:noh<CR>
:vnoremap <silent> <A-s><A-p> :s/\/\* /\/\/ /<CR>gv:s/ \*\// \/\//<CR>`>a */<esc>`<i/* <esc>:noh<CR>
:nnoremap <silent> <A-s>p :s/\/\* /\/\/ /<CR>gv:s/ \*\// \/\//<CR>`>a */<esc>`<i/* <esc>:noh<CR>
:nnoremap <silent> <A-s><A-p> :s/\/\* /\/\/ /<CR>gv:s/ \*\// \/\//<CR>`>a */<esc>`<i/* <esc>:noh<CR>
:vnoremap <silent> <A-s>d :s/\/\* *\\| *\*\/\\|   *//<CR>gv:s/\/\/ /\/\* /<CR>gv:s/ \/\// \*\//<CR>:noh<CR>
:vnoremap <silent> <A-s><A-d> :s/\/\* *\\| *\*\/\\|   *//<CR>gv:s/\/\/ /\/\* /<CR>gv:s/ \/\// \*\//<CR>:noh<CR>
:nnoremap <silent> <A-s>d :s/\/\* *\\| *\*\/\\|   *//<CR>gv:s/\/\/ /\/\* /<CR>gv:s/ \/\// \*\//<CR>:noh<CR>
:nnoremap <silent> <A-s><A-d> :s/\/\* *\\| *\*\/\\|   *//<CR>gv:s/\/\/ /\/\* /<CR>gv:s/ \/\// \*\//<CR>:noh<CR>

:vnoremap <C-A-p> <esc>`<V`>>gvc<space><BS>}}<esc>POfor(i = 0;i<0;i++){<esc>O{unsigned int i;<esc>jj$
:vnoremap <S-A-p> <esc>`<V`>>gvc<space><BS>}<esc>POif(){<left><left>
:nnoremap <C-A-p> A<CR>switch(<esc>pa){<CR>}<up><end><CR>break;<up><end><CR>:<left>case<space>
:nnoremap <S-A-p> A<CR>if(<esc>pa){<CR>}<up><end><CR>




"pluginstall: sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin()
	Plug 'rmagatti/auto-session'
	Plug 'nvimtools/hydra.nvim'
	Plug 'tikhomirov/vim-glsl'
	Plug 'mfussenegger/nvim-dap'

	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	set encoding=UTF-8

call plug#end()




set completeopt=menu,menuone,noselect




lua <<EOF


  local dap = require('dap')
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-dap',
    name = 'lldb',
  }

  dap.configurations.c = {
		{
			name = 'Launch',
			type = 'lldb',
			request = 'launch',
			--preRunCommands = 'make a TARGET_BIN=a TARGET_DEBUG=on',
			program = vim.fn.getcwd() .. '/a.out'--[[function()
						return vim.fn.input('Path to executable: ',
								vim.fn.getcwd() .. '/', 'file')
					end--]],
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},
		},
  }

-- Hydra Submodes
	--middlemouse free-scrolling
  local Scrollmode = require('hydra')
  Scrollmode({
    name = 'FREESCROLL',
    --hint = [[]],
    mode = 'n',
    config = {
		color = 'pink',
			hint = {
				type = 'statusline',
			},
	  invoke_on_body = true,
      on_key = function()
      end,
      on_enter = function()
        vim.o.wrap = false
				vim.o.virtualedit = "all"
				vim.o.cul = false
				vim.o.guicursor = "a:ver25"
      end,
      on_exit = function()
        -- No need to reset vim.o state, it will auto-reset
				-- only vim.opt needs to be reset
      end,
    },
    body = '<MiddleMouse>',
    heads = {
			{ '<esc>', ':set statusline=<CR>', {desc=false,exit=true,silent=true} },
			{ '<MiddleMouse>', '', {desc=false} },
			{ '<1-MiddleMouse>', '0', {desc=false} },
			{ '<2-MiddleMouse>', '0', {desc=false} },
			{ '<3-MiddleMouse>', '0', {desc=false} },
			{ 'h', 'zhh', },
      { 'j', '<c-e>M' },
      { 'k', '<c-y>M' },
      { 'l', 'lzl' },
      { '<C-h>', '2zh2h', {desc=false} },
      { '<C-j>', '2<c-e>M', {desc=false} },
      { '<C-k>', '2<c-y>M', {desc=false} },
      { '<C-l>', '2l2zl', {desc=false} },
      { '<ScrollWheelLeft>', '4zh4h' },
      { '<ScrollWheelDown>', '2<c-e>M' },
      { '<ScrollWheelUp>', '2<c-y>M' },
      { '<ScrollWheelRight>', '4l4zl' },
			{ '<C-ScrollWheelLeft>', '2zh2h', {desc=false} },
      { '<C-ScrollWheelDown>', '<c-e>M', {desc=false} },
      { '<C-ScrollWheelUp>', '<c-y>M', {desc=false} },
      { '<C-ScrollWheelRight>', '2l2zl', {desc=false} },
    }
  })
	--debugging functions
  local Debugmode = require('hydra')
  Scrollmode({
    name = 'DEBUG',
    --hint = [[]],
    mode = 'n',
    config = {
			color = 'pink',
			hint = {
				type = 'statusline',
			},
			buffer = nil,
			invoke_on_body = true,
      on_key = function()
					end,
      on_enter = function()
						--vim.o.signcolumn = 'yes'
						vim.o.cmdheight = 0
					end,
      on_exit = function()
						-- No need to reset vim.o state, it will auto-reset
						-- only vim.opt needs to be reset
					end,
    },
    body = '<C-d>',
    heads = {
			{ '<esc>', ':set statusline=<CR>', {desc=false,exit=true,silent=true} },
			{ '<C-d>', '', {desc=false} },
			{ 'b', ':DapToggleBreakpoint<CR>', {desc='break',silent=true,nowait=true} },
			{ 'c', ':DapClearBreakpoints<CR>', {desc='clear',silent=true,nowait=true} },
			{ 'R', ':make debug<CR>', {desc='compile',silent=true,nowait=true} },
			{ 'r', ':DapContinue<CR>', {desc='run',silent=true,nowait=true} },
			{ 't', ':DapTerminate<CR>', {desc='terminate',silent=true,nowait=true} },
			{ '<S-j>', ':DapStepInto<CR>', {desc='step',silent=true,nowait=true} },
			--{ '<S-h>', ':DapStepOut<CR>', {desc='out',silent=true,nowait=true} },
			{ '<S-l>', ':DapStepOver<CR>', {desc='over',silent=true,nowait=true} },
			{ '<space>', function() require('dap.ui.widgets').hover() end, {desc='hover',silent=true,nowait=true} },
			{ 'q', function() require('dap').repl.open() end, {desc='repl',silent=true,nowait=true} },
			{ 'p', function() require('dap.ui.widgets').preview() end, {desc='preview',silent=true,nowait=true} },
			{ 'f', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames)end, {desc='frame',silent=true,nowait=true} },
			{ 's', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, {desc='scope',silent=true,nowait=true} },
    }
  })

-- Autosession
  require("auto-session").setup {
    bypass_session_save_file_types = nil,
    cwd_change_handling = {
	  restore_upcoming_session = nil,
	  pre_cwd_changed_hook = nil,
	  post_cwd_changed_hook = nil,
	},
  }

-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.abort(),
      ['<C-i>'] = cmp.mapping.confirm({ select = true }),
	  }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
 -- cmp.setup.cmdline({ '/', '?' }, {
   -- mapping = cmp.mapping.preset.cmdline(),
   -- sources = {
     -- { name = 'buffer' }
    --}
  --})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline(':', {
    --mapping = cmp.mapping.preset.cmdline(),
    --sources = cmp.config.sources({
      --{ name = 'path' }
--    }, {
  --    { name = 'cmdline' }
    --})
--  })

	-- Set up lspconfig.
	-- Mappings.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
	
  -- See `:help vim.diagnostic.*`
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<space>p', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<space>n', vim.diagnostic.goto_next, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
		--Disable semantic tokens for highlights
		--client.server_capabilities.semanticTokensProvider = nil

		-- Enable completion triggered by <c-x><c-o>

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap=true, silent=true, buffer=bufnr }
		vim.keymap.set("n", "gD", "<cmd>tab split | lua vim.lsp.buf.declaration()<CR>", bufopts)
		vim.keymap.set("n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", bufopts)
		vim.keymap.set("n", "gi", "<cmd>tab split | lua vim.lsp.buf.implementation()<CR>", bufopts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
		vim.keymap.set("n", "gt", "<cmd>tab split | lua vim.lsp.buf.type_definition()<CR>", bufopts)
		--vim.keymap.set("n", "<A-g>D", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
		--vim.keymap.set("n", "<A-g>d", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
		--vim.keymap.set("n", "<A-g>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
		--vim.keymap.set("n", "<A-g>r", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
		--vim.keymap.set("n", "<A-g>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", bufopts)
		vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', '<space>j', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set('n', '<space>w', vim.lsp.buf.rename, bufopts)
  end

  vim.diagnostic.config {
	virtual_text = false,
	signs = false,
	}

  local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
  }

  require'lspconfig'.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
		cmd = {
			"clangd",
			"--completion-style=detailed",
			"--clang-tidy",
			"--header-insertion=never",
			"--function-arg-placeholders=0",
		},
  }


EOF
