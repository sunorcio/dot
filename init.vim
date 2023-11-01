:autocmd! BufNewFile,BufRead *.h set filetype=c

":set background=dark
:colorscheme habamax
:highlight Normal		ctermfg=195	ctermbg=16
:highlight Type			ctermfg=65
:highlight Identifier	ctermfg=181
:highlight PreProc		ctermfg=94
:highlight Constant		ctermfg=172
:highlight String		ctermfg=36
:highlight Statement	ctermfg=139
:highlight Special		ctermfg=153
:highlight MatchParen	ctermfg=195	ctermbg=236	cterm=NONE
:highlight MsgArea		ctermfg=255	ctermbg=233
:highlight WinSeparator	ctermfg=68	ctermbg=0
:highlight StatusLine	ctermfg=68	ctermbg=232
:highlight StatusLineNC	ctermfg=238	ctermbg=232
:highlight TabLineSel	ctermfg=68	ctermbg=0	cterm=NONE
:highlight TabLine		ctermfg=238	ctermbg=232
:highlight TabLineFill				ctermbg=232
":autocmd VimEnter * syntax off

:set wrap
:set sel=old
:set virtualedit=block
:set number
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set clipboard^=unnamed,unnamedplus
:set cmdheight=0
:set notitle
:set foldmethod=indent
:set foldlevel=1
:set foldnestmax=1
:set nofoldenable
:set noignorecase
:set guicursor=i-ci-ve:ver25

:set cul
:set culopt=number
:autocmd InsertEnter * set culopt=line
:autocmd InsertLeave * set culopt=number

:autocmd VimEnter * noremap <c-right> 2zl
:autocmd VimEnter * noremap <c-left> 2zh
":noremap <c-right>	2zl
":noremap <c-left>	2zh
:noremap <s-right>	:set nowrap<CR>:set virtualedit=all<CR>
:noremap <s-left>	:set wrap<CR>:set virtualedit=block<CR>
:noremap <right>	zl
:noremap <down>		<c-e>
:noremap <left>		zh
:noremap <up>		<c-y>
:noremap <c-down>	2<c-e>
:noremap <c-up>		2<c-y>

:cnoremap <C-b> <left>
:cnoremap <C-f> <right>
:inoremap <C-b> <left>
:inoremap <C-f> <right>
:noremap  <C-b> 20<c-y>
:noremap  <C-f> 20<c-e>

:noremap <S-A-j> <c-w>v<c-w>w:e .<CR>
:noremap <S-A-l> :tabnew<CR>:e .<CR>
:noremap <S-j>	<c-w>w
:noremap <S-k>	<c-w>p
:noremap <S-l>  :tabnext<CR>
:noremap <S-h>	:tabprevious<CR>
:noremap =		<S-j>
:noremap ?		<S-k>

:noremap  <C-j>	2jzz
:noremap  <C-k>	2kzz
:noremap  <C-l>	$
:noremap  <C-h>	0

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

:noremap ; :
:nnoremap : A;<esc>
:noremap q; q:

:vnoremap a A
:vnoremap i I

:vnoremap <TAB> >gv
:vnoremap <S-TAB> <gv
:nnoremap <TAB> >>
:nnoremap <S-TAB> <<

:vnoremap / "qy/\V<C-R>q<CR>N
:noremap s "_s
:vnoremap S :s/
:vnoremap <c-s> :s/\V<c-r>+/
:nnoremap S :%s/
:nnoremap <c-s> :%s/\V<c-r>+/
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
:noremap <A-v> gv

:vnoremap p P
:vnoremap P p
:inoremap <c-r>p <c-r>+
:vnoremap \ <C-v>077lA\<esc>
:vnoremap <C-p> "cs/*  */<left><left><left><c-r>c<esc>
:vnoremap <C-A-p> V>gvc<space><BS>}<esc>POint i;<CR>for(i = 0;i<0;i++){<esc>
:vnoremap <S-A-p> V>gvc<space><BS>}<esc>POif(){<left><left>
:nnoremap <C-A-p> A<CR>switch(<esc>pa){<CR>}<up><end><CR>break;<up><end><CR>:<left>case<space>
:nnoremap <S-A-p> A<CR>if(<esc>pa){<CR>}<up><end><CR>

:nnoremap <silent> <esc> <esc>:noh<CR>

:noremap <silent> <A-?> :Inspect<CR>


"pluginstall:
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	Plug 'tikhomirov/vim-glsl'
	set encoding=UTF-8

call plug#end()


set completeopt=menu,menuone,noselect

lua <<EOF


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
      ['<C-j>'] = cmp.mapping.abort(),
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
  local capabilities = require('cmp_nvim_lsp').default_capabilities()-- Mappings.
	
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
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
  vim.keymap.set("n", "gr", "<cmd>tab split | lua vim.lsp.buf.references()<CR>", bufopts)
  vim.keymap.set("n", "gt", "<cmd>tab split | lua vim.lsp.buf.type_definition()<CR>", bufopts)
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



