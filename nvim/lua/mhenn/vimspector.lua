

vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
vim.api.nvim_set_keymap('n', "<Leader>db", ":call vimspector#ToggleBreakpoint()<cr>")
vim.api.nvim_set_keymap('n', "<Leader>dw", ":call vimspector#AddWatch()<cr>")
vim.api.nvim_set_keymap('n', "<Leader>de", ":call vimspector#Evaluate()<cr>")
