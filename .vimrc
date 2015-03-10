set nu
set hlsearch
colorscheme torte
set smartcase
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1
let g:ConqueTerm_Color=2
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

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
