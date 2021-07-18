local function split (inputstr, sep)
    if inputstr == nil then
        return
    elseif sep == nil then
        sep = "%s"
    end

    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

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
