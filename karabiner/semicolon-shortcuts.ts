import { Action, Condition, KeyCombo, Manipulator, ModifierKey } from './karabiner-types'
import { keyCombo, keyCombos } from './key-combos'

const keyToManipulators: { [keyCode: string]: ManipulatorFunc } = {
    '1': toSuper('1'), // for window resizing with rectangle
    '2': toSuper('2'), // for window resizing with rectangle
    '3': toSuper('3'), // for window resizing with rectangle
    '4': toSuper('4'), // for window resizing with rectangle
    a: toKeys(keyCombos.aWithDots),
    d: toKey(keyCombos.prevAppWindow),
    f: toKey(keyCombos.nextAppWindow),
    i: open('IntelliJ Idea Ultimate', 'com.jetbrains.intellij', keyCombos.super('i')), // (i)de or (i)ntellij
    s: toKeys(keyCombos.oWithDots),
    t: open('wezterm'), // (t)erminal
    v: open('obsidian', 'md.obsidian', keyCombos.super('v')), // (v)ault
    w: open('Safari.app', 'com.apple.Safari', keyCombo('l', ['left_command'])), // (w)eb
    q: toSuper('w'), // close project window in IntelliJ
}

export function getSemicolonManipulators(): Manipulator[] {
    return Object.entries(keyToManipulators).flatMap(([fromKeyCode, getManipulators]) => {
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
        conditions: [
            {
                type: 'variable_if',
                name: 'semicolon_modifier_active',
                value: 1,
            },
            ...extraConditions,
        ],
        from: {
            key_code: fromKeyCode,
        },
        to: toActions,
    }
}

type ManipulatorFunc = (keyCode: string) => Manipulator[]
