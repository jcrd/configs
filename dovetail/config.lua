local editor = 'lvim'

include('theme.lua')

options {
    workspace_search_paths = {'~/code', '~/projects'},
}

notifications {
    position = 'top_middle',
    timeout = 5,
}

local clients = {
    browser = {
        cmd = 'qutebrowser --target window',
        factory = 'qutebrowser',
        id = 'stack_browser',
    },
    master_browser = {
        cmd = 'qutebrowser --target window',
        factory = 'qutebrowser',
        id = 'master_browser',
        set_master = true,
    },
    chromium = {
        cmd = 'chromium-freeworld',
        factory = 'chromium',
        rule = {class = 'Chromium-freeworld'},
    },
    master_term = {
        cmd = 'kitty',
        id = 'master_term',
        set_master = true,
    },
    stack_term = {
        cmd = 'kitty',
        id = 'stack_term',
    },
    panel = {
        cmd = 'kitty',
        id = 'panel_terminal',
        scale = 0.6,
    },
    taskwiki = {
        cmd = format('kitty zsh -c "exec %s ~/tasks/index.md"', editor),
        id = 'panel_taskwiki',
        scale = 0.6,
    },
}

workspace_clients(clients)

local workspaces = {
    edit = {
        name = 'edit',
        clients = { format('kitty -e %s', editor) },
    },
}

keys {
    -- Menu.
    ['M-p'] = cmd.menu.run,
    ['M-S-p'] = cmd.menu.run_workspace,
    ['M-w'] = cmd.menu.new_workspace,
    ['M-r'] = cmd.menu.rename_workspace,
    ['M-l'] = {cmd.spawn, 'passless-rofi'},
    ['M-e'] = {cmd.workspace.new, workspaces.edit},

    -- Launch clients.
    ['M-Return'] = {cmd.launch, clients.master_term},
    ['M-backslash'] = {cmd.launch, clients.stack_term},
    ['M-b'] = {cmd.launch, clients.browser},
    ['M-S-b'] = {cmd.launch, clients.master_browser},
    ['M-c'] = {cmd.launch, clients.chromium},
    ['M-grave'] = {cmd.workspace.toggle_panel, clients.panel},
    ['M-slash'] = {cmd.workspace.toggle_panel, clients.taskwiki},

    -- Workspaces.
    ['M-Tab'] = cmd.workspace.restore,
    ['M-S-j'] = cmd.workspace.next,
    ['M-S-k'] = cmd.workspace.prev,
    ['M-<numrow>'] = cmd.workspace.view,
    ['M-S-<numrow>'] = cmd.client.follow_to_workspace,
    ['M-C-<numrow>'] = cmd.client.move_to_workspace,
    ['M-period'] = {cmd.workspace.adjust_width, 0.1},
    ['M-comma'] = {cmd.workspace.adjust_width, -0.1},

    -- Clients.
    ['M-j'] = cmd.client.focus.next,
    ['M-k'] = cmd.client.focus.prev,
    ['M-s'] = cmd.client.focus.other,
    ['M-S-s'] = cmd.client.focus.other_layer,
    ['M-o'] = cmd.client.toggle_max,
    ['M-f'] = cmd.client.toggle_focal,
    ['M-S-x'] = cmd.client.unminimize,

    -- Session.
    ['M-BackSpace'] = cmd.session.lock,
    ['M-Up'] = cmd.session.brightness.inc,
    ['M-Down'] = cmd.session.brightness.dec,

    -- Audio.
    ['XF86AudioLowerVolume'] = cmd.audio.volume.dec,
    ['XF86AudioRaiseVolume'] = cmd.audio.volume.inc,
    ['XF86AudioMute'] = cmd.audio.mute.toggle,

    -- Pomodoro.
    ['M-t'] = cmd.pomodoro.toggle,
    ['M-S-t'] = cmd.pomodoro.stop,
    ['M-S-r'] = cmd.pomodoro.restart,

    -- Screenshot.
    ['Print'] = cmd.screenshot.take,
    ['S-Print'] = cmd.screenshot.take_region,

    -- Window manager.
    ['M-C-r'] = cmd.wm.restart,
    ['M-C-q'] = cmd.wm.quit,

    -- System.
    ['M-C-minus'] = cmd.system.poweroff,
    ['M-C-equal'] = cmd.system.suspend,

    -- Misc.
    ['M-m'] = cmd.mouse.hide,
    ['M-d'] = cmd.notification.destroy_all,

    -- Util.
    ['M-i'] = cmd.util.clientinfo,
}

client_keys {
    ['M-a'] = cmd.client.set_master,
    ['M-S-d'] = cmd.client.close,
    ['M-space'] = cmd.client.toggle_floating,
    ['M-g'] = cmd.client.toggle_fullscreen,
    ['M-n'] = cmd.client.normalize,
    ['M-z'] = cmd.client.replace,
    ['M-x'] = cmd.client.minimize,
}

buttons {
    ['1'] = cmd.mouse.focus,
    ['M-1'] = cmd.mouse.move,
    ['M-3'] = cmd.mouse.resize,
}

rules {
    {
        rule = {class = 'Chromium-freeworld'},
        names = 'Netflix',
        inhibit = true,
    },
    {
        rule = {class = 'mpv'},
        inhibit = true,
    },
}

include('chassis.lua')
