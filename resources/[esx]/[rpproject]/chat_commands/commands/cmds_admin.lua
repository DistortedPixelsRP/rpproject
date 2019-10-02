-- A simple announcement command locked behind administrator access.
CommandPack("Administrator Commands Example", "glitchdetector", {
    -- Add commands here
    -- Administrator Announcement
    {
        command = "announce",
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(110, 0, 135, 1); border-radius: 3px;"><i class="fas fa-ad"></i> A N U N C I O:<br> {1}<br></div>',
        format = "#message#",
        title = "[ADMINISTRATOR] ANUNCIO",
        help = "Administrator Announcement",
        usage = "/announce [announcement]",
        args = {{name = "announcement", help = "The message to announce"}},
        color = {255, 0, 0},
    },
}, {
    -- Default values, if one is not specified for the command
    admin = true,
    noperm = "You do not have permission to use this command.",
})
