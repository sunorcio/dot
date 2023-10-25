:colorscheme habamax
:highlight Normal ctermfg=121 ctermbg=16
:highlight StatusLine ctermfg=68 ctermbg=232
:highlight MsgArea ctermfg=255 ctermbg=233
:highlight Identifier ctermfg=181
:highlight Constant ctermfg=178
:highlight Type ctermfg=65
:highlight String ctermfg=106

:set nowrap
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
:set makeprg=clang
:set guicursor=i-ci-ve:ver25

:set cul
:set culopt=number
:autocmd InsertEnter * set culopt=line
:autocmd InsertLeave * set culopt=number

:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>

:noremap <A-Right>		<C-w><Right>
:noremap <A-Down>		<C-w><Down>
:noremap <A-Left>		<C-w><Left>
:noremap <A-Up>			<C-w><Up>

:noremap <C-A-Right>	<C-w><C-v>
:noremap <C-A-Down>		<C-w><C-s>
:noremap <C-A-Left>		<C-w><C-v><C-w><Right>
:noremap <C-A-Up>		<C-w><C-s><C-w><Down>

:noremap <S-A-Right>	<C-w>2<C->>
:noremap <S-A-Down>		<C-w><C-+>
:noremap <S-A-Left>		<C-w>2<C-<>
:noremap <S-A-Up>		<C-w><C-->

:noremap <C-S-Right>	<C-w><S-l>
:noremap <C-S-Down> 	<C-w><S-j>
:noremap <C-S-Left>		<C-w><S-h>
:noremap <C-S-Up>		<C-w><S-k>

:noremap =		<S-j>
:noremap _		-
:noremap -		<S-k>
:noremap <S-j>	20jzz
:noremap <S-k>	20kzz
:noremap <S-l>	e
:noremap <S-h>	b

:noremap <C-j>	2jzz
:noremap <C-k>	2kzz
:noremap <C-l>	$
:noremap <C-h>	0
:vnoremap <C-l>	$h

:noremap f n
:noremap b N
:noremap B ge
:noremap F w
:noremap w b
:noremap W B

:vnoremap / "ay/<C-R>a<CR>N
:noremap ? f
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

:noremap s "_s
:vnoremap S :s/
:nnoremap S :%s/
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
:vnoremap D" "bs""<esc>"bP
:vnoremap D' "bs''<esc>"bP
:vnoremap D( "bs()<esc>"bP
:vnoremap D) "bs()<esc>"bP
:vnoremap D[ "bs[]<esc>"bP
:vnoremap D] "bs[]<esc>"bP
:vnoremap D{ "bs{}<esc>"bP
:vnoremap D} "bs{}<esc>"bP

:noremap <A-v> gv

:inoremap <C-B> <left>
:inoremap <C-F> <right>
:noremap <C-B> <left>
:noremap <C-F> <right>

:vnoremap p P
:vnoremap <C-p> c*/<esc>Pi<CR><up>/*<esc>
:vnoremap <A-p> c/**/<esc><left><left>p
:vnoremap <C-A-p> >gvc<space><BS>}<esc>POfor(int i = 0;i<0;i++){<esc>
:vnoremap <S-A-p> >gvc<space><BS>}<esc>POif(){<left><left>
:nnoremap <C-A-p> A<CR>switch(<esc>pa){<CR>}<up><end><CR>break;<up><end><CR>:<left>case<space>
:nnoremap <S-A-p> A<CR>if(<esc>pa){<CR>}<up><end><CR>

:nnoremap <silent> <esc> <esc>:noh<CR>

:noremap <silent> <A-?> :Inspect<CR>


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
	Plug 'timtro/glslView-nvim'
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
      ['<CR>'] = cmp.mapping.abort(),
      ['<TAB>'] = cmp.mapping.confirm({ select = true }),
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
  vim.keymap.set('n', '<space>b', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<space>f', vim.diagnostic.goto_next, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>j', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>w', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
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
        "--cross-file-rename",
		"--completion-style=detailed",
		"--clang-tidy",
		"--header-insertion=never",
	},
  }


EOF

"pluginstall:
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
