local all_components = {
    filename = 'filename',
    git_branch = 'git_branch',
    git_diff = 'git_diff',
    active_clients = 'active_clients',
    diagnostics = 'lsp_diagnostics',
    cursor_position = 'cursor_position',
    line_col = 'line_col',
}
local function req_components(options)
    local is_git_repo = require('lunarline.utils.git')
    local components = {}
    for key, _ in pairs(all_components) do
        local new_key = "get_" .. key
        if options == nil then
            if (key == "git_diff" or key == "git_branch") and not is_git_repo then
                goto continue
            end
            components[new_key] = require('lunarline.components.' .. key)
        elseif options[key] == true or options[key] == nil then
            if (key == "git_diff" or key == "git_branch") and not is_git_repo then
                goto continue
            end
            components[new_key] = require('lunarline.components.' .. key)
        end
        ::continue::
    end
    components.get_mode = require('lunarline.components.mode')
    return components
end

return req_components
