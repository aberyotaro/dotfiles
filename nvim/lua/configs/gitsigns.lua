return {
  on_attach = function(bufnr)
    local gs = require "gitsigns"

    local map = vim.keymap.set

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal { "]c", bang = true }
      else
        gs.nav_hunk "next"
      end
    end)

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal { "[c", bang = true }
      else
        gs.nav_hunk "prev"
      end
    end)

    -- Actions
    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk, opts "git [s]tage hunk")
    map("n", "<leader>hr", gs.reset_hunk, opts "git [r]eset hunk")
    map("v", "<leader>hs", function()
      gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, opts "git [s]tage hunk")
    map("v", "<leader>hr", function()
      gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, opts "git [r]eset hunk")
    map("n", "<leader>hS", gs.stage_buffer, opts "git [S]tage buffer")
    map("n", "<leader>hu", gs.undo_stage_hunk, opts "git [u]ndo stage hunk")
    map("n", "<leader>hR", gs.reset_buffer, opts "git [R]eset buffer")
    map("n", "<leader>hp", gs.preview_hunk, opts "git [p]review hunk")
    map("n", "<leader>hb", function()
      gs.blame_line { full = true }
    end, opts "git [b]lame line")
    map("n", "<leader>tb", gs.toggle_current_line_blame, opts "git toggle current [b]lame line")
    map("n", "<leader>hd", gs.diffthis, opts "git [d]iff against index")
    map("n", "<leader>hD", function()
      gs.diffthis "~"
    end, opts "git [D]iff against HEAD")
    map("n", "<leader>td", gs.toggle_deleted, opts "git toggle [d]eleted")
  end,
}
