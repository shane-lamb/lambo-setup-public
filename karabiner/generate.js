const semicolonKeyMappings = {
    'd': toKey('grave_accent_and_tilde', ['command', 'shift']), // prev window in app group
    'f': toKey('grave_accent_and_tilde', ['command']), // next window in app group
    'w': open('Safari.app'), // (w)eb
    'i': open('IntelliJ Idea Ultimate'), // (i)de
    't': open('wezterm'), // (t)erminal
    'v': open('obsidian'), // (v)ault
    'a': aWithDots(),
    's': oWithDots(),
}

const config = require('./base.karabiner.json')

const profile = config.profiles[0]
const rule = profile.complex_modifications.rules.find(r => r.description === 'Set semicolon key to act as a modifier')
const manipulators = rule.manipulators

Object.entries(semicolonKeyMappings).forEach(([keyCode, actions]) => {
    manipulators.push(semicolonKeyManipulator(keyCode, actions))
})

require('fs').writeFileSync('karabiner.json', JSON.stringify(config, null, 4))

function semicolonKeyManipulator(keyCode, actions) {
    return {
        type: 'basic',
        conditions: [
            {
                type: 'variable_if',
                name: 'semicolon_modifier_active',
                value: 1
            }
        ],
        from: {
            key_code: keyCode
        },
        to: actions
    }
}

function open(appName) {
    return [
        {
            shell_command: `open -a '${appName}'`
        }
    ]
}

function toKey(keyCode, modifiers = []) {
    return [
        {
            key_code: keyCode,
            modifiers
        }
    ]
}

function aWithDots() {
    return [
        {key_code: "keypad_plus", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "e", modifiers: ["left_alt"]},
        {key_code: "4", modifiers: ["left_alt"]}
    ]
}

function oWithDots() {
    return [
        {key_code: "keypad_plus", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "f", modifiers: ["left_alt"]},
        {key_code: "6", modifiers: ["left_alt"]}
    ]
}
