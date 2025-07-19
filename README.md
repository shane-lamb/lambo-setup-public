# lambo-setup-public
My mac setup: brew installs, zsh setup, etc.

# Steps
1. Run the `bootstrap.sh` script remotely:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shane-lamb/lambo-bootstrap-public/HEAD/setup.sh)"
```
2. Run other setup files as needed locally, since the repo will have been cloned.

# IntelliJ
## Sync settings and plugins
Use "settings sync" you can sync settings with your Jetbrains account - this is the simplest and best solution available right now:
https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#IDE_settings_sync

Note: It won't work with community edition, you need Ultimate.

## Useful key bindings

| key     | action       | note                     |
|---------|--------------|--------------------------|
| CMD + 0 | Commit       | Open/close changed files |
| CMD + K | Commit...    | Enter commit message     |
| CMD + 1 | Project      | Open/close file browser  |
| CMD + e | Recent Files |                          |

## My custom key bindings

| key       | action             | note                         |
|-----------|--------------------|------------------------------|
| CMD + ;   | Terminal           | Open/close embedded terminal |
| SUPER + i | Manage Projects... | Open project selector        |

## Some cool plugins
- Darcula Darker Theme
- IdeaVim + IdeaVim-Quickscope

# Stuff
I needed to set my input source as "Unicode Hex Input" so that I could use the `Alt` key on my keyboard:
![img_1.png](img_1.png)

`Ctrl+space` is reserved as an OS shortcut by default, you'll need to go and disable this so you can use it for completion in your IDE:
![img.png](img.png)

To invert scrolling direction, go to `Settings > Trackpad > Scroll & Zoom > Natural Scrolling`
