local function get_filename(trunc_req, option)
    local color = '%#filename#'
    local file_name, file_ext = vim.fn.expand('%:t'), vim.fn.expand('%:e')
    local icon = require('nvim-web-devicons').get_icon(file_name, file_ext, {default = true})
    if not trunc_req then
        if option == 'truncate' then
            local trunc_path = require('lunarline.utils.trunc_path')
            file_name = trunc_path(vim.fn.expand("%f"))
        elseif option == true then
            file_name = "%f"
        end
    end
    return string.format("%s%s %s ", color, icon, file_name)
end

return get_filename
