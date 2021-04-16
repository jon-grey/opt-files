

dockerip() {
	docker inspect "$@" | grep -i IPAddress
}


alias d='docker'
alias drma='docker rm $(docker ps -a -q)'
alias drmai='docker rmi $(docker images -q)'
alias dpa='docker ps -a'
alias dp='docker ps'


alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dcb='docker-compose build'
alias dcx='docker-compose stop'
alias dcs='docker-compose start'
alias dcd='docker-compose down'

alias dv='docker volume'
alias dvp='docker volume prune'
alias dvpf='docker volume prune -f'


