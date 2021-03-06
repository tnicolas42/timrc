#!/bin/zsh

# usage
USAGE="./install.sh [-h|--help] [-v|--verbose] [--novim] [--nozsh]
 -> [-h|--help]: print usage
 -> [-v|--verbose]: verbose mode
 -> [--novim]: dont install vim config
 -> [--nozsh]: dont install zsh config
"

# arguments
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
ZSH=true
VIM=true
LINT=true
VERBOSE=false

# save args in variable
args="$@"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
	key="$1"

	case $key in
		--novim)
		VIM=false
		shift # past argument
		;;
		--nozsh)
		ZSH=false
		shift # past argument
		;;
		-v|--verbose)
		VERBOSE=true
		shift # past argument
		;;
		-h|--help)
		echo "$USAGE"
		exit 0
		;;
		*)    # unknown option
		POSITIONAL+=("$1") # save it in an array for later
		shift # past argument
		;;
	esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# source utils file
source scripts/utils.sh $args

if $VERBOSE; then
	verbose='cat'
else
	verbose='> /dev/null'
fi

# init timrc
printf "${TITLE_S}init timrc${TITLE_E}"
init_timrc
set_timrc_var "TIMRC" "`git rev-parse --show-toplevel`"

# install zsh
if $ZSH; then
	printf "${TITLE_S}install zsh${TITLE_E}"
	zsh zsh/install_zsh.sh $args
fi

# install vim
if $VIM; then
	printf "${TITLE_S}install vim${TITLE_E}"
	zsh vim/install_vim.sh $args
fi
