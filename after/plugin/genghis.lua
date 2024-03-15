vim.api.nvim_create_user_command("Trash", function() require("genghis").trashFile({ trashCmd = "rm" }) end, { desc = "Delete current file" })
