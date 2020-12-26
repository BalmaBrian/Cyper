function! s:isNode()
	let shebang = getline(1)
	if shebang =~# '^#!.*/bin/env\s\+node\>' | return 1 | en
	if shebang =~# '^#!.*/bin/node\>' | return 1 | en
	return 0
endfunction

au BufRead,BufNewFile * if !did_filetype() && s:isNode() | setf javascript | en
" Detect vimshell rc file.
autocmd BufNewFile,BufRead *.vimsh,.vimshrc,vimshrc set filetype=vimshrc
" Stylus
autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
autocmd BufNewFile,BufReadPost *.stylus set filetype=stylus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftdetect file
" Language: TSX (Typescript)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.tsx setf typescriptreact
autocmd BufNewFile,BufRead *.less setf less
" use `set filetype` to override default filetype=xml for *.ts files
autocmd BufNewFile,BufRead *.ts  set filetype=typescript
" use `setfiletype` to not override any other plugins like ianks/vim-tsx
autocmd BufNewFile,BufRead *.tsx setfiletype typescript
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
" vim-node.js - file type detect plugin for vim which detects node.js shebang
" Author:       Maciej Malecki
" Version:      1.1.1
" License:      MIT
"
" Install via pathogen by cloning/adding submodule in ~/.vim/bundle or
" by dropping this script in ~/vim/ftdetect

function! DetectNode()
  if !did_filetype()
    if getline(1) =~ '\v^#.*(<node>|<iojs>)'
      setfiletype javascript
    endif
  endif
endfunction

:au BufNewFile,BufRead * call DetectNode()
au BufRead,BufNewFile *.scss setfiletype scss
au BufEnter *.scss :syntax sync fromstart
au BufNewFile,BufRead .tern-project setf json
au BufNewFile,BufRead .tern-config setf json
