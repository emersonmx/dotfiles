function ColorMyPencils(color) 
    color = color or 'gruvbox'
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
