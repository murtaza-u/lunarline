local function get_git_branch()
    local is_git_repo = require('lunarline.utils.git')
    if is_git_repo(vim.fn.getcwd()) then
        local color = '%#git_branch#'
        local git_icon = ""
        local handle = io.popen("git branch --show-current 2>/dev/null")
        local result = handle:read("*a")
        handle:close()
        result = string.gsub(result, "%s+", "") -- trim trailing whitespace
        if string.len(result) > 0 then
            return string.format("%s%s %s", color, git_icon, result)
        end
    end
    return ""
end

return get_git_branch
