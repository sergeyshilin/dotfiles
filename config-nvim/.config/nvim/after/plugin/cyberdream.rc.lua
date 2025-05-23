local status, cyberdream = pcall(require, "cyberdream")
if (not status) then return end

cyberdream.setup({
    -- Set light or dark variant
    variant = "light",

    -- Enable italics comments
    italic_comments = true,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = true,

    -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
    borderless_pickers = false,

    -- Set terminal colors used in `:terminal`
    terminal_colors = true,

    -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
    cache = false,

    -- Disable or enable colorscheme extensions
    extensions = {
        telescope = true,
    },
})
