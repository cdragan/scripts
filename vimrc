" Make sure english language is used
if (has("win32") || has("win64"))
    language en
endif
set langmenu=en
menutranslate clear

" Default Vim settings
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
syntax on

" Initial settings
if (has("win32") || has("win64"))
    set gfn=Courier_New:h10:cEASTEUROPE
elseif has("gui_kde")
    set guifont=Courier\ New/13/-1/5/50/0/0/0/0/0
else
    set guifont=Courier\ New\ 13
endif
if has('mac') && has('gui_running')
    set transparency=10
    " Fonts from https://github.com/powerline/fonts/tree/master/Meslo%20Dotted
    set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h13
    let g:airline_powerline_fonts=1
endif
colorscheme desert
set showcmd
set tabstop=8
set softtabstop=4
set shiftwidth=4
set guioptions+=b
set nowrap
set nonumber
set virtualedit=all
set display=lastline
set viminfo='20,<50,s10,h,rA:,rB:,%
set nobackup
set autowrite
set autoindent
set backspace=2
set ruler
if has("persistent_undo")
    set noundofile
endif
if version >= 800
    set scrolloff=0
endif

" Line numbers
let g:ChrisShowLineNumbers = 0
let g:gitgutter_signs = 0
function! UpdateLineNumbers()
    if g:ChrisShowLineNumbers && ( bufname('%') != '-MiniBufExplorer-' )
        set number
        set relativenumber
        set nowrap
        if exists("g:gitgutter_enabled")
            call gitgutter#sign#enable()
        endif
    else
        set nonumber
        set norelativenumber
        set wrap
        if exists("g:gitgutter_enabled")
            call gitgutter#sign#disable()
        endif
    endif
endfunction
function! ToggleLineNumbers()
    let g:ChrisShowLineNumbers = ! g:ChrisShowLineNumbers
    call UpdateLineNumbers()
endfunction
call ToggleLineNumbers()
function! ShowRelativeLineNumbers()
    call UpdateLineNumbers()
    if g:ChrisShowLineNumbers && ( bufname('%') != '-MiniBufExplorer-' )
        set relativenumber
    endif
endfunction
function! HideRelativeLineNumbers()
    call UpdateLineNumbers()
    set norelativenumber
endfunction
augroup RelativeNumberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * call ShowRelativeLineNumbers()
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * call HideRelativeLineNumbers()
augroup END

" Enable X mouse in xterm
if &term[:4] == "xterm" || &term[:5] == "screen"
    set mouse=
endif

" My own colors
hi Comment   ctermfg=2 gui=Italic
hi LineNr    guifg=White guibg=grey30

" Highlight useless trailing spaces
syn match InvalidEOL /\s*$/
hi link InvalidEOL Error

" MiniBufExplorer settings
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>
let loaded_minibufexplorer = 1 " disable for now, use vim-airline instead

" vim-airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#overflow_marker = '…'

" git-gutter
hi SignColumn            guibg=grey30
hi GitGutterAdd          guibg=grey30 guifg=YellowGreen
hi GitGutterChange       guibg=grey30 guifg=SkyBlue
hi GitGutterDelete       guibg=grey30 guifg=#FFA0A0
hi GitGutterChangeDelete guibg=grey30 guifg=#FFA0A0

" Home and End in MacOSX Terminal.app
map <ESC>[H <Home>
imap <ESC>[H <C-O><Home>
cmap <ESC>[H <Home>
map <ESC>[F <End>
imap <ESC>[F <C-O><End>
cmap <ESC>[F <End>

" Ctrl+R - Go to last modification
nmap <silent> <C-R>      `.
imap <silent> <C-R> <C-O>`.

" F3 - Hide search highlight
nmap <silent> <F3>      :noh<CR>
imap <silent> <F3> <C-O>:noh<CR>
vmap <silent> <F3> :<C-U>noh<CR>gv

" F4 is mapped to CreamShowInvisibles

" F5 - Toggle line numbers and wrapping
nmap <silent> <F5>      :call ToggleLineNumbers()<CR>
imap <silent> <F5> <C-O>:call ToggleLineNumbers()<CR><C-O>
vmap <silent> <F5> :<C-U>call ToggleLineNumbers()<CR>

" F6 - toggle folding
nmap <F6> zi
imap <F6> <C-O>zi

" F7 - global identifier search
nmap <silent> <F7>        [I
nmap <silent> <C-F7>      [<C-I>
nmap <silent> <S-F7>      [<C-I>
imap <silent> <F7>   <C-O>[I
imap <silent> <C-F7> <C-O>[<C-I>
imap <silent> <S-F7> <C-O>[<C-I>

" F8 - toggle tag list
nmap <silent> <F8>      :Tlist<CR>
imap <silent> <F8> <C-O>:Tlist<CR>
vmap <silent> <F8> :<C-U>Tlist<CR>

" Recording and playing macros
nmap <C-F12> qm
imap <C-F12> <Esc>qm
nmap <F12> @m
imap <F12> <Esc>@m

" Ctrl+Y - Delete line
nmap <C-Y> dd
imap <C-Y> <C-O>dd

" Forward (tags) with Ctrl+Enter
nmap <C-CR> <C-]>
imap <C-CR> <C-O><C-]>

" Backwards (tags) with Ctrl+Backspace
nmap <C-BS> <C-T>
imap <C-BS> <C-O><C-T>

" Increment/decrement with +/-
nnoremap + <C-A>
nnoremap - <C-X>

" Show marks settings
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.""
set updatetime=250

" Folds
set foldmethod=indent
set foldopen=all
set foldclose=all
set foldnestmax=1
set nofoldenable

" Additional Python syntax higlight
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_indent_errors = 0
let python_highlight_doctests = 1
let python_slow_sync = 1

" Detect shader types
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.vsh,*.fsh setf glsl

" Always expand tabs by default
set et

" Allow tabs in certain temporary files
autocmd BufNewFile,BufRead *.[0-9],*.[0-9][0-9],*.[0-9][0-9][0-9] set sw=8 sts=0 noet

" Highlight tails of lines which are over 100 characters long
highlight OverLength guibg=OrangeRed ctermbg=darkred
match OverLength /\%101v.*/

" Recognize md files as markdown, instead of Modula-2
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Vulkan syntax highlighting
autocmd FileType cpp,c source ~/.vim/syntax/vulkan1.0.vim

" Syntax highlighting for Kos sources
autocmd FileType cpp,c source ~/.vim/syntax/kos_c.vim

" Workaround annoying vim feature to force editing last file before exiting
autocmd QuitPre * blast
