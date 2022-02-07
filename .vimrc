call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }
Plug 'yaegassy/coc-volar', { 'do': 'yarn install --frozen-lockfile' }
Plug 'posva/vim-vue'

Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

call plug#end()

set number
set smartindent
set mouse=a
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set ruler
syntax on
filetype plugin indent on

let g:coc_global_extensions = [ 'coc-tsserver' ]
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(cocimplementation)
nmap <silent>gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent>fo :Files<CR>
nmap <silent>ff :Rg<CR>
nmap <silent>fb :Buffers<CR>
nmap <silent>ts :tab split<CR>
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor\,sm:block-blinkwait175-blinkoff150-blinkon175

" https://github.com/neoclide/coc.nvim/issues/869#issuecomment-501323697
nnoremap <silent>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight') 

function! SyntaxItem()
  return synIDattr(synID(line("."),col(".")1),"name")
endfunction

function GetClock()
  return strftime('%H:%M')
endfunction

set termguicolors
colorscheme gruvbox


set noshowmode
hi CocFloating guibg=#232530
hi Statement gui=NONE

"let s:palette = g:lightline#colorscheme#horizon#palette
"let s:palette.tabline.left = [['#6c6f93', '#1c1e26', 242, 233]]
"let s:palette.tabline.tabsel = [['#09f7a0', '2e303e', 209, 235, 'bold']]

" call timer_start(1000, {->execute('redrawstatus')}, {'repeat': -1})

" Go to last active tab

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent>gb :exe "tabn ".g:lasttab<cr>
vnoremap <silent>gb :exe "tabn ".g:lasttab<cr>

" force load of context/commentstring.vim and set vue_typescript
:runtime autoload/context/commentstring.vim
let g:context#commentstring#table['vue']['vue_typescript'] = '// %s'

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>",
