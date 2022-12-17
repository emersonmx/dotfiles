function ColorMyPencils(color)
    color = color or 'onedark'
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
