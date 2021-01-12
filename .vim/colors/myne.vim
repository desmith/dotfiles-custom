" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@mossbayeng.com>
" Last Change:	2001 Jul 28

" 1=red
" 2=green
" 3=yellow
" 4=blue
" 5=magenta
"
"
highlight Constant    NONE    
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE    
highlight ErrorMsg    NONE    
highlight HTMLHref    NONE
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

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "myne"
hi Normal      guifg=#dce6ff guibg=#0a0f46
hi Comment		term=bold		ctermfg=lightgrey		guifg=#cccccc
hi Constant		term=underline	ctermfg=Magenta		guifg=Magenta
hi Delimiter	term=bold cterm=bold ctermfg=1 gui=bold guifg=Red
hi Directory	term=bold ctermfg=2 guifg=SlateBlue
hi Error		term=reverse	ctermbg=Red ctermfg=White guibg=Red guifg=White
hi ErrorMsg		term=standout cterm=bold ctermfg=1 ctermbg=White gui=bold guifg=red
hi Function		term=bold	cterm=bold	ctermfg=1 guifg=Green
hi HTMLHref		term=underline cterm=underline ctermfg=Yellow guifg=Blue
hi Identifier	term=bold	cterm=bold	ctermfg=Yellow	guifg=#40ffff
hi Ignore				ctermfg=grey		guifg=#cccccc
hi LineNr				ctermfg=3 guifg=Brown
hi ModeMsg		term=bold cterm=bold ctermfg=3 ctermbg=1 guifg=yellow guibg=red
hi MoreMsg		term=bold cterm=bold ctermfg=2 gui=bold guifg=Green
hi NonText		term=bold ctermfg=Green guifg=Green
hi Operator				ctermfg=Red			guifg=Red
hi PreProc			ctermfg=White	guifg=#ff80ff
hi Question    term=standout term=standout ctermfg=2 gui=bold guifg=Green
hi Repeat		term=underline	ctermfg=White		guifg=white
hi Search		term=reverse	cterm=reverse	ctermbg=Yellow ctermfg=Blue guifg=Blue guibg=Cyan
hi Special		term=bold		ctermfg=Cyan	guifg=Red
hi SpecialKey  term=bold ctermfg=Cyan guifg=Blue
hi Statement 	term=bold	cterm=bold	ctermfg=Cyan gui=bold	guifg=#aa4444
hi StatusLine  term=reverse cterm=bold ctermfg=3 ctermbg=4 guifg=wheat guibg=#2f4f4f
hi StatusLineNC term=bold ctermfg=2 ctermbg=5 guifg=#071f1f guibg=#5f9f9f
hi Title       term=bold cterm=bold ctermfg=Yellow gui=bold guifg=Blue
hi Todo			term=standout	ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi Type			term=underline		ctermfg=Green	guifg=#60ff60	gui=bold
hi Visual      term=reverse cterm=bold ctermfg=6 ctermbg=5 guifg=yellow guibg=blue
hi WarningMsg  term=standout cterm=bold ctermfg=1 ctermbg=4 guifg=Red

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
"
