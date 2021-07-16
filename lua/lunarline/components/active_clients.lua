local get_lsp_client = function ()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end

    for _,client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
            local color = "%#active_clients#"
            local icon = ""
            return string.format('%s%s %s', color, icon, client.name)
        end
    end
    return msg
end

return get_lsp_client
