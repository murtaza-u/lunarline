local all_components = {
    filename = 'filename',
    git_branch = 'git_branch',
    active_clients = 'active_clients',
    diagnostics = 'lsp_diagnostics',
    cursor_position = 'cursor_position',
    line_col = 'line_col',
}

local function load_theme(tbl)
    local highlight_general = require('lunarline.highlights.general')
    local highlight_special = require('lunarline.highlights.special')
    for key, value in pairs(tbl) do
        if key == "mode_bar" then
            highlight_special(value, 'Mode')
        elseif key == "lsp_diagnostics" then
            highlight_special(value, 'Diagnostics')
        else
            highlight_general(key, value)
        end
    end
end

local function set(components)
    local trunc_req = require('lunarline.utils.trunc_width')
    local netrw_icon = "פּ"
    local colors = {
        active = "%#active#",
        inactive = "%#inactive#",
    }
    local get_mode = require('lunarline.components.mode')

    function Set(focus)
        if focus == 'active' then
            if vim.bo.filetype == 'netrw' then
                return Set('netrw')
            end

            if trunc_req() then
                return table.concat({
                    get_mode(),
                    components.get_filename and components.get_filename(true) or "",
                    components.get_git_branch and components.get_git_branch() or "",
                }, ' ')
            else
                return table.concat({
                    get_mode(),
                    components.get_filename and components.get_filename(false) or "",
                    components.get_git_branch and components.get_git_branch() or "",
                    colors.active,
                    '%=',
                    components.get_active_clients and components.get_active_clients() or "",
                    components.get_diagnostics and components.get_diagnostics() or "",
                    components.get_cursor_position and components.get_cursor_position() or "",
                    components.get_line_col and components.get_line_col() or "",
                }, ' ')
            end
        elseif focus == 'netrw' then
            return colors.active .. netrw_icon .. " netrw"
        else
            return colors.inactive
        end
    end
    vim.api.nvim_exec([[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Set('active')
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Set('inactive')
    augroup END
    ]], false)
end

local function load_options(options)
    local components = {}
    for key, _ in pairs(all_components) do
        local new_key = "get_" .. key
        if options == nil then
            components[new_key] = require('lunarline.components.' .. key)
        elseif options[key] ~= false then
            components[new_key] = require('lunarline.components.' .. key)
        end
    end
    set(components)
end

return {load_theme = load_theme, load_options = load_options}
