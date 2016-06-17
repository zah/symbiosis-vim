" Vim syntax file
" Language: CoffeeScript
" Maintainer: Zahary Karadjov
" Filenames: *.coffee

if exists('b:current_syntax')
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif

" silent! syntax include @jadeSyntax syntax/jade.vim
" unlet! b:current_syntax

syn match htmlTag /\s\%(a\|abbr\|address\|area\|article\|aside\|audio\|b\|base\|bdi\|bdo\|big\|blockquote\|body\|br\|button\|canvas\|caption\|cite\|code\|col\|colgroup\|data\|datalist\|dd\|del\|details\|dfn\|dialog\|div\|dl\|dt\|em\|embed\|fieldset\|figcaption\|figure\|footer\|form\|h1\|h2\|h3\|h4\|h5\|h6\|head\|header\|hr\|html\|i\|iframe\|img\|input\|ins\|kbd\|keygen\|label\|legend\|li\|link\|main\|map\|mark\|menu\|menuitem\|meta\|meter\|nav\|noscript\|object\|ol\|optgroup\|option\|output\|p\|param\|picture\|pre\|progress\|q\|rp\|rt\|ruby\|s\|samp\|script\|section\|select\|small\|source\|span\|strong\|style\|sub\|summary\|sup\|table\|tbody\|td\|textarea\|tfoot\|th\|thead\|time\|title\|tr\|track\|u\|ul\|var\|video\|wbr\)[\.\#\(\ \n]/ contained display

" \z is like a back-reference
" (a capture in the start pattern can be seeked in the end pattern).
" \%() is like regular () brackets, but doesn't create a capture group.
" \@! as a suffix means 'the previous pattern should not be matched'.
syn region jadeBlock matchgroup=NONE start=/^\z(\s*\).*<\w*>\s*$/hs=e+1 end=/^\%(\z1\s\|\s*$\)\@!/ contains=coffeeInterp,htmlTag
" @jadeSyntax

syn region jadeBlock matchgroup=NONE start=/^\z(\s*\).*<\w*>\s*\w/hs=e end=/\n/

" Regular strings
syn region jadeBlock start=/"!jade/ skip=/\\\\\|\\"/ end=/"/ contains=coffeeInterp,htmlTag

syn match coffeeKeyword /await/

hi def link jadeBlock String
hi def link htmlTag Keyword

if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
endif

