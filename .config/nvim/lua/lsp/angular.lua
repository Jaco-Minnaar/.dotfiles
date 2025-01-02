local lspconfig = require("lspconfig")
local common = require("lsp.common")

local function get_probe_dir(root_dir)
	local project_root = vim.fs.find("node_modules", { path = root_dir, upward = true })[1]

	return project_root and (project_root .. "/node_modules") or ""
end

local function find_angular_versions()
	local package_json_files = vim.fs.find(function(name, path)
		return not path:match("package\\.json") and name:match("node_modules")
	end)
end

local cmd = function(root_dir)
	local command = { "ngserver", "--stdio" }
	local root_modules_path = "/home/jaco/n/lib"
	local modules_path = root_modules_path
	local local_modules_path = get_probe_dir(root_dir)

	local ng_probe_locations = { root_modules_path }

	if root_dir ~= nil and root_dir ~= "" then
		table.insert(ng_probe_locations, root_dir)
	end

	table.insert(command, "--ngProbeLocations")
	table.insert(command, ng_probe_locations)

	local angular_versions = find_angular_versions()

	if local_modules_path ~= nil and local_modules_path ~= "" then
		modules_path = local_modules_path .. "," .. modules_path
	end

	return { "ngserver", "--stdio", "--tsProbeLocations", root_modules_path, "--ngProbeLocations", root_modules_path }
end

lspconfig.angularls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	cmd = cmd(),
	on_new_config = function(new_config, root_dir)
		new_config.cmd = cmd(root_dir)
	end,
})
