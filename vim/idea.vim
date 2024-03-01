set multiple-cursors
set NERDTree
set ideajoin

" set easymotion
" nmap s <Plug>(easymotion-s2)

set which-key
" timeout duration for a mapped key sequence
set timeoutlen=8000

" https://github.com/adelarsq/vim-matchit/blob/master/doc/matchit.txt
" set matchit

" message on the status line to show current mode
set showmode

" creation of global mark will trigger creation of IDE's bookmark and vice versa.
set ideamarks

" <count>ai         (A)n (I)ndentation level and line above.
" <count>ii         (I)nner (I)ndentation level (no line above).
" <count>aI         (A)n (I)ndentation level and lines above/below.
" <count>iI         (I)nner (I)ndentation level (no lines above/below).
set textobj-indent

" highlight unique chars after pressing f, F, t or T
set quickscope

set highlightedyank
" let g:highlightedyank_highlight_duration = "1000"
" let g:highlightedyank_highlight_color = "rgba(160, 160, 160, 155)"

" https://github.com/tpope/vim-surround/blob/master/doc/surround.txt
" Old text                  Command     New text ~
" "Hello *world!"           ds"         Hello world!
" [123+4*56]/2              cs])        (123+456)/2
" "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
" if *x>3 {                 ysW(        if ( x>3 ) {
" my $str = *whee!;         vllllS'     my $str = 'whee!';
set surround

set argtextobj
let g:argtextobj_pairs="(:),{:},<:>,[:]"

" gr{motion}
set ReplaceWithRegister

" cx{motion}
set exchange

" s{char}{char} to sneak forward and S{char}{char} to sneak backward
Plug 'justinmk/vim-sneak'

" Normally the { and } motions only match completely empty lines. With this plugin lines that only contain whitespace are also matched.
set vim-paragraph-motion

nnoremap <space>r :action GotoRelated<CR>
nnoremap <space>a :action GotoAction<CR>
nnoremap <space>s :action SearchEverywhere<CR>
nnoremap <space>d :action JumpToLastChange<CR>
nnoremap <space>l :action RecentLocations<CR>
nnoremap <space>e :action RecentChangedFiles<CR>
nnoremap <lt> :action VcsShowPrevChangeMarker<CR>
nnoremap > :action VcsShowNextChangeMarker<CR>

noremap <leader>w [w
noremap <leader>b [b
noremap <leader>e ]w

nnoremap <leader>f :action ReformatCode<CR>
nnoremap <leader>r :action RenameElement<CR>
vnoremap <leader>s :action SurroundWithLiveTemplate<CR>
vnoremap <leader>m :action ExtractMethod<CR>
nnoremap <leader>; :action EditorCompleteStatement<CR>

nnoremap \w :action EditorToggleUseSoftWraps<CR>
nnoremap \B :action ToggleBookmark<CR>
nnoremap \b :action ToggleLineBreakpoint<CR>
nnoremap \a :action HideAllWindows<CR>

nnoremap gd :action GotoDeclaration<CR>
nnoremap gi :action GotoImplementation<CR>
nnoremap gt :action GotoTypeDeclaration<CR>
nnoremap g/ :action LocateInSolutionView<CR>:action SelectInProjectView<CR>
noremap <BS>j :action EditorCodeBlockEnd<CR>
noremap <BS>k :action EditorCodeBlockStart<CR>

nnoremap <BS>a :action CloseAllEditorsButActive<CR>
nnoremap <BS><BS> :action CloseAllEditors<CR>
nnoremap <BS>h :action CloseAllToTheLeft<CR>
nnoremap <BS>l :action CloseAllToTheRight<CR>

noremap <C-j> :action PreviousTab<CR>
noremap <C-k> :action NextTab<CR>
noremap <C-h> :action CloseContent<CR>
