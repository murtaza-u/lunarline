local split = require('lunarline.utils.split')

local function trunc_home(path, dir, return_split)
    local USER = vim.fn.expand('$USER')
    local chunks = split(path, '/')
    if chunks == nil then
        return path
    end

    if chunks[1] == dir and chunks[2] == USER then
        table.remove(chunks, 1)
        table.remove(chunks, 1)
        table.insert(chunks, 1, '~')
        if not return_split then return chunks:concat('/') else return chunks end
    else
        if not return_split then return chunks:concat('/') else return chunks end
    end
end

local function main(path, return_split)
    if vim.fn.has("unix") == 1 then
        return trunc_home(path, 'home', return_split)
    elseif vim.fn.has('mac') == 1 then
        return trunc_home(path, 'Users', return_split)
    elseif return_split then
        return split(path, '/')
    else
        return path
    end
end

return main
