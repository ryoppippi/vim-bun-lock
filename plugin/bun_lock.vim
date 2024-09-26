if exists("g:loaded_bun_lock")
    finish
endif

let g:loaded_bun_lock = 1

augroup BunLockb
    autocmd!
    autocmd BufReadCmd bun.lockb
        \ let path = expand("%:p") |
        \ let output = systemlist("bun " . path) |
        \ call setline(1, output) |
        \ setlocal filetype=conf |
        \ setlocal readonly |
        \ setlocal nomodifiable
augroup END
