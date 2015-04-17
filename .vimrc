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
