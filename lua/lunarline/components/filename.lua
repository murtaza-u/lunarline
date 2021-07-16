local function get_filename(trunc_req)
    local color = '%#filename#'
    local file_name, file_ext = vim.fn.expand('%:t'), vim.fn.expand('%:e')
    local icon = require('nvim-web-devicons').get_icon(file_name, file_ext, {default = true})
    if not trunc_req then
        file_name = "%f"
    end
    return string.format("%s%s %s ", color, icon, file_name)
end

return get_filename
