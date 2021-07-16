local function get_mode()
    local bar = "▊"
    local modes = setmetatable({
        ['n']  = '%#normalMode#',
        ['i']  = '%#insertMode#',
        ['v']  = '%#visualMode#',
        ['V']  = '%#visualMode#',
        [''] = '%#visualMode#',
        ['c']  = '%#commandMode#',
    }, {
        __index = function()
            return  '%#otherMode#'
        end
    })

    local mode = vim.api.nvim_get_mode().mode
    mode = modes[mode]
    return string.format("%s%s", mode, bar)
end

return get_mode
