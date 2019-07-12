" Vim Plug
call plug#begin('~/.config/nvim/plugged')
 " autoswap
 Plug 'gioele/vim-autoswap'
 " emmet
 Plug 'mattn/webapi-vim'
 Plug 'mattn/emmet-vim'
 " startify
 Plug 'mhinz/vim-startify'
 " theme
 Plug 'morhetz/gruvbox'
 " tpope suite
 Plug 'tpope/vim-vinegar'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-dispatch'
 " vue
 Plug 'posva/vim-vue'
 " rust
 Plug 'rust-lang/rust.vim'
 " airline
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 " nerdtree
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'ryanoasis/vim-devicons'
 " ale
 Plug 'w0rp/ale'
call plug#end()




set backspace=indent,eol,start  "Make backspace behave like every other editor.
let mapleader = ','     "The default is \, but a comma is much better.
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set relativenumber
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.
set autowriteall        " Auto write the file when switching buffers.
set complete=.,w,b,u    " Set our desired autocompletion matching.
set grepprg=rg\ --vimgrep
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
   set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
   set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.


" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=white guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Change from : to ;
nnoremap ; :

" Move between buffers with tab and shift-tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>







"-------------Visuals--------------"
set termguicolors
syntax enable
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast = 'dark'
set wrap
" do not display the current mode
set noshowmode

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

"Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Enables filetype detection, filetype-specific scripts (ftplugins),
" and filetype-specific indent scripts.
filetype plugin indent on






"-------------Search--------------"
set hlsearch			    				   	"Highlight all matched terms.
set incsearch				    				"Incrementally highlight, as we type.

"-------------Split Management--------------"
set splitbelow 					    			"Make splits default to below...
set splitright						    		"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"Auto-remoe trailing spaces.
autocmd BufWritePre *.php :%s/\s\+$//e

"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>es :e ~/.config/nvim/snippets/

"Fast saves.
nmap <leader>ww :w!<cr>

"Fast saves and quits
nmap <leader>qq :wq!<cr>

"Easy escaping to normal mode
imap kj <esc>

"Down is really the next line.
nnoremap j gj
nnoremap k gk

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Edit todo list for project.
nmap ,todo :e todo.txt<cr>

nmap <leader>t :ter<cr>





"-------------Plugins--------------"
"/
"/ ale
"/
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight ALEWarning ctermbg=DarkMagenta
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'rust': ['rustc']
    \ }
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'angular': ['prettier'],
    \ 'css': ['prettier'],
    \ 'html': ['prettier'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'jsx': ['prettier'],
    \ 'php': ['php_cs_fixer', 'prettier'],
    \ 'scss': ['prettier'],
    \ 'vue': ['prettier']
    \ }



"/
"/ nerdtree
"/
let NERDTreeHijackNetrw = 1
nnoremap <leader>p :NERDTreeToggle<CR>
nnoremap <silent> <leader>v :NERDTreeFind<CR>
let NERDTreQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }




"/
"/vim-airline
"/
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_section_x = ''                         "Remove filetype
let g:airline_section_y = ''                         "Remove unicode
let g:airline_section_z = ''                         "Remove current position
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1

"/
"/ Emmet
"/
" remap default <C-Y> leader
let g:user_emmet_leader_key='<C-z>,'
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets/snippets.json')), "\n"))





"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
    autocmd!
    autocmd BufWritePost .config/nvim/init.vim source %
augroup END

" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h

"Sort PHP use statements
vmap <Leader>Su ! awk '{ print length(), $0\| "sort -n \| cut -d\\ -f2-"extends}'<cr>

" Change syntax highlighting to html for vue files
" autocmd BufRead,BufNewFile *.vue setfiletype html


"Apply coding standards with phpcsfixer
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=PSR2<cr>


 " Notes and other stuff
 " If I hit % inside of Vinegar I can create a new file
 " If I hit d I can create a new directory.
 " If I hit D I can delete the directory or file.
 " Emmet key is Control Z comma
