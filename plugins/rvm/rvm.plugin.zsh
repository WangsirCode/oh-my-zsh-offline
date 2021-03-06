fpath=($rvm_path/scripts/zsh/Completion $fpath)

alias rubies='rvm list rubies'
alias rvms='rvm gemset'
alias gemsets='rvms list'

local ruby18='ruby-1.8.7'
local ruby19='ruby-1.9.3'
local ruby20='ruby-2.0.0'
local ruby21='ruby-2.1.2'

function rb18 {
	if [ -z "$1" ]; then
		rvm use "$ruby18"
	else
		rvm use "$ruby18@$1"
	fi
}

_rb18() {compadd `ls -1 $rvm_path/gems | grep "^$ruby18@" | sed -e "s/^$ruby18@//" | awk '{print $1}'`}
compdef _rb18 rb18

function rb19 {
	if [ -z "$1" ]; then
		rvm use "$ruby19"
	else
		rvm use "$ruby19@$1"
	fi
}

_rb19() {compadd `ls -1 $rvm_path/gems | grep "^$ruby19@" | sed -e "s/^$ruby19@//" | awk '{print $1}'`}
compdef _rb19 rb19

function rb20 {
	if [ -z "$1" ]; then
		rvm use "$ruby20"
	else
		rvm use "$ruby20@$1"
	fi
}

_rb20() {compadd `ls -1 $rvm_path/gems | grep "^$ruby20@" | sed -e "s/^$ruby20@//" | awk '{print $1}'`}
compdef _rb20 rb20

function rb21 {
	if [ -z "$1" ]; then
		rvm use "$ruby21"
	else
		rvm use "$ruby21@$1"
	fi
}

_rb21() {compadd `ls -1 $rvm_path/gems | grep "^$ruby21@" | sed -e "s/^$ruby21@//" | awk '{print $1}'`}
compdef _rb21 rb21

function rvm-update {
	rvm get head
}

# TODO: Make this usable w/o rvm.
function gems {
	local current_ruby=`rvm-prompt i v p`
	local current_gemset=`rvm-prompt g`

	gem list $@ | sed -E \
		-e "s/\([0-9, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
		-e "s|$(echo $rvm_path)|$fg[magenta]\$rvm_path$reset_color|g" \
		-e "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
		-e "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
}

function _rvm_completion {
  source $rvm_path"/scripts/zsh/Completion/_rvm"
}
compdef _rvm_completion rvm
