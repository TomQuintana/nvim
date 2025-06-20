return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup({
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      cwd_change_handling = true,
      -- Opciones para auto-carga y auto-guardado
      auto_session_enable_last_session_auto_load = true,
      auto_session_enable_local_session_auto_load = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      -- Comandos pre y post cambio de directorio
      pre_cwd_changed_cmds = {
        "tabdo NERDTreeClose" -- Cierra NERDTree antes de guardar la sesión
      },
      post_cwd_changed_cmds = {
        function()
          require("lualine").refresh() -- Ejemplo: refresca la línea de estado de Lualine DESPUÉS de que el directorio de trabajo cambie
        end
      }
    })
  end
}
