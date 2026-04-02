local platform = require('utils.platform')

local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then
   options.ssh_domains = {
      {
         name = 'ssh:wsl',
         remote_address = 'localhost',
         multiplexing = 'None',
         default_prog = { 'fish', '-l' },
         assume_shell = 'Posix',
      },
   }

   options.wsl_domains = {
      {
         name = 'wsl:ubuntu-fish',
         distribution = 'Ubuntu',
         username = 'kevin',
         default_cwd = '/home/kevin',
         default_prog = { 'fish', '-l' },
      },
      {
         name = 'wsl:ubuntu-bash',
         distribution = 'Ubuntu',
         username = 'kevin',
         default_cwd = '/home/kevin',
         default_prog = { 'bash', '-l' },
      },
   }
   -- elseif platform.is_linux then
   -- -- Note: install wezterm on remote host
   --    options.ssh_domains = {
   --       {
   --          name = 'ssh:qy-dev',
   --          remote_address = 'qy.machdrive.cn',
   --          username = 'dev.jitao.mach-mdriver.ws',
   --          multiplexing = 'None',
   --          -- remote_command = { "byobu" },
   --          -- default_prog = { 'ssh', '-t', 'dev.jitao.mach-mdriver.ws@qy.machdrive.cn', 'byobu' },
   --          -- default_prog = { 'zsh', '-c', 'ssh -t -vvv qy-dev byobu' },
   --          assume_shell = 'Posix',
   --          ssh_option = {
   --             identityfile = '/home/jitao/.ssh/id_rsa',
   --          },
   --       },
   --    }
end

return options
