


alias Wmtl='xdotool windowmove $(xdotool getactivewindow) 0% 0%'
alias Wmtr='xdotool windowmove $(xdotool getactivewindow) 50% 0%'
alias Wmbl='xdotool windowmove $(xdotool getactivewindow) 0% 50%'
alias Wmbr='xdotool windowmove $(xdotool getactivewindow) 50% 50%'

alias Wrh='xdotool windowsize  $(xdotool getactivewindow) 50% 50%'
alias Wrf='xdotool windowsize  $(xdotool getactivewindow) 100% 100%'

alias Wstr='Wmtr && Wrh'
alias Wstl='Wmtl && Wrh'
alias Wsbr='Wmbr && Wrh'
alias Wsbl='Wmbl && Wrh'