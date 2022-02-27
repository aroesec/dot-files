vim.cmd([[
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc
]])
vim.cmd[[colorscheme catppuccin]]

function gitsigns_status_formatter(status)
  local head, added, changed, removed = status.head, status.added, status.changed, status.removed
  return head
    ..(removed and removed > 0 and '-'..removed or '')
    ..(added and added > 0 and '+'..added or '')
    ..(changed and changed > 0 and '~'..changed or '')
end

require'gitsigns'.setup({
  current_line_blame = true,
  status_formatter = gitsigns_status_formatter
})
