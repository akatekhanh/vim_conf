## Folding Configuration in .vimrc file
```vim
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
```

## Folding shortcut

```bash

zR: unfold all
zM: fold all
zo: Open current fold
zc: Close current fold
```
