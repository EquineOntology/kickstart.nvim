-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'harrisoncramer/gitlab.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'stevearc/dressing.nvim', -- Recommended but not required. Better UI for pickers.
      'nvim-tree/nvim-web-devicons', -- Recommended but not required. Icons in discussion tree.
    },
    enabled = true,
    build = function()
      require('gitlab.server').build(true)
    end, -- Builds the Go binary
    config = function()
      require('gitlab').setup()

      local gitlab = require 'gitlab'
      vim.keymap.set('n', '<leader>glb', gitlab.choose_merge_request, { desc = 'choose MR' })
      vim.keymap.set('n', '<leader>glw', gitlab.review, { desc = 'review MR' })
      vim.keymap.set('n', '<leader>gls', gitlab.summary, { desc = 'MR summary' })
      vim.keymap.set('n', '<leader>glA', gitlab.approve, { desc = 'approve MR' })
      vim.keymap.set('n', '<leader>glR', gitlab.revoke, { desc = 'revoke MR' })
      vim.keymap.set('n', '<leader>glc', gitlab.create_comment, { desc = 'create comment' })
      vim.keymap.set('v', '<leader>glc', gitlab.create_multiline_comment, { desc = 'create multiline comment' })
      vim.keymap.set('v', '<leader>glC', gitlab.create_comment_suggestion, { desc = 'create comment suggestion' })
      vim.keymap.set('n', '<leader>glO', gitlab.create_mr, { desc = 'create MR' })
      vim.keymap.set('n', '<leader>glm', gitlab.move_to_discussion_tree_from_diagnostic, { desc = 'move from diagnostic to tree' })
      vim.keymap.set('n', '<leader>gln', gitlab.create_note, { desc = 'create note' })
      vim.keymap.set('n', '<leader>gld', gitlab.toggle_discussions, { desc = 'toggle discussions' })
      vim.keymap.set('n', '<leader>glaa', gitlab.add_assignee, { desc = 'add assignee' })
      vim.keymap.set('n', '<leader>glad', gitlab.delete_assignee, { desc = 'delete assignee' })
      vim.keymap.set('n', '<leader>glla', gitlab.add_label, { desc = 'add label' })
      vim.keymap.set('n', '<leader>glld', gitlab.delete_label, { desc = 'delete label' })
      vim.keymap.set('n', '<leader>glra', gitlab.add_reviewer, { desc = 'add reviewer' })
      vim.keymap.set('n', '<leader>glrd', gitlab.delete_reviewer, { desc = 'delete reviewer' })
      vim.keymap.set('n', '<leader>glp', gitlab.pipeline, { desc = 'pipeline' })
      vim.keymap.set('n', '<leader>glo', gitlab.open_in_browser, { desc = 'open in browser' })
      vim.keymap.set('n', '<leader>glM', gitlab.merge, { desc = 'merge' })
      vim.keymap.set('n', '<leader>glu', gitlab.copy_mr_url, { desc = 'copy MR URL' })
      vim.keymap.set('n', '<leader>glP', gitlab.publish_all_drafts, { desc = 'publish all drafts' })
      vim.keymap.set('n', '<leader>glD', gitlab.toggle_draft_mode, { desc = 'toggle draft mode' })
    end,
  },
  {
    'tpope/vim-fugitive',
    dependencies = {
      {
        'shumphrey/fugitive-gitlab.vim',
        config = function()
          vim.g.fugitive_gitlab_domains = { 'https://gitlab.com' }
          -- If using different URLs for SSH and HTTPS
          -- vim.g.fugitive_gitlab_domains = { ['my-ssh.gitlab.com'] = 'https://my.gitlab.com' }

          -- Add your personal access token
          -- local access_token = os.getenv 'FUGITIVE_GITLAB_ACCESS_TOKEN'
          -- if access_token then
          --  vim.g.gitlab_api_keys = { ['gitlab.com'] = access_token }
          -- else
          --  print 'Warning: FUGITIVE_GITLAB_ACCESS_TOKEN env variable is not set, but is required for shumphrey/fugitive-gitlab.vim'
          -- end
          -- If using omnicompletion with a private GitLab repository
          -- vim.g.gitlab_api_keys = { ['gitlab.com'] = 'mytoken1', ['my.gitlab.private'] = 'mytoken2' }

          -- If you need to turn off the preview window for issue body
          -- vim.cmd('set completeopt-=preview')

          -- For old self-hosted GitLab instances producing 404s
          -- vim.g.fugitive_gitlab_oldstyle_urls = 1
        end,
      },
    },
  },
}
