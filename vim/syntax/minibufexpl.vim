if !exists("main_syntax")
    if version < 600
        syntax clear
    elseif exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'minibufexpl'
endif

syn match MBENormal               '\[[^\]]*\]'
syn match MBEChanged              '\[[^\]]*\]+'
syn match MBEVisibleNormal        '\[[^\]]*\]\*'
syn match MBEVisibleChanged       '\[[^\]]*\]\*+'
syn match MBEVisibleActiveNormal  '\[[^\]]*\]\*!'
syn match MBEVisibleActiveChanged '\[[^\]]*\]\*+!'

if version >= 508 || !exists("did_kos_syn_inits")
    if version < 508
        let did_kos_syn_inits = 1
    endif
    hi MBENormal               ctermfg=2 guifg=DarkGreen gui=Italic
    hi MBEChanged              ctermfg=2 guifg=DarkGreen gui=Underline,Italic
    hi MBEVisibleNormal        term=underline guifg=DarkRed guibg=Gray90
    hi MBEVisibleChanged       term=underline guifg=DarkRed guibg=Gray90 gui=Underline
    hi MBEVisibleActiveNormal  term=underline guifg=DarkRed guibg=Gray90 gui=Bold
    hi MBEVisibleActiveChanged term=underline guifg=DarkRed guibg=Gray90 gui=Bold,Underline 
endif

let b:current_syntax = "minibufexpl"
if main_syntax == 'minibufexpl'
    unlet main_syntax
endif
