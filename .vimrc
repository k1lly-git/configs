set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set smartindent
set number
syntax on
highlight LineNr ctermfg=grey 
highlight CursorLine cterm=NONE ctermbg=black ctermfg=171
highlight CursorLineNr cterm=bold ctermbg=black ctermfg=50


let g:red_value = 240
let g:green_value = 240
let g:blue_value = 240
let g:timer_id = timer_start(300, 'ChangeRgbColor', {'repeat': -1})

function! ChangeRgbColor(timer_id)
    if g:red_value < 255
        let g:red_value += 1
    else
        let g:red_value = 240
        if g:green_value < 255
            let g:green_value += 1
        else
            let g:green_value = 240
            if g:blue_value < 255
                let g:blue_value += 1
            else
                let g:blue_value = 240
            endif
        endif
    endif

    execute 'highlight CursorLine cterm=NONE ctermbg=black ctermfg=' . g:red_value . '/' . g:green_value . '/' . g:blue_value

    let selected_text = @"
    let selected_text_length = strlen(selected_text)

    if selected_text_length > 0
        execute 'highlight Visual cterm=NONE ctermbg=black ctermfg=' . g:red_value . '/' . g:green_value . '/' . g:blue_value
    endif
endfunction

set showmatch
set hlsearch
set incsearch
set statusline=%F%m%r%h%w%=\ [%04l]
set laststatus=2

set background=dark
