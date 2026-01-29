import { KarabinerConfig } from './karabiner-types'
import { manipulators } from './manipulators'

const config: KarabinerConfig = require('./base.karabiner.json')
const profile = config.profiles[0]

const rule = profile.complex_modifications.rules.find((r) => r.description === 'Set semicolon key to act as a modifier')
if (rule) {
    rule.manipulators.push(...manipulators)
}

require('fs').writeFileSync('karabiner.json', JSON.stringify(config, null, 4))
