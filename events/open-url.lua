local wezterm = require('wezterm')

local M = {}

M.setup = function()
   wezterm.on('open-uri', function(window, pane, uri)
      local scheme
      local bucket, path

      -- 1️⃣ 匹配 s3+bos://
      if uri:find('^s3%+bos://') then
         scheme = 's3+bos'
         bucket, path = uri:match('^s3%+bos://([^/]+)/?(.*)')

      -- 2️⃣ 匹配普通 s3://
      elseif uri:find('^s3://') then
         scheme = 's3'
         bucket, path = uri:match('^s3://([^/]+)/?(.*)')
      else
         return
      end

      if not bucket then
         return
      end

      -- 3️⃣ 默认域名
      local base = 'https://oss.iap.qy.machdrive.cn'

      -- 4️⃣ BOS 规则（优先级：s3+bos > bucket规则）
      if
         scheme == 's3+bos'
         or bucket:find('^bos%-')
         or bucket == 'hdmap-rhea-data'
         or bucket == 'z10-rhea-2504-data'
         or bucket == 'z10-rhea-2505-data'
         or bucket == 'z10-rhea-data'
      then
         base = 'https://bos.mc.machdrive.cn'
      end

      -- 5️⃣ 拼接 URL
      local new_url
      if path ~= '' then
         new_url = string.format('%s/%s/%s', base, bucket, path)
      else
         new_url = string.format('%s/%s', base, bucket)
      end

      -- 6️⃣ 打开
      wezterm.open_with(new_url)

      return false
   end)
end

return M
