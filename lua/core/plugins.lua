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

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'ellisonleao/gruvbox.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'bluz71/vim-nightfly-colors'
  use 'vim-test/vim-test'
  use 'tpope/vim-surround'
  use 'nvim-tree/nvim-tree.lua'
  
  -- completion


  use{
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
}


  if packer_bootstrap then
    require('packer').sync()
  end
end)
