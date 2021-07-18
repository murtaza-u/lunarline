local function load_theme(tbl)
    local highlight_general = require('lunarline.highlights.general')
    local highlight_special = require('lunarline.highlights.special')
    for key, value in pairs(tbl) do
        if key == "mode_bar" then
            highlight_special(value, 'Mode')
        elseif key == "lsp_diagnostics" then
            highlight_special(value, 'Diagnostics')
        elseif key == "git_diff" then
            highlight_special(value, 'Lines')
        else
            highlight_general(key, value)
        end
    end
end


local function load_statusline(options)
    local get_required_components = require('lunarline.utils.req_components')
    local components, filename_option = get_required_components(options)
    local set = require('lunarline.utils.set')
    set(components, filename_option)
end

return {load_theme = load_theme, load_statusline = load_statusline}
