set nocompatible

filetype off
syntax on 
let mapleader = ","
set rtp+=~/.vim/bundle/Vundle.vim
set clipboard=unnamed
set pastetoggle=<F2>
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'PotatoesMaster/i3-vim-syntax.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/vim-easy-align'
""Plugin 'davidhalter/jedi-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
"Plugin 'cjrh/vim-conda'
Plugin 'xuhdev/vim-latex-live-preview'
""Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin indent on
filetype plugin on
set number
set relativenumber
"set so=10
"set path+=**
"""Algin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"""python zeug
autocmd FileType python nnoremap <F9> :w<Cr> :exec '!python' shellescape(@%, 1) <Cr>
set wildmenu
let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_python_binary_path = '/usr/bin/python3'
let python_highlight_all=1
let g:syntastic_python_checkers = ['flake8']
""" YCM nur für python
let g:ycm_filetype_whitelist = {'python' : 1,'fortran' : 1}
""Sortieren
autocmd FileType python vnoremap <Leader>s :sort<CR>
""Synastic
set statusline+=%#warningmsg#
"""set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F
set laststatus=2
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""BASIC TOOLS
noremap <Leader>q @
:command WQ wq
:command Wq wq
:command W w
"""Fortran
autocmd FileType fortran inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType fortran inoremap <Leader>sub subroutine (<++>)<Cr>implicit none<CR><++><Cr>end subroutine<Esc>3k^fea 
autocmd FileType fortran xmap <Leader>a ga<C-x>::<Cr> 
autocmd FileType fortran nnoremap <Leader>k gg=G :%s/ real/ REAL/g <CR> :%s/ do/ DO/g<CR> :%s/kind/KIND/g<CR> :%s/ end/ END/g<CR> :%s/ if/ IF/g<CR> :%s/dimension/DIMENSION/g<CR> :%s/integer/INTEGER/g<CR> :%s/ subroutine/ SUBROUTINE/g<CR> :%s/module /MODULE /g<CR> :%s/implicit none/IMPLICIT NONE/g<CR> :%s/ else/ ELSE/g<CR> :%s/ then/ THEN/g<CR> :%s/ function/ FUNCTION/g<CR> :%s/ use/ USE/g<CR>:%s/intent(in)/INTENT(IN)/g<CR> :%s/intent(out)/INTENT(OUT)/g<CR> 
autocmd FileType fortran setlocal shiftwidth=2 tabstop=2 cindent expandtab
autocmd FileType fortran setlocal ignorecase
autocmd FileType fortran setlocal colorcolumn=132

let fortran_free_source=1
let fortran_do_enddo=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""LATEX
"For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
autocmd FileType tex inoremap jw <Esc>
autocmd FileType tex inoremap wj <Esc>
autocmd FileType tex inoremap <C-l> <Space><Space>
autocmd FileType tex nnoremap  <F9> :LLPStartPreview <Cr>
"""END
""" Latex-Preview
let g:tex_flavor = 'tex'
let g:livepreview_previewer ='zathura'
""" MArkdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
"Navigating with guides
autocmd FileType tex inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType tex vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType tex map <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;gui <++>
autocmd FileType tex inoremap <Leader>fra \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap <Leader>fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FIletype tex inoremap <Leader>eq <Cr>\begin{equation*} <Enter><Enter> \end{equation*}<Enter><C-o>0<++><Esc>2kA
autocmd FIletype tex inoremap <Leader>eqn \begin{equation} <Enter><Enter> \end{equation}<Enter><C-o>0<++><Esc>2kA
autocmd FIletype tex inoremap <Leader>al \begin{align*} <Enter><Enter> \end{align*}<Enter><C-o>0<++><Esc>2kA
autocmd FIletype tex inoremap <Leader>aln \begin{align} <Enter><Enter> \end{align}<Enter><C-o>0<++><Esc>2kA
autocmd FileType tex inoremap <Leader>em \emph{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>it \textit{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>ct \textcite{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>cp \parencite{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap <Leader>x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap <Leader>enu \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <Leader>bem \begin{bem}<Enter><Enter>\end{bem}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <Leader>itm \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <Leader>li <Enter>\item<Space>
autocmd FileType tex inoremap <Leader>ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>tab <Cr>\begin{figure}[H]<Cr>\begin{center}<Cr>\begin{tabular}{}<Cr><++><Cr>\end{tabular}<Cr>\caption{<++>}<Cr>\end{center}<Cr>\end{figure}<Enter><++><Esc>6k$i
autocmd FileType tex inoremap <Leader>ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA<Esc>i
autocmd FileType tex inoremap <Leader>can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap <Leader>sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <Leader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <Leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <Leader>st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap <Leader>pro \prod_{}^{<++>}<Space><++><Esc>bbli 
autocmd FileType tex inoremap <Leader>^ ^{}<++><Esc>4hi
autocmd FileType tex inoremap <Leader>_ _{}<++><Esc>4hi
autocmd FileType tex inoremap <Leader>sum \sum_{}^{<++>}<Space><++><Esc>bbli 
autocmd FileType tex inoremap <Leader>pic <Cr>\begin{figure}[H]<Cr> \includegraphics[width=\textwidth]{}<Cr>\caption{<++>}<Enter>\end{figure} <Enter><Enter> <++><Esc>4k$i
autocmd FileType tex inoremap <Leader>int \int_{}^{<++>}<Space><++><Esc>bbli 
autocmd FileType tex inoremap <Leader>frc \frac{}{<++>}<Space><++><Esc>bbli 
autocmd FileType tex inoremap <Leader>beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"""END


"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

colorscheme default

let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"Spell-check set to F6
map <F6> :setlocal spell spelllang=de_20<Cr>
"map <F10> :Goyo<CR>
