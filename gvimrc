set guifont=Office\ Code\ Pro\ Light:h12
set linespace=2
set antialias

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
end
