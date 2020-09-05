" My custom configuration

" YouCompleteMe plugin
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
" nnoremap gc :YcmCompleter GoToDeclaration<CR>
" nnoremap gd :YcmCompleter GoToDefinition<CR>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "sh":1,
			\ "python":1,
			\ }
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_complete_in_comments=1
" let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

set completeopt-=preview
set completeopt+=longest,menuone,noselect
set rtp+=~/.vim/bundle/YouCompleteMe

" Pylint
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {'python': ['flake8', 'pylint']}
let b:ale_fixers = {'python': ['black', 'isort', 'autopep8', 'yapf', 'trim_whitespace']}
let g:ale_warn_about_trailing_whitespace = 1

" General view 
set cursorline
hi CursorLine term=bold cterm=bold guibg=#212536
hi CursorColumn term=bold cterm=bold guibg=#212536
" set cursorcolumn

" Smoother scrolling
nnoremap <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
nnoremap <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
 
" Remove hightlight by pressing escape twice
nnoremap <esc><esc> :noh<return>

" Move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv  

" Vim-commentary remap to Ctrl+m
nmap <C-m> gccj
vmap <C-m> gcc<Esc>gv

" Try speed up rendering
set lazyredraw
set ttyfast

" Default folding method to indent for Python
setlocal foldmethod=indent
setlocal foldlevelstart=99
set foldcolumn=0

" Presentation mode
noremap <Left> :silent bp<CR>:redraw!<CR>
noremap <Right> :silent bn<CR>:redraw!<CR>
nmap <F5> :set noshowcmd noshowmode shortmess+=F<CR>:Goyo<CR>

" Indent character
let g:indentLine_char_list = ['·']  "⚫ ['┊']  |', '¦', '┆', '┊'] https://en.wikipedia.org/wiki/Interpunct

" fix f-string syntax error in Python
let g:pymode_python = 'python3'
nnoremap <F6> :set foldmethod=indent<CR>:set foldlevel=99<CR>

" Vim-go config
" Automatic autocomplete suggestion
function! OpenCompletion()
    " if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
        call feedkeys("\<C-x>\<C-o>", "n")
    " endif
endfunction
au BufReadPost,BufNewFile *.go | autocmd InsertCharPre * call OpenCompletion()

" let g:go_auto_sameids = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
" let g:go_fmt_experimental = 1
" let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']
