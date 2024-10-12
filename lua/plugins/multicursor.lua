-- https://github.com/smoka7/multicursors.nvim
return {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvimtools/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
        {
            mode = { 'v', 'n' },
            '<Leader>cm',
            '<cmd>MCstart<cr>',
            desc = '[C]reate a [M]ultiple selection',
        },
    },
}
