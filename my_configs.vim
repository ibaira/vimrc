" My custom configuration

" YouCompleteMe plugin
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
" Collision with commenter
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

" FZF and RigGrep
nnoremap <silent> <leader>f :Files<CR>
" Git status
nnoremap <silent> <leader>gs :GFiles?<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <C-b> :Buffers<CR>
" Ripgrep search
nnoremap <C-f> :Rg! 
set rtp+=~/.fzf

set termguicolors
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.95 } }
" We use BAT to colorize the preview when using FZF
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" Pylint
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {'python': ['flake8', 'pylint']}
let b:ale_fixers = {'python': ['black', 'isort', 'autopep8', 'yapf', 'trim_whitespace']}
let g:ale_warn_about_trailing_whitespace = 1

" GitGutter not by default
let g:gitgutter_enabled = 0

" General view 
set cursorline
set cursorcolumn
hi CursorLine term=bold cterm=bold guibg=#212536
hi CursorColumn term=bold cterm=bold guibg=#212536

" Toggle relative line numbers
nnoremap <leader>r :set relativenumber!<CR>

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

" Keybinding to resize nerdtree window                                                                                                                 
" resize horzontal split window
nmap <C-Down> <C-W>-<C-W>-
nmap <C-Up> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Right> <C-W>><C-W>>
nmap <C-Left> <C-W><<C-W><

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
let g:indentLine_char_list = ['·']  "['┊', '¦', '┆'] https://en.wikipedia.org/wiki/Interpunct

" fix f-string syntax error in Python
let g:pymode_python = 'python3'
nnoremap <F6> :set foldmethod=indent<CR>:set foldlevel=99<CR>

" Vim-go config
" Automatic autocomplete suggestion
function! OpenCompletion()
    call feedkeys("\<C-x>\<C-o>", "n")
endfunction
au BufReadPost,BufNewFile *.go | autocmd InsertCharPre * call OpenCompletion()
au BufReadPost,BufNewFile *.cs | autocmd InsertCharPre * call OpenCompletion()

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
let g:go_metalinter_autosave_enabled=['golint', 'govet']

" NERDTree
map <leader>n :NERDTreeToggle<cr>
"" Automatic NERDTree mirroring on tab switching
" when having just one window in the tab
function MirrorNerdTreeIfOneWindow()
    if winnr("$") < 2
        NERDTreeMirror
        " hack to move the focus from the NERDTree to the main window
        wincmd p
        wincmd l
    endif
endfunction

autocmd TabEnter * silent exe MirrorNerdTreeIfOneWindow()

" Close tab
nnoremap <C-c> :tabclose<CR>

" Omnisharp C#
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_showid = 1
" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!
  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
  " Autoformatting upon saving
  autocmd BufWritePost *.cs call OmniSharp#actions#format#Format()

augroup END

" Lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>
let g:lazygit_floating_window_scaling_factor = 1.0
