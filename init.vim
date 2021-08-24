" Use Vim not Vi!
set nocompatible

syntax on 		" highlight syntax
set number		" show line numbers
set noswapfile		" disable the swapfile
set hlsearch		" highlight all results
set ignorecase		" ignore case in search
set incsearch		" show search results as you type

let mapleader = "'"	" Set the leader keybind 
" inoremap jk <ESC>

call plug#begin()	" Install some cool plugins to play around with. Prefix with 'github.com/' to see repo
	Plug 'preservim/nerdtree'	" For a filetree
	Plug 'vim-airline/vim-airline'	" For a cool statusbar
	Plug 'vim-airline/vim-airline-themes'	" For the airline themes
	Plug 'lervag/vimtex'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }	" For autocomplete stuff
	Plug 'SirVer/ultisnips'		" For code snippets
	Plug 'honza/vim-snippets'	" Actual snippets. Only engine is above
	Plug 'davidhalter/jedi-vim'	" Python vim autocompletion library
	Plug 'neomake/neomake'		" Syntax for Latex
call plug#end()

" Some NerdTree stuff
nnoremap <leader>n :NERDTreeFocus<CR>
"autocmd VimEnter * NERDTree | wincmd p	" Start NERDTree and put the cursor back in the other window.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " Exit Vim if NERDTree is the only window remaining in the only tab.

" Some Airline stuff
let g:airline_theme='papercolor'	" Set the theme. 'sol' is also really nice
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Get VimTex working all good
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" Start deoplete
let g:deoplete#enable_at_startup = 1		" Enable deoplete
let g:UltiSnipsExpandTrigger="<tab>"		" Set keybind for autocomplete

" Neomake for latex. Some syntak things
call neomake#configure#automake('nw', 1000)






