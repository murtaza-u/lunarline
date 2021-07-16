local function get_diagnostics()
    local flag = false
    local result = {}
    local levels = {
        errors = 'Error',
        warnings = 'Warning',
        info = 'Information',
        hints = 'Hint'
    }

    for key, level in pairs(levels) do
        result[key] = vim.lsp.diagnostic.get_count(0, level)
        if result[key] > 0 then
            flag = true
        end
    end

    local colors = {
        error = "%#errorDiagnostics#",
        warning = "%#warningDiagnostics#",
        info = "%#infoDiagnostics#",
        hint = "%#hintDiagnostics#",
    }

    if flag then
        return string.format(" %s%s%s%s%s%s%s%s",
        colors.error,
        result['errors'] == 0 and "" or " " .. result['errors'] .. " ",

        colors.warning,
        result['warnings'] == 0 and "" or " " .. result['warnings'] .. " ",

        colors.info,
        result['info'] == 0 and "" or " " .. result['info'] .. " ",

        colors.hint,
        result['hints'] == 0 and "" or " " .. result['hints'] .. " ")
    end

    return ""
end

return get_diagnostics
