local colors = {
    fg = '#444444',
    bg = '#fafafa',
    bg_alt = "#bcbcbc",
    focus = '#005f87',
}

theme {
    font_name = 'Fira Code',
    font_size = 13,
    bar_growth = 4,
    info_margins = 10,

    master_width = 0.6,

    useless_gap = 2,
    gap_single_client = false,

    border_width = 3,
    notification_border_width = 1,

    fg_normal = colors.fg,
    bg_normal = colors.bg,
    bg_normal_alt = colors.bg_alt,
    border_normal = colors.bg,
    border_normal_floating = colors.bg_alt,
    notification_border_color = colors.fg,

    fg_focus = colors.bg,
    bg_focus = colors.focus,
    border_focus = colors.focus,

    desktop_wallpaper = colors.bg,

    clock_format = '<span size=\'smaller\' rise=\'1000\'></span> %a, %b %e  %l:%M%P',
}
