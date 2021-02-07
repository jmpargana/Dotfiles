"========================================================
"=====================    FZF    ========================
"========================================================

" I use fzf to:
"   - search for files in git directory
"   - all directories recursively
"   - navigate through the open buffers
"   - open recently opened files
"   - create ctags for definition jumps
"   - change colorscheme
"   - search for pattern in directory (with ripgrep)

noremap <leader>f :GFiles <cr>
noremap <leader>F :Files <cr>
noremap <leader>o :Buffers<cr>

" show files recently edited
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

noremap <leader>u :FZFMru<CR>

" CTAGS Setup
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'


function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

noremap <C-g> :Rg <CR>

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()



