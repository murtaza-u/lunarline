local function get_git_diff()
    local is_git_repo = require('lunarline.utils.git')
    if not is_git_repo(vim.fn.getcwd()) then
        return ""
    end

    local fname = vim.fn.expand("%F")
    if fname == "" then
        return ""
    end

    local handle = io.popen("git diff --numstat " .. fname .. " 2>/dev/null")
    local result = handle:read("*a")
    handle:close()
    if string.len(result) > 0 then
        local chunks = {}
        for substring in result:gmatch("%S+") do
            table.insert(chunks, substring)
        end
        if chunks == {} then
            return ""
        end
        local colors = {
            added = "%#addedLines#",
            removed = "%#removedLines#",
        }
        return string.format("%s %s",
                             chunks[1] ~= "0" and colors.added .. "[+" .. chunks[1] .. "]" or "",
                             chunks[2] ~= "0" and colors.removed .. "[-" .. chunks[2] .. "]" or "")
    end

    return ""
end

return get_git_diff
