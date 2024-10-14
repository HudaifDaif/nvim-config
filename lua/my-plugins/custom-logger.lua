-- Create custom logs and attach to unnamed register (available on <p>) and attach symbol to 0 register
CustomLogger = function()
    local symbol = vim.fn.expand '<cword>'
    local lineNumber = unpack(vim.api.nvim_win_get_cursor(0))
    local fileName = vim.fn.expand '%'
    local fileExt = string.match(fileName, '^.+(%..+)$')
    local capture = vim.treesitter.get_captures_at_cursor(vim.api.nvim_get_current_win())
    local isVariable = table.maxn(capture) == 1 and capture[1] == 'variable'

    vim.print(capture)
    vim.print(capture[1])
    vim.print(table.maxn(capture))

    if isVariable then
        if fileExt == '.ts' or fileExt == '.tsx' or fileExt == '.js' or fileExt == '.jsx' then
            vim.fn.setreg('+', 'console.log("🚀 ' .. fileName .. ' @ line ' .. lineNumber .. ' - ' .. symbol .. ':", ' .. symbol .. ')')
        elseif fileExt == '.lua' then
            vim.fn.setreg('+', 'vim.print("🚀 ' .. fileName .. ' @ line ' .. lineNumber .. ' - ' .. symbol .. ':", ' .. symbol .. ')')
        end

        vim.print 'Log added to register'
    else
        vim.print 'No symbol selected. No log added to register'
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
