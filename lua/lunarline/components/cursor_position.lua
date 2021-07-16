local function get_cursor_position()
    local color = '%#cursor_position#'
    local icon = ""
    return string.format("%s%s %s", color, icon, "%P")
end

return get_cursor_position
