-- FILE: lua/custom/plugins/competitest.lua
return {
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('competitest').setup {
        compile_command = {
          cpp = {
            exec = 'g++',
            args = {
              '-std=c++23',
              '-O2',
              '-Wall',
              '-Wextra',
              '-DLOCAL',
              '-march=native',
              '-o',
              'main',
              '$(FNAME)',
            },
          },
        },
        run_command = {
          cpp = { exec = './main' },
        },
        template_file = '~/cp/template.cpp',
        evaluate_template_modifiers = true,
        testcases_use_single_file = true,
        companion_port = 4244,
        received_problems_path = function(task, file_ext)
          local url = task.url or ''
          local contest_id, index = url:match '/contest/(%d+)/problem/(%w+)'
          if not contest_id then
            contest_id, index = url:match '/problemset/problem/(%d+)/(%w+)'
          end
          if contest_id and index then
            return '/home/bruh/cp/problems/' .. contest_id .. index:upper() .. '.' .. file_ext
          end
          return '/home/bruh/cp/problems/' .. task.name .. '.' .. file_ext
        end,
        received_contests_directory = '/',
        received_contests_problems_path = function(task, file_ext)
          local url = task.url or ''
          local contest_id, index = url:match '/contest/(%d+)/problem/(%w+)'
          if not contest_id then
            contest_id, index = url:match '/problemset/problem/(%d+)/(%w+)'
          end
          if contest_id and index then
            return '/home/bruh/cp/problems/' .. contest_id .. index:upper() .. '.' .. file_ext
          end
          return '/home/bruh/cp/problems/' .. task.name .. '.' .. file_ext
        end,
      }

      -- Auto open problem A after receiving a contest
      vim.api.nvim_create_autocmd('User', {
        pattern = 'CompetiTestReceiveContest',
        callback = function()
          local files = vim.fn.glob('/home/bruh/cp/problems/*A.cpp', false, true)
          table.sort(files)
          if #files > 0 then
            vim.cmd('edit ' .. vim.fn.fnameescape(files[#files]))
          end
        end,
      })

      vim.keymap.set('n', '<leader>cp', '<cmd>CompetiTest receive problem<CR>', { desc = '[C]ompetitest receive [P]roblem' })
      vim.keymap.set('n', '<leader>cc', '<cmd>CompetiTest receive contest<CR>', { desc = '[C]ompetitest receive [C]ontest' })
      vim.keymap.set('n', '<leader>cq', '<cmd>CompetiTest receive stop<CR>', { desc = '[C]ompetitest stop' })
      vim.keymap.set('n', '<leader>cr', '<cmd>CompetiTest run<CR>', { desc = '[C]ompetitest [R]un' })
      vim.keymap.set('n', '<leader>cu', '<cmd>CompetiTest show_ui<CR>', { desc = '[C]ompetitest show [U]I' })
      vim.keymap.set('n', '<leader>ca', '<cmd>CompetiTest add_testcase<CR>', { desc = '[C]ompetitest [A]dd testcase' })
      vim.keymap.set('n', '<leader>cd', ':CompetiTest delete_testcase<CR>', { desc = 'Delete Test Case' })
      vim.keymap.set('n', '<leader>cs', function()
        local fname = vim.fn.expand '%:t:r'
        local fpath = vim.fn.expand '%:p'
        local contest_id = fname:match '^(%d+)'
        local index = fname:match '^%d+(%u%d?)$'
        if not contest_id or not index then
          vim.notify('Filename must be like 1234A.cpp to submit.\nCurrent file: ' .. fname, vim.log.levels.ERROR)
          return
        end
        vim.cmd 'silent! w'
        vim.fn.system('wl-copy < ' .. vim.fn.shellescape(fpath))
        local url = 'https://codeforces.com/contest/' .. contest_id .. '/submit/' .. index
        vim.fn.system('xdg-open ' .. vim.fn.shellescape(url))
        vim.notify('Code copied! Submit page opened for ' .. fname, vim.log.levels.INFO)
      end, { desc = '[C]ompetitest [S]ubmit — copy & open CF' })
    end,
  },
}
