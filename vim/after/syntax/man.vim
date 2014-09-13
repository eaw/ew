" modifications to manual page syntax
" [ew] 2002-09-16
"
" this is the defult
"syn match  manOptionDesc      "^\s*[+-][a-z0-9]\S*"
"
" my mod
syn clear manOptionDesc
syn match  manOptionDesc      "\(^\|[^a-z0-9]\)\zs[-+][a-z0-9-_]\+"
