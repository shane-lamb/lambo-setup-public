import { Action, Condition, KeyCombo, Manipulator, ModifierKey, VariableCondition } from './karabiner-types'
import { keyCombo, keyCombos } from './key-combos'

export const manipulators: Manipulator[] = []

// https://github.com/JoshuaManuel/Karabiner-Elements-Key-List

let baseConditions: VariableCondition[] = [
    {
        type: 'variable_if',
        name: 'semicolon_modifier_active',
        value: 1,
    },
    {
        type: 'variable_if',
        name: 'alt_modifier_active',
        value: 0,
    },
]
const semicolonManipulators: { [keyCode: string]: ManipulatorFunc } = {
    '1': toSuper('1'), // for window resizing with rectangle
    '2': toSuper('2'), // for window resizing with rectangle
    '3': toSuper('3'), // for window resizing with rectangle
    '4': toSuper('4'), // for window resizing with rectangle
    a: toKeys(keyCombos.aWithDots),
    d: toKey('delete_or_backspace'),
    f: toKey('delete_forward'),
    h: toKey('left_arrow'),
    j: toKey('down_arrow'),
    k: toKey('up_arrow'),
    l: toKey('right_arrow'),
    i: open('IntelliJ IDEA', 'com.jetbrains.intellij', keyCombos.super('i')), // (i)de or (i)ntellij
    s: toKey('return_or_enter'),
    t: open('wezterm'), // (t)erminal
    v: open('obsidian', 'md.obsidian', keyCombos.super('v')), // (v)ault
    w: open('Google Chrome.app', 'com.apple.Safari', keyCombo('l', ['left_command'])), // (w)eb
    q: toSuper('w'), // close project window in IntelliJ
    comma: toKey(keyCombos.prevTab),
    period: toKey(keyCombos.nextTab),
}
manipulators.push(...getManipulators(semicolonManipulators))

baseConditions = [
    {
        type: 'variable_if',
        name: 'alt_modifier_active',
        value: 1,
    },
]
const altManipulators: { [keyCode: string]: ManipulatorFunc } = {
    d: toKey('delete_or_backspace', ['left_alt']),
    f: toKey('delete_forward', ['left_alt']),
    h: toKey('left_arrow', ['left_alt']),
    j: toKey('down_arrow', ['left_alt']),
    k: toKey('up_arrow', ['left_alt']),
    l: toKey('right_arrow', ['left_alt']),
}
manipulators.push(...getManipulators(altManipulators))

function getManipulators(mapping: { [keyCode: string]: ManipulatorFunc }): Manipulator[] {
    return Object.entries(mapping).flatMap(([fromKeyCode, getManipulators]) => {
        return getManipulators(fromKeyCode)
    })
}

function toKeys(keyCombos: KeyCombo[]): ManipulatorFunc {
    return (fromKeyCode: string) => [genManipulator(fromKeyCode, keyCombos)]
}

function toKey(key: string | KeyCombo, modifiers: ModifierKey[] = []): ManipulatorFunc {
    const combos = typeof key === 'string' ? keyCombo(key, modifiers) : key
    return toKeys([combos])
}

function toSuper(key: string) {
    return toKey(keyCombos.super(key))
}

function open(
    appName: string,
    bundleIdentifier?: string,
    toKeyCombo: KeyCombo = keyCombos.nextAppWindow,
): ManipulatorFunc {
    const openAppAction = [
        {
            shell_command: `open -a '${appName}'`,
        },
    ]
    if (bundleIdentifier) {
        // enable switching between app windows when app already open
        const bundle_identifiers = [bundleIdentifier]
        return (fromKeyCode: string) => [
            genManipulator(fromKeyCode, openAppAction, [
                {
                    type: 'frontmost_application_unless',
                    bundle_identifiers,
                },
            ]),
            genManipulator(
                fromKeyCode,
                [toKeyCombo],
                [
                    {
                        type: 'frontmost_application_if',
                        bundle_identifiers,
                    },
                ],
            ),
        ]
    }
    return (fromKeyCode: string) => [genManipulator(fromKeyCode, openAppAction)]
}

function genManipulator(fromKeyCode: string, toActions: Action[], extraConditions: Condition[] = []): Manipulator {
    return {
        type: 'basic',
        conditions: [...baseConditions, ...extraConditions],
        from: {
            key_code: fromKeyCode,
        },
        to: toActions,
    }
}

type ManipulatorFunc = (keyCode: string) => Manipulator[]
