source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"
" Vundle shit 
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 

" Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'python-mode/python-mode'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-surround' 
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'davidhalter/jedi-vim'


call vundle#end()            " required
filetype plugin indent on    " required



set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" MY SHIT BEGGINS HERE
colorscheme desert
set enc=utf-8

" execute pathogen#infect()

set belloff=all 
set guifont=Courier_New:h10:cANSI:qDRAFT

