set ignorecase
set smartcase
set incsearch
set nowrapscan
set gdefault

let mapleader=','
noremap <leader><leader> ,

" make going to start of indented text easier
noremap 0 ^
noremap ^ 0

" Usually Y is equivalent to yy, so make it more useful and behave like D or C
nmap Y y$

noremap <BS>y "+yz
noremap <BS>Y "+Yz
noremap <BS>p "+p
noremap <BS>P "+P

noremap <space>y "+y
noremap <space>Y "+Y
noremap <space>p "+p
noremap <space>P "+P

" fast word search
nnoremap <leader>n "zyiw/<C-r>z<CR>N
vnoremap <leader>n "zy/<C-r>z<CR>N

" easier word based macros
nnoremap <leader>q "zyiw/<C-r>z<CR>Nqj
vnoremap <leader>q "zy/<C-r>z<CR>Nqj
nnoremap M @j

let g:EasyMotion_do_mapping = 0
