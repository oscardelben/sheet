#compdef sheet
# Zsh completion for 'sheet' (http://oscardelben.com/sheet/).
# Author: Pablo Olmos de Aguilera Corradini (pablo at glatelier dot org)
#
# To make completion work in zsh, you have to make sure:
# * this file is preceded with an underscore `_' like _sheet
# * its directory it's on the $fpath variable; a quick way to do it it's adding
#   something like fpath=(~/.completions $fpath) in your ~/.zshrc file
# * make sure compinit it's being invoked in your .zshrc file:
#
#   autoload -U compinit
#   compinit

local state expl ret=1
local -a sheets commands

sheets=( $(command ls -1 --color=never ${HOME}/.sheets) )

commands=(
  'list:List sheets'
  'new:Create a new sheet'
  'edit:Edit sheet'
  'copy:Copy sheet'
)

_arguments \
  '1:cmd:->cmds' \
  '*::arg:->args' \
&& ret=0

case "$state" in
  cmds)
    _wanted sheets expl "sheets" compadd "$sheets[@]"
    _describe -t commands 'commands' commands && ret=0
  ;;
  args)
    case "$words[1]" in
      edit|copy)
        _arguments \
          '*:sheets:($sheets)' && ret=0
        ;;
      new)
        _arguments \
          '*:insert new name for your sheet:' && ret=0
        ;;
      *)
        (( ret )) && _message 'no more arguments'
        ;;
    esac
esac