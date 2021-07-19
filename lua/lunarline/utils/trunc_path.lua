local function main(path)
    if path == nil then
        path = vim.fn.expand("%f")
    end
    local split = require('lunarline.utils.split')
    local chunks = split(path, '/')
    if chunks == nil then
        return path
    end

    local new_path = ""
    for i = 1, #chunks do
        if i ~= #chunks then
            if chunks[i]:sub(1, 1) == '.' then
                new_path = new_path .. chunks[i] .. "/"
            else
                new_path = new_path .. chunks[i]:sub(1, 1) .. "/"
            end
        else
            new_path = new_path .. chunks[i]
        end
    end
    return new_path
end

return main
