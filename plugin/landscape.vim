" =============================================================================
" Filename: plugin/landscape.vim
" Version: 0.0
" Author: itchyny
" License: MIT License
" Last Change: 2013/08/23 14:32:30.
" =============================================================================

if exists('g:loaded_landscape') && g:loaded_landscape
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

let g:landscape_highlight_url =
      \ get(g:, 'landscape_highlight_url', 0)
let g:landscape_highlight_todo =
      \ get(g:, 'landscape_highlight_todo', 0)
let g:landscape_highlight_full_space =
      \ get(g:, 'landscape_highlight_full_space', 0)
let g:landscape_highlight_url_filetype =
      \ get(g:, 'landscape_highlight_url_filetype', {})

let g:loaded_landscape = 1

let &cpo = s:save_cpo
unlet s:save_cpo
