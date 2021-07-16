local function init(tbl, postfix)
    local fg_colors = tbl.fg ~= nil and tbl.fg or {}
    local bg_color = tbl.bg

    for key, value in pairs(fg_colors) do
        vim.cmd(table.concat({
            'hi',
            key .. postfix,
            'guifg=' .. value,
            bg_color ~= nil and "guibg=" .. bg_color or "",
        }, ' '))
    end
end

return init
