local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Keep the windows position when switching between buffers
augroup('WinView', { clear = true })
autocmd('BufLeave', {
    group = 'WinView',
    callback = function()
        vim.b.winview = vim.fn.winsaveview()
    end
})
autocmd('BufEnter', {
    group = 'WinView',
    callback = function()
        if vim.b.winview then
            vim.fn.winrestview(vim.b.winview)
            vim.b.winview = nil
        end
    end
})

-- Auto remove whitespaces when saving file
augroup('TrimWhitespace', { clear = true })
autocmd('BufWritePre', {
    group = 'TrimWhitespace',
    pattern = '*',
    command = '%s/\\s\\+$//e'
})
