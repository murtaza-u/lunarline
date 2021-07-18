local function get_parent_dir(cwd)
    local i = string.find(cwd, "[\\/:][^\\/:]*$")
    if not i then return end
    return cwd:sub(1, i-1)
end

local function has_git_dir(cwd)
    if vim.fn.finddir('.git', cwd) ~= '' then
        return true
    else
        cwd = get_parent_dir(cwd)
        if cwd == nil then
            return false
        else
            return has_git_dir(cwd)
        end
    end
end

return has_git_dir(vim.fn.getcwd())
