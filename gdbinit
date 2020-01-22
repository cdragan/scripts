#set auto-solib-add off
set history save on
set history remove-duplicates 1
set print pretty on
set pagination off
set confirm off
set disassembly-flavor intel

# Auto-refresh screen (useful with TUI)
define hookpost-finish
    refresh
end
define hookpost-next
    refresh
end
define hookpost-step
    refresh
end
define hookpost-stop
    refresh
end
