# Bash completion for 'sheet' (http://oscardelben.com/sheet/).

function _sheet_complete() {
    _get_comp_words_by_ref cur prev
    COMPREPLY=()

    case "${prev}" in
        list|new)
            return 0
            ;;
        edit|copy)
            COMPREPLY=( $(compgen -W "$(sheet list)" -- "${cur}") )
            return 0
            ;;
        *)
            ;;
    esac

    COMPREPLY=( $(compgen -W "list new edit copy $(sheet list)" -- ${cur}) )

}

complete -o nospace -F _sheet_complete sheet

