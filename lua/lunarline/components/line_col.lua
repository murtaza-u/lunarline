local function get_line_col()
    local color = '%#line_col#'
    return string.format("%s%s", color, "%l:%c")
end

return get_line_col
