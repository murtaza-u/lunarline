local split = require('lunarline.utils.split')
local function main()
    local cwd_split = split(vim.fn.getcwd(), '/')
    local actual_wd_split = split(vim.fn.expand("%:p:h"), '/')
    if #cwd_split > #actual_wd_split then
        return false
    else
        for i = 1, #cwd_split do
            if cwd_split[i] ~= actual_wd_split[i] then
                return false
            end
        end
    end
    return true
end

return main
