local wezterm = require('wezterm')

---@class Config
---@field options table
local Config = {}
Config.__index = Config

---Initialize Config
---@return Config
function Config:init()
   local config = setmetatable({ options = {} }, self)
   return config
end

---Append to `Config.options`
---@param new_options table new options to append
---@return Config
function Config:append(new_options)
   for k, v in pairs(new_options) do
      if self.options[k] ~= nil then
         if k == 'keys' then
            -- self.options[k] = {table.unpack(self.options[k]), table.unpack(new_options[k])}
            -- local merge_keys = {table.unpack(self.options[k]), table.unpack(new_options[k])}
            local merge_keys = new_options[k]
            for _, vv in ipairs(self.options[k]) do
               table.insert(merge_keys, vv)
            end
            self.options[k] = merge_keys
            goto continue
         end
         wezterm.log_warn(
            'Duplicate config option detected: ',
            { old = self.options[k], new = new_options[k] }
         )
         goto continue
      end
      self.options[k] = v
      ::continue::
   end
   return self
end

return Config
