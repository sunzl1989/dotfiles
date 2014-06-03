set nocompatible
syntax on
set nospell
set number
set numberwidth=5

set nocursorcolumn
set nocursorline
set encoding=utf-8
set title
set shortmess=atI " don't sho intro messages
set report=0      " tell us about changes
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set textwidth=99

set ruler
set nowrap
set list
set listchars=tab:\ \ ,trail:·
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=vert:\ " empty is nicer on our term
set autowrite
set shiftround
set autoread
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set completeopt+=longest

set clipboard+=unnamed " Share your clipboard with system
set mouse=a            " Make mouse working!
set modeline
set modelines=10
set shell=/bin/sh

set wildmode=list:longest,list:full  " Tab completion
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/nimcache/*
set wildignore+=*.swp,*~,._*

set showcmd " Show (partial) command in the status line"
set showmode

set history=1000                      " Store lots of :cmdline history
set backupdir=~/.vim/tmp/backup/      " where to put backup files.
set directory=~/.vim/tmp/swap/        " where to put swap files.
set backupskip=/tmp/*,/private/tmp/*  " make Vim able to edit crontab files again.
set backup                            " enable backups
set noswapfile                        " It's 2012, Vim.

" Avoid formatting bullets
set fo+=tcqln
set fo-=r
set fo-=o
set flp=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

if exists("&undodir")
  set undodir=~/.vim/undo/
  set undofile
endif

set nostartofline " Don’t reset cursor to start of line when moving around.
set esckeys " Allow cursor keys in insert mode
set ttyfast " Optimize for fast terminal connections
set isk+=_,$,@,%,#,- " none word dividers

if exists("&cryptmethod")
  set cryptmethod=blowfish " https://coderwall.com/p/hypjbg
endif

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Write better
if exists("&cc")
  set cc=100
endif

" Colors & C.
" set background=light
" colorscheme soda
set background=dark
colorscheme base16-tomorrow

" Make bolds match gui version
" hi! Statement  cterm=bold
" hi! Type       cterm=bold

" IndentGuides <leader>ig
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=0
" hi IndentGuidesOdd  guibg=#f1f1f1 ctermbg=255


filetype plugin indent on      " load the plugin and indent settings for the detected filetype
" runtime! macros/matchit.vim  " % to bounce from do to end etc.

" Disable markdown floading
let g:vim_markdown_folding_disabled=1

" Change mapleader
let mapleader=","

" Verical bar in insert mode (for iTerm users only)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Save when losing focus
au FocusLost * :silent! wall
"
" Resize splits when the window is resized
au VimResized * :wincmd =

" When we open a new session let's change the path
au VimEnter * cd %:p:h

" Go format
" au FileType go autocmd BufWritePre <buffer> Fmt

let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

" Go imports
let g:gofmt_command = "goimports"

" Taskspaper
let g:task_paper_date_format = "%d/%m/%y %H:%M"

" Ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|nimcache$',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.DS_Store'
      \ }

" Use AG
let g:ackprg = 'ag --nogroup --nocolor --column'

" Use goimports
let g:gofmt_command = "goimports"

au FileType make setlocal noexpandtab
au FileType go   setlocal noexpandtab

" Thorfile, Rakefile, GuardFile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Guardfile,Vagrantfile,Thorfile,Do,dorc,Dofile,config.ru} set ft=ruby

" Be sure to don't open markdown files with modula2 syntax
" au BufRead,BufNewFile *.md set ft=markdown

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType * set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=100
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100
au FileType go set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100
au FileType igo set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100
au FileType c set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100
au FileType ooc set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100

" Git commits
au Filetype gitcommit setlocal spell textwidth=72
au BufRead,BufNewFile GHI_* set ft=gitcommit

" Nginx highlight
au BufRead,BufNewFile /{etc,opt}/nginx/conf/* set ft=nginx

" remember last location in file, but not for commit messages.
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

" Iced coffee
autocmd BufNewFile,BufRead *.iced set filetype=coffee
syn match coffeeKeyword /\<\%(await\|defer\)\>/ display

" Vitality
let g:always_assume_iterm = 0

" Enable syntastic syntax checking
let g:syntastic_enable_signs   = 1

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" Make sh a bit happier
let g:is_bash=1

" Stop fucking netrw
let g:netrw_silent = 1
let g:netrw_quiet  = 1
let g:loaded_netrw = 1

" NERDTree configuration
let NERDTreeQuitOnOpen  = 0   " don't collapse NERDTree when a file is opened
let NERDTreeMinimalUI   = 1
let NERDTreeDirArrows   = 0
let NERDTreeChDirMode   = 0
let NERDTreeIgnore      = ['\.pyc$', '\.rbc$', '\~$']
let NERDTreeHijackNetrw = 0
let g:nerdtree_tabs_startup_cd = 0

" Add a more detailed theme for airline
let g:airline_theme = 'ubaryd'

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" GoLint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" au BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" Enable omni completion.
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType ruby setlocal omnifunc=syntaxcomplete#Complete

" Vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
let g:vimshell_editor_command = 'mvim'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Shortcuts
imap <C-w> <Esc><C-w> " move through windows in insert mode
imap <C-v> <Esc><C-v> " allow block selection in insert mode

" Keep visual mode during indenting
vmap > >gv
vmap < <gv

" Tab movements & creation
map <C-S-Left> gT
map <C-S-Right> gt
imap <C-S-Left> <ESC>gT
imap <C-S-Right> <ESC>gt

" Some personal shortcuts
map gc :!git add . && git commit -a && git push<CR>
map zz :ZoomWin<CR>
map gs :Gstatus<CR>
map gd :Gdiff<CR>
map gp :Git push<CR>
map rr :redraw! \| :NERDTree<CR>
map cc :nohlsearch<CR>
map tt :NERDTreeToggle<CR>
map ff :NERDTreeFind<CR>
map tb :TagbarToggle<CR>
nmap <leader>ff ggVG=         " format the entire file
nmap <leader>i :set list!<CR> " toggle [i]nvisible characters

" CtrlP
" Additional mapping for buffer search
map <C-b> :CtrlPBufTag<CR>
imap <C-b> <ESC>:CtrlPBufTag<CR>

map <C-S-p> :CtrlPBuffer<CR>
imap <C-S-p> <ESC>:CtrlPBuffer<CR>

" Standard CtrlP also in insert mode
imap <C-p> <ESC>:CtrlP<CR>

" Use :W! to write to a file using sudo if you forgot to 'sudo vim file'
ca W! %!sudo tee > /dev/null %
