CustomLogger = function()
    local symbol = vim.fn.expand '<cword>'
    local lineNumber = unpack(vim.api.nvim_win_get_cursor(0))
    local fileName = vim.fn.expand '%'
    local fileExt = string.match(fileName, '^.+(%..+)$')

    vim.fn.setreg('0', symbol)

    if fileExt == '.ts' or fileExt == '.tsx' or fileExt == '.js' or fileExt == '.jsx' then
        vim.fn.setreg('+', 'console.log("🚀 ' .. fileName .. ' @ line ' .. lineNumber .. ' - ' .. symbol .. ':", ' .. symbol .. ')')
    elseif fileExt == '.lua' then
        vim.fn.setreg('+', 'print("🚀 ' .. fileName .. ' @ line ' .. lineNumber .. ' - ' .. symbol .. ':", ' .. symbol .. ')')
    end
end

-- Remove all logs created by the CustomLogger function in open buffers
RemoveCustomLogs = function()
    local fileName = vim.fn.expand '%'
    local fileExt = string.match(fileName, '^.+(%..+)$')

    local function updateBuffer(pattern)
        local ok, result = pcall(function()
            return vim.cmd.bufdo(pattern)
        end)
        if ok then
            print(result)
        else
            print 'No custom logs in active buffer'
        end
        require('conform').format { async = true }
    end

    if fileExt == '.ts' or fileExt == '.tsx' or fileExt == '.js' or fileExt == '.jsx' then
        updateBuffer('%s/^' .. '\\' .. '(' .. '\\' .. 's' .. '\\' .. ')*console.log([\'"]🚀.*[\'"], .*)//g')
    elseif fileExt == '.lua' then
        updateBuffer('%s/^' .. '\\' .. '(' .. '\\' .. 's' .. '\\' .. ')*print([\'"]🚀.*[\'"], .*)//g')
    end
end

return
