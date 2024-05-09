return {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    local map = vim.keymap.set

    map("n", "<leader>ghs", gs.stage_hunk, opts "git [s]tage hunk")
    map("n", "<leader>ghr", gs.reset_hunk, opts "git [r]eset hunk")
    map("n", "<leader>ghS", gs.stage_buffer, opts "git [S]tage buffer")
    map("n", "<leader>ghu", gs.undo_stage_hunk, opts "git [u]ndo stage hunk")
    map("n", "<leader>ghR", gs.reset_buffer, opts "git [R]eset buffer")
    map("n", "<leader>ghp", gs.preview_hunk, opts "git [p]review hunk")
    map("n", "<leader>ghb", gs.blame_line, opts "git [b]lame line")
    map("n", "<leader>ghd", gs.diffthis, opts "git [d]iff against index")
  end,
}
