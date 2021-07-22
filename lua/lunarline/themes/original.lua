local colors = {
    red = "#f65866",
    light_blue = "#9CDCFE",
    vivid_blue = "#4FC1FF",
    green = "#98c379",
    orange = "#ff8800",
    purple = "#C586C0",
    yellow = "#e1be79",
    black = "#10151a",
    white = "#f9f5d7",
}

return {
    active = {bg = colors.black, fg = colors.white},
    inactive = {bg = "NONE", fg = colors.white},
    mode_bar = {
        bg = colors.black,
        fg = {
            normal = colors.vivid_blue,
            insert = colors.red,
            visual = colors.yellow,
            command = colors.green,
            other = colors.black,
        }
    },
    filename = {fg = colors.purple, bg = colors.black},
    git_branch = {fg = colors.green, bg = colors.black},
    git_diff = {
        bg = colors.black,
        fg = {
            added = colors.green,
            removed = colors.red,
        }
    },
    active_clients = {fg = colors.yellow, bg = colors.black},
    lsp_diagnostics = {
        bg = colors.black,
        fg = {
            error = colors.red,
            warning = colors.orange,
            info = colors.vivid_blue,
            hint = colors.green,
        }
    },
    cursor_position = {fg = colors.light_blue, bg = colors.black},
    line_col = {fg = colors.light_blue, bg = colors.black},
    virtual_env = {fg = colors.yellow, bg = colors.black},
}
