local platform = require('utils.platform')

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'nu' }
   options.launch_menu = {
      -- { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
      { label = 'Nushell', args = { 'nu' } },
      -- { label = 'PowerShell Desktop', args = { 'powershell' } },
      -- { label = 'Command Prompt', args = { 'cmd' } },
      -- { label = 'Msys2', args = { 'ucrt64.cmd' } },
      -- {
      --    label = 'Git Bash',
      --    args = { 'D:\\Apps\\scoop\\apps\\git\\current\\bin\\bash.exe' },
      -- },
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'zsh', '-l' }
   options.launch_menu = {
      --      { label = 'Bash', args = { 'bash', '-l' } },
      --      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Localhost', args = { 'zsh', '-l' } },
   }
end

local qianli_menu = {
   { label = 'ssh:qy-dev',
     args = { 'autossh', '-M', '0', 'qy-dev', '-t', 'byobu' },
     set_environment_variables = {AUTOSSH_PATH='C:/windows/System32/OpenSSH/ssh.exe'}
   },
   {
      label = 'bip:训练集群',
      args = { 'autossh', '-M', '0','qy-dev', '-t', 'bash -lc "/home/jitao/.local/bin/bipctl sh mc-gpu-l20-0011 -u root"' },
      set_environment_variables = {AUTOSSH_PATH='C:/windows/System32/OpenSSH/ssh.exe'}
   },
   {
      label = 'bip:推理集群',
      args = { 'autossh', '-M', '0','qy-dev', '-t', 'bash -lc "/home/jitao/.local/bin/bipctl sh mc-airflow-cpu-0435"' },
      set_environment_variables = {AUTOSSH_PATH='C:/windows/System32/OpenSSH/ssh.exe'}
   },
   {
      label = 'bip:gpfs1',
      args = { 'autossh', '-M', '0','qy-dev', '-t', 'bash -lc "/home/jitao/.local/bin/bipctl sh gpfs-034"' },
      set_environment_variables = {AUTOSSH_PATH='C:/windows/System32/OpenSSH/ssh.exe'}
   },
   {
      label = 'bip:gpfs2',
      args = { 'autossh', '-M', '0','qy-dev', '-t', 'bash -lc "/home/jitao/.local/bin/bipctl sh 10.249.106.11"' },
      set_environment_variables = {AUTOSSH_PATH='C:/windows/System32/OpenSSH/ssh.exe'}
   }
}

for _, v in ipairs(qianli_menu) do
   table.insert(options.launch_menu, v)
end

return options
