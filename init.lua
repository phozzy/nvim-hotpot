-- ~/.config/nvim/init.lua

local execute = vim.api.nvim_command
local fn = vim.fn

local pack_path = fn.stdpath("data") .. "/site/pack/packer/start/"
local fmt = string.format

function ensure (user, repo)
  local install_path = pack_path .. repo
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git',
               'clone',
	       fmt("https://github.com/%s/%s", user, repo),
	       install_path})
    execute(fmt("packadd %s", repo))
  end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim")
ensure("rktjmp", "hotpot.nvim")

-- Bootstrap .fnl support
require("hotpot")

require("init")
