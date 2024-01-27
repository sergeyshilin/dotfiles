local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
    options = {
        mode = "tabs",
        show_buffer_close_icons = false,
    }
})

