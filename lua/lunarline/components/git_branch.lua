local function get_git_branch()
    local color = '%#git_branch#'
    local git_icon = ""
    local handle = io.popen("git branch --show-current")
    local result = handle:read("*a")
    handle:close()
    result = string.gsub(result, "%s+", "") -- trim trailing whitespace
    if string.len(result) > 0 then
        return string.format("%s%s %s", color, git_icon, result)
    end
    return ""
end

return get_git_branch
