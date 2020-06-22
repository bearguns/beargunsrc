let mapleader = " "
" Most important, "I can't Vim without these" settings go here:
"" Plugins because I'm a filthy casual:
if ! filereadable(system('echo -n "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $XDG_CONFIG_HOME/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_CONFIG_HOME/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "$XDG_CONFIG_HOME/nvim/plugged"'))
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'airblade/vim-rooter'
"Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ap/vim-css-color'
Plug '~/.vim/pack/themes/start/dracula_pro'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'editorconfig/editorconfig-vim'
Plug 'arkwright/vim-whiplash'
Plug 'Yggdroot/indentLine'
call plug#end()

" Don't automatically format the _next_ line as a comment:
set formatoptions-=cro

" Keybindings without which I cannot function:
"" quickly source nvim config:
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

"" ergonomic leader key:

"" quickly hit escape like a boss:
inoremap jk <esc>

"" moving between split windows:
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" The good stuff: the actual configuration
syntax on
colorscheme dracula_pro_van_helsing

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8

set colorcolumn=80
highlight ColorColumn guibg=gray ctermbg=gray

" More space for messages
set cmdheight=2

set updatetime=50
set shortmess+=c

let g:netrw_browse_split = 3
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:WhiplashProjectsDir = "~/projects/"

" Highlight indentation (really helpful for Ruby and YAML files)
let g:indentLine_setColors = 0
