local function setup(config)
    config = config == nil and {} or config
    local utils = require('lunarline.utils')
    utils.load_options(config.options)

    if config == {} or (config.theme == nil and config.colors == nil) then
        config.colors = require('lunarline.themes.original')
    elseif config.colors == nil and config.theme ~= nil then
        local status
        status, config.colors = pcall(function ()
            return require('lunarline.themes.' .. config.theme)
        end)
        if not status then
            vim.api.nvim_err_writeln("No such lunarline theme exists. Defaulting to original")
            config.colors = require('lunarline.themes.original')
        end
    end
    utils.load_theme(config.colors)
end

return {
    setup = setup,
}
