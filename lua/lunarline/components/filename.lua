local function get_filename(trunc_req, options)
    local color = '%#filename#'
    local file_name, file_ext = vim.fn.expand('%:t'), vim.fn.expand('%:e')
    local icon = require('nvim-web-devicons').get_icon(file_name, file_ext, {default = true})
    if not trunc_req then
        if options == nil then
            local relative_path = require('lunarline.utils.relative_path')
            file_name = relative_path()
        else
            file_name = vim.fn.expand("%f")
            if options['relative_path'] then
                local relative_path = require("lunarline.utils.relative_path")
                file_name = relative_path(file_name)
            end

            if options['full_path'] then
                local trunc_home = require('lunarline.utils.trunc_home')
                file_name = trunc_home(vim.fn.expand("%:p"))
            end

            if options['truncate_path'] then
                local trunc_path = require("lunarline.utils.trunc_path")
                file_name = trunc_path(file_name)
            end

            if options['tail_only'] then
                file_name = vim.fn.expand("%:t")
            end
        end
    end
    return string.format("%s%s %s ", color, icon, file_name)
end

return get_filename
