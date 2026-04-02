return {
   -- behaviours
   automatically_reload_config = true,
   exit_behavior = 'CloseOnCleanExit', -- if the shell program exited with a successful status
   exit_behavior_messaging = 'Verbose',
   status_update_interval = 1000,
   audible_bell = 'Disabled',

   scrollback_lines = 20000,

   hyperlink_rules = {
      {
         regex = '\\(([a-zA-Z][a-zA-Z0-9+.-]*://\\S+)\\)',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '\\[([a-zA-Z][a-zA-Z0-9+.-]*://\\S+)\\]',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '\\{([a-zA-Z][a-zA-Z0-9+.-]*://\\S+)\\}',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '<([a-zA-Z][a-zA-Z0-9+.-]*://\\S+)>',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '\\b[a-zA-Z][a-zA-Z0-9+.-]*://\\S+[)/a-zA-Z0-9-]+',
         format = '$0',
      },
      {
         regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
         format = 'mailto:$0',
      },
   },
}
