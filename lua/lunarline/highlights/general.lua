local function init(group, tbl)
    local fg = tbl.fg ~= nil and "guifg=" .. tbl.fg or ""
    local bg = tbl.bg ~= nil and "guibg=" .. tbl.bg or ""
    local style = tbl.style ~= nil and "gui=" .. tbl.style or ""
    local cmd = table.concat({'hi', group, bg, fg, style}, " ")
    vim.cmd(cmd)
end

return init
