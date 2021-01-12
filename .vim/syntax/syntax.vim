"------ this clears out the old colors before we begin
highlight Constant    NONE
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE
highlight ErrorMsg    NONE
highlight Identifier  NONE
highlight LineNr      NONE
highlight ModeMsg     NONE
highlight MoreMsg     NONE
highlight Normal      NONE
highlight NonText     NONE
highlight PreProc     NONE
highlight Question    NONE
highlight Search      NONE
highlight Special     NONE
highlight SpecialKey  NONE
highlight Statement   NONE
highlight StatusLine  NONE
highlight Title       NONE
highlight Todo        NONE
highlight Type        NONE
highlight Visual      NONE
highlight WarningMsg  NONE
"----- these are the new superior colors
" please note that i hardly ever ever use gvim... so...
"  i don't really know that all of these guifg's and guibg's work properly

" oh yes... and... very annoying...  it would appear that the gui colors
" are the only ones used by the 2html thingy

highlight Normal      ctermfg=white guifg=#dce6ff guibg=#0a0f46
highlight Comment     term=bold ctermfg=white ctermbg=0 guifg=lightgray guibg=Black
highlight Constant    term=underline ctermfg=6 guifg=#FF2f8f
highlight Delimiter   term=bold cterm=bold ctermfg=1 gui=bold guifg=Red
highlight Directory   term=bold ctermfg=5 guifg=SlateBlue
highlight Error       term=standout cterm=bold ctermbg=1 ctermfg=2 gui=bold guifg=red
highlight ErrorMsg    term=standout cterm=bold ctermfg=1 gui=bold guifg=red
highlight Identifier  term=underline ctermfg=3 guifg=yellow
highlight LineNr      term=underline cterm=bold ctermfg=3 guifg=Brown
highlight ModeMsg     term=bold cterm=bold ctermfg=3 ctermbg=1 guifg=yellow guibg=red
highlight MoreMsg     term=bold cterm=bold ctermfg=2 gui=bold guifg=Green
highlight NonText     term=bold ctermfg=2 guifg=green3
highlight PreProc     term=underline ctermfg=14 guifg=cyan
highlight Question    term=standout cterm=bold ctermfg=2 gui=bold guifg=Green
highlight Search      				ctermbg=White ctermfg=Cyan guibg=Cyan
highlight Special     term=bold ctermfg=5 guifg=SlateBlue
highlight SpecialKey  term=bold ctermfg=Cyan guifg=Blue
highlight Statement   term=bold ctermfg=2 gui=bold guifg=green
highlight StatusLine  term=reverse cterm=bold ctermfg=3 ctermbg=4 guifg=wheat guibg=#2f4f4f
highlight StatusLineNC term=bold ctermfg=2 ctermbg=5 guifg=#071f1f guibg=#5f9f9f
highlight Title       term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
highlight Todo        term=bold ctermfg=red ctermbg=yellow guifg=red guibg=yellow gui=bold
highlight Type        term=underline cterm=bold ctermfg=3 guifg=yellow gui=bold
highlight Visual      term=reverse cterm=bold ctermfg=6 ctermbg=5 guifg=yellow guibg=blue
highlight WarningMsg  term=standout cterm=bold ctermfg=1 ctermbg=4 guifg=Red

