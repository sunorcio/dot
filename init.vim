:colorscheme habamax
:highlight Normal ctermfg=151 ctermbg=16
:highlight Special ctermfg=121 ctermbg=16
:highlight Type ctermfg=65
:highlight Identifier ctermfg=181
:highlight Constant ctermfg=173
:highlight String ctermfg=107
:highlight MatchParen cterm=NONE
:highlight StatusLine ctermfg=68 ctermbg=232
:highlight MsgArea ctermfg=255 ctermbg=233
:highlight WinSeparator ctermbg=0 ctermfg=68
:highlight StatusLineNC ctermbg=232 ctermfg=238
:highlight TabLineFill ctermbg=232
:highlight TabLineSel ctermbg=0 ctermfg=68 cterm=NONE
:highlight TabLine ctermbg=232 ctermfg=238
:autocmd VimEnter * syntax off

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

:nnoremap <Right>		zl
:nnoremap <Down>		<C-e>
:nnoremap <Left>		zh
:nnoremap <Up>			<C-y>
:nnoremap <C-Right>		2zl
:nnoremap <C-Down>		2<C-e>
:nnoremap <C-Left>		2zh
:nnoremap <C-Up>		2<C-y>

:cnoremap <C-f> <Right>
:cnoremap <C-b> <Left>
:inoremap <C-b> <left>
:inoremap <C-f> <right>
:noremap  <C-b> 20<C-e>
:noremap  <C-f> 20<C-y>

:noremap <S-A-j> :vsplit<CR><C-w>w
:noremap <S-A-l> :tabnew<CR>
:noremap <S-j>	<C-w>w
:noremap <S-k>	<C-w>p
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

:vnoremap / "qy/<C-R>q<CR>N
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

:noremap s "_s
:vnoremap S :s/
:vnoremap <c-s> :s/<c-r>+/
:nnoremap S :%s/
:nnoremap <c-s> :%s/<c-r>+/
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

:vnoremap \ <C-v>077lA\<esc>
:vnoremap p P
:vnoremap P p
:vnoremap <C-p>   "cs/*  */<left><left><left><c-r>c<esc>
:vnoremap <C-A-p> V>gvc<space><BS>}<esc>POint i;<CR>for(i = 0;i<0;i++){<esc>
:vnoremap <S-A-p> V>gvc<space><BS>}<esc>POif(){<left><left>
:nnoremap <C-A-p> A<CR>switch(<esc>pa){<CR>}<up><end><CR>break;<up><end><CR>:<left>case<space>
:nnoremap <S-A-p> A<CR>if(<esc>pa){<CR>}<up><end><CR>

:nnoremap <silent> <esc> <esc>:noh<CR>

:noremap <silent> <A-?> :Inspect<CR>


"pluginstall:
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

-- Set up nvim-treesitter.
	require'nvim-treesitter.configs'.setup {
	  -- A list of parser names, or "all" (the five listed parsers should always be installed)
	  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "make", "glsl", "bash" },

	  -- Install parsers synchronously (only applied to `ensure_installed`)
	  sync_install = false,

	  -- Automatically install missing parsers when entering buffer
	  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	  auto_install = true,

	  highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
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
  client.server_capabilities.semanticTokensProvider = nil
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
		"--completion-style=detailed",
		"--clang-tidy",
		"--header-insertion=never",
		"--function-arg-placeholders=0",
	},
  }


EOF



