local function main(cwf)
    local split = require('lunarline.utils.split')
    if cwf == nil then
        cwf = vim.fn.expand("%f")
    end
    cwf = split(cwf, '/')
    local cwd = split(vim.fn.getcwd(), '/')

    if #cwd > #cwf then
        return table.concat(cwf, '/')
    else
        for i = 1, #cwd do
            if cwd[i] ~= cwf[i] then
                return table.concat(cwf, '/')
            end
        end
        cwf = table.concat(cwf, '/')
        cwd = table.concat(cwd, '/')
        return string.sub(cwf, string.len(cwd) + 2)
    end
    return table.concat(cwf, '/')
end

return main
