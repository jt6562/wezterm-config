local wezterm = require('wezterm')
local platform = require('utils.platform')

-- local font_family = 'Maple Mono NF'
-- local font_family = 'JetBrainsMono Nerd Font'
-- local font_family = 'CartographCF Nerd Font'

local font_size = platform.is_mac and 12 or 9

-- 中文
return {
   font = wezterm.font_with_fallback({
      {
         family = 'JetBrains Mono',
         weight = 'Regular',
         harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
      },
      {
         family = 'Microsoft YaHei UI',
         weight = 'Regular',
      },
   }),
   font_size = font_size,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
