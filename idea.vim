set surround
set multiple-cursors
set argtextobj
set ReplaceWithRegister
set exchange
set highlightedyank
set easymotion
set showmode
set NERDTree
set ideajoin
set ideamarks
set textobj-indent
set quickscope

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

inoremap <C-.> <space>=><space>

nmap s <Plug>(easymotion-s2)

let g:argtextobj_pairs="(:),{:},<:>"
