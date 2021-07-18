local function get_line_col()
    local color = '%#line_col#'
    return string.format("%s%s", color, "%2l:%-2c")
end

return get_line_col
