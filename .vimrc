" Vim Configuration - Tejas Patel

" Disable the arrow keys - pro mode!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <BS> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <BS> <Nop>

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Security
set modelines=0

" Turn on basic syntax highlighting
syntax enable

" Allows certain plugins to run on specific file types
" and then autoindents
" needed for rust support
filetype plugin indent on

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Uncomment below to prevent 'tilde backup files' (eg. myfile.txt~) from being
" created
set nobackup

" Uncomment below to disable 'swap files' (eg. .myfile.txt.swp) from being
" created
set noswapfile

" Ensure you can undo changes when reopening files
" The trailing double slash at the end tells vim to enable a feature where it 
" avoids name collisions when editing multiple files with the same name in
" different directories
set undofile
set undodir=~/.vim/undo//

" Better command-line completion
set wildmode=longest,list,full
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Ensures the cursor is visible even when on a higlighted search
set cursorline

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
" This has been disabled to stop you being a noob and to force you to vim
" set backspace=indent,eol,start

" When opening a new lGine and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Turn on number and then relative number,
" to display a number line on the left hand side of the screen
" this will ensure that you are displayed what line you're on
" and display the relative position of all other lines
set number relativenumber


" Set wildmenu to get a nice autocompletion menu box with tab
set wildmenu

" This is for general coding style guidelines, traditionally speaking it was
" considered bad practice to go past 80 chars as it became difficult to read
" on smaller screens. Now in practice everyone has bigger screen so a 120 limit
" perfectly acceptable, but it's still considered good style to ensure you do
" not go pass the 80 character a line limit.
set colorcolumn=80,120

" Adds a some numbers to the bottom of the window to let you know your line
" position and column position
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Set background to dark.
" Depending on your mood you can set it to light.
set background=dark

" Set the colorscheme
" depending on your choice colorscheme you may have to do some additional
" plugin installs. I recommend using vim native plugin management.
" To do this simply create a directory called .vim in your home directory if it
" does not already exist. Then inside of .vim create a directory called pack.
" Inside of pack create a directory called colorschemes (NB this name is
" arbitrary, call it whatever you want, maybe plugins). Inside of your 
" colorschemes (or whatever you decided to call it) create a start directory.
" This start directory is for plugin which should run immediately on starting
" vim. Inside of this directory use git to clone whatever plugins you want.
" A good plugin for colorschemes is the awesome colorshcemes at 
" https://github.com/rafi/awesome-vim-colorschemes.git
" If you are on a new pc simply do the following:
"" cd ~
"" mkdir -p .vim/pack/colorschemes/start
"" cd .vim/pack/colorschemes/start
"" git clone https://github.com/rafi/awesome-vim-colorschemes.git
colorscheme onehalfdark

" Set vertical bars at columns 80 and 120.
" Ensures that any vim searching (ie using find) will look through 
" subdirectories recursively
set path+=**

" Enable automatic running of :RustFmt when you save a buffer.
" Requores the rust.vim plugin, example installation instructions to follow;
"" cd ~
"" mkdir -p .vim/pack/rust/start
"" cd .vim/pack/rust/start
"" git clone https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave = 1

" Ensure ale does not interfere with coc
let g:ale_disable_lsp = 1

let g:coc_global_extensions = [ 
	\'coc-omnisharp',
	\'coc-rls',
	\'coc-rust-analyzer',
	\'coc-json',
	\'coc-tsserver',
\]

" Let ale know you're using omnisharp for cs files
let g:ale_linters = {
	\ 'cs': ['OmniSharp']
\}

" Increase ale size
let g:ale_list_window_size = 5

let g:rainbow_active = 1

" Ensure colors work properly for themes
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Enable sign_column because virtual doesn't work
let g:Hexokinase_highlighters = [  'backgroundfull', 'sign_column' ]

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\ ]

let g:Hexokinase_ftOptInPatterns = {
\     'css': 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names',
\     'html': 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
\ }
