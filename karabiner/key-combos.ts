import { KeyCombo, ModifierKey } from './karabiner-types'

export const keyCombos = {
    aWithDots: altSeries(['0', '0', 'e', '4']),
    oWithDots: altSeries(['0', '0', 'f', '6']),
    super: (keyCode: string) => keyCombo(keyCode, ['left_command', 'left_alt', 'left_control', 'left_shift']),
    nextAppWindow: keyCombo('grave_accent_and_tilde', ['left_command']),
    prevAppWindow: keyCombo('grave_accent_and_tilde', ['left_command', 'left_shift']),
    nextTab: keyCombo('tab', ['left_control']),
    prevTab: keyCombo('tab', ['left_shift', 'left_control']),
    none: keyCombo('vk_none')
}

function altSeries(keyCodes: string[]): KeyCombo[] {
    return keyCodes.map((keyCode) => keyCombo(keyCode, ['left_alt']))
}

export function keyCombo(keyCode: string, modifiers: ModifierKey[] = []): KeyCombo {
    return { key_code: keyCode, modifiers }
}
