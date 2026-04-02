local platform = require('utils.platform')

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh', '-NoLogo' }
   options.launch_menu = {
      { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Nushell', args = { 'nu' } },
      { label = 'Msys2', args = { 'ucrt64.cmd' } },
      {
         label = 'Git Bash',
         args = { 'C:\\Users\\kevin\\scoop\\apps\\git\\current\\bin\\bash.exe' },
      },
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
      { label = 'ssh:qy-dev', args = { '/home/jitao/.local/bin/sshx', 'qy-dev', '-t', 'byobu' } },
      -- { label = 'ssh:qy-dev', args = { 'ssh', 'qy-dev', '-t', 'byobu' } },
      { label = 'ssh:e2edata', args = { 'autossh', 'e2e', '-t', 'byobu' } },
      {
         label = 'bip:训练集群',
         args = { 'zsh', '-l', '-c', 'bipctl -c /home/jitao/.bipctl sh mc-gpu-l20-0011 -u root' },
      },
      {
         label = 'bip:推理集群',
         args = { 'zsh', '-l', '-c', 'bipctl -c /home/jitao/.bipctl sh mc-airflow-cpu-0435' },
      },
      {
         label = 'bip:gpfs1',
         args = { 'zsh', '-l', '-c', 'bipctl -c /home/jitao/.bipctl sh gpfs-034' },
      },
      {
         label = 'bip:gpfs2',
         args = { 'zsh', '-l', '-c', 'bipctl -c /home/jitao/.bipctl sh 10.249.106.11' },
      },
   }
end

return options
