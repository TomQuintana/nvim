return {
  "3rd/image.nvim",
  build = false,
  lazy = false,        -- ← forzá que cargue al inicio
  priority = 100,      -- ← que cargue antes que otros plugins
  config = function()  -- ← usá config en lugar de opts
    require("image").setup({
      backend = "kitty",
      kitty_method = "normal",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { "markdown" },
          resolve_image_path = function(document_path, image_path, fallback)
            local vault_path = vim.fn.expand("~/workspace/tom-notes-obsidian")
            local wiki_path = vault_path .. "/" .. image_path
            if vim.fn.filereadable(wiki_path) == 1 then
              return wiki_path
            end
            return fallback(document_path, image_path)
          end,
        },
      },
      max_width = 80,
      max_height = 20,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    })
  end,
}
