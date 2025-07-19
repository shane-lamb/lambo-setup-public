const keyToManipulators = {
    '1': toSuper('1'), // for window resizing with rectangle
    '2': toSuper('2'), // for window resizing with rectangle
    '3': toSuper('3'), // for window resizing with rectangle
    '4': toSuper('4'), // for window resizing with rectangle
    'a': aWithDots(),
    'd': toKey('grave_accent_and_tilde', ['command', 'shift']), // prev window in app group
    'f': toKey('grave_accent_and_tilde', ['command']), // next window in app group
    'i': open('IntelliJ Idea Ultimate', 'com.jetbrains.intellij'), // (i)de
    's': oWithDots(),
    't': open('wezterm'), // (t)erminal
    'v': open('obsidian'), // (v)ault
    'w': open('Safari.app', 'com.apple.Safari'), // (w)eb
}

const config = require('./base.karabiner.json')

const profile = config.profiles[0]
const rule = profile.complex_modifications.rules.find(r => r.description === 'Set semicolon key to act as a modifier')
const target = rule.manipulators

Object.entries(keyToManipulators).forEach(([fromKeyCode, getManipulators]) => {
    const manipulators = getManipulators(fromKeyCode)
    target.push(...manipulators)
})

require('fs').writeFileSync('karabiner.json', JSON.stringify(config, null, 4))

function toKey(toKeyCode, modifiers) {
    const actions = genKeyAction(toKeyCode, modifiers)
    return (fromKeyCode) => [genManipulator(fromKeyCode, actions)]
}

function toSuper(keyCode) {
    return toKey(keyCode, ['left_command', 'left_alt', 'left_control', 'left_shift'])
}

function open(appName, bundleIdentifier) {
    const openAppAction = [
        {
            shell_command: `open -a '${appName}'`
        }
    ]
    if (bundleIdentifier) {
        // enable switching between app windows when app already open
        const conditions = (type) => [{ type, bundle_identifiers: [bundleIdentifier] }]
        return (fromKeyCode) => [
            genManipulator(fromKeyCode, openAppAction, conditions('frontmost_application_unless')),
            genManipulator(
                fromKeyCode,
                genKeyAction('grave_accent_and_tilde', ['command']),
                conditions('frontmost_application_if')
            ),
        ]
    }
    return (fromKeyCode) => [genManipulator(fromKeyCode, openAppAction)]
}

function aWithDots() {
    const actions = aWithDotsActions()
    return (fromKeyCode) => [genManipulator(fromKeyCode, actions)]
}

function oWithDots() {
    const actions = oWithDotsActions()
    return (fromKeyCode) => [genManipulator(fromKeyCode, actions)]
}

function genManipulator(fromKeyCode, toActions, extraConditions = []) {
    return {
        type: 'basic',
        conditions: [
            {
                type: 'variable_if',
                name: 'semicolon_modifier_active',
                value: 1
            }
        ].concat(extraConditions),
        from: {
            key_code: fromKeyCode
        },
        to: toActions
    }
}

function genKeyAction(keyCode, modifiers = []) {
    return [
        {
            key_code: keyCode,
            modifiers
        }
    ]
}

function aWithDotsActions() {
    return [
        {key_code: "keypad_plus", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "e", modifiers: ["left_alt"]},
        {key_code: "4", modifiers: ["left_alt"]}
    ]
}

function oWithDotsActions() {
    return [
        {key_code: "keypad_plus", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "0", modifiers: ["left_alt"]},
        {key_code: "f", modifiers: ["left_alt"]},
        {key_code: "6", modifiers: ["left_alt"]}
    ]
}
