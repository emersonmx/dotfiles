local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(
    function(use)
        use 'wbthomason/packer.nvim'
        use 'tpope/vim-sensible'
        use 'ntpeters/vim-better-whitespace'
        use 'christoomey/vim-tmux-navigator'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-surround'
        use 'tpope/vim-unimpaired'
        use 'tpope/vim-repeat'
        use 'lambdalisue/suda.vim'
        use 'voldikss/vim-floaterm'
        use 'ptzz/lf.vim'

        if packer_bootstrap then
            require('packer').sync()
        end
    end
)
