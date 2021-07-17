local function get_parent_dir(cwd)
    local i = cwd:find("[\\/:][^\\/:]*$")
    if not i then return end
    return cwd:sub(1, i-1)
end

local function main(cwd)
    if vim.fn.finddir('.git', cwd) then
        return true
    else
        cwd = get_parent_dir(cwd)
        if cwd == nil then
            return false
        end
        return main(cwd)
    end
end

return main
