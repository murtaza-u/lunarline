local function main()
    local VIRTUAL_ENV = vim.fn.getenv("VIRTUAL_ENV")
    if VIRTUAL_ENV ~= vim.NIL then
        local split = require('lunarline.utils.split')
        local chunks
        if vim.fn.has("unix") == 1 or vim.fn.has("max") == 1 then
            chunks = split(VIRTUAL_ENV, '/')
        else
            chunks = split(VIRTUAL_ENV, '\\')
        end
        return string.format("(%s)", chunks[#chunks])
    end
    return ""
end

return main
