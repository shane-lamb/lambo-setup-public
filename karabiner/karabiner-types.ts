export interface KarabinerConfig {
    profiles: KarabinerProfile[]
}

export interface KarabinerProfile {
    name: string
    complex_modifications: { rules: KarabinerRule[] }
}

export interface KarabinerRule {
    description: string
    manipulators: Manipulator[]
}

export interface Manipulator {
    type: 'basic'
    conditions: Condition[]
    from: KeyCombo
    to: Action[]
}

export type Action = ShellCommand | KeyCombo

export interface ShellCommand {
    shell_command: string
}

export type Condition = VariableCondition | FrontmostApplicationCondition

export interface VariableCondition {
    type: 'variable_if'
    name: string
    value: number
}

export interface FrontmostApplicationCondition {
    type: 'frontmost_application_if' | 'frontmost_application_unless'
    bundle_identifiers: string[]
}

export interface KeyCombo {
    key_code: string
    modifiers?: ModifierKey[]
}

export type ModifierKey = 'left_command' | 'left_alt' | 'left_control' | 'left_shift'
