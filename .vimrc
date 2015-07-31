let &runtimepath.='p:\\_vim'
execute pathogen#infect()
set nu
set hlsearch
colorscheme torte
syntax on
set smartcase
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set laststatus=2
let g:ConqueTerm_Color=2
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap \n :NERDTree <CR>
"delete trailing white space
nmap \r %s/\s\+$//g <CR>
filetype plugin indent on

"the following will make tab 4 space wide but no convert tab to space
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"the following line will convert tab to spaces
"set expandtab

"diff between two current buffers on split
":windo diffthis and :windo diffoff


"diff current buffer and file on disk
"diff with command :DiffSaved, quit with command :diffoff
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"to turn off automatic newline to adjust to textwidth :set formatoptions-=tc,
"for help look at :help formatoptions
"

"vim airline configuration
let g:airline_theme = 'powerlineish'
let g:airline#extentions#hunks#enabled=0
let g:airline#extentions#branch#enabled=0

"automatic toggle relative line number
au FocusLost * :set number
au FocusGained * :set relativenumber

"Function to delete trailing spaces
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <leader>r :call DeleteTrailingWS()<CR>

"shortcut for tag bar toggling
nmap \g :TagbarToggle <CR>

"for vim-easymotion
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

"for vim-indent-guide custom color, it won't work with torte colorscheme
"anyway
"Keyboard shortcut: \ig
let g:indent_guides_start_level = 2
let g:indent_guides_size = 1
let g:indent_guides_indent_levels = 30
let g:indent_guides_auto_colors = 1

"shortcut for vim surround
"Select then add braces: S[
"Select then add html tag arround: S<div>
"Delete surrounding braces: ds[
"Delete the nearest surrounding tag: dst


"set the font
"font is in worksetup/fonts
if has("win32") || has("win16")
	set guifont=Source_Code_Pro:h11:cANSI
else
	set guifont=Source\ Code\ Pro\ Medium\ 11
endif

"add the vertical line to show the tab indentation
:set list lcs=tab:\|\ 

"to move a code block up and down
"Alt-j and Alt-k

"to move the screen without moving the cursor
"Ctrl-j and Ctrl-k
