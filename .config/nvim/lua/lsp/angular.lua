local lspconfig = require("lspconfig")
local common = require("lsp.common")

local function array_all(array, check)
	for _, value in ipairs(array) do
		if not check(value) then
			return false
		end
	end

	return true
end

local function version_cmp(v1, v2)
	if v1.major ~= v2.major then
		return v1.major < v2.major
	end

	if v1.minor ~= v2.minor then
		return v1.minor < v2.minor
	end

	if v1.patch ~= v2.patch then
		return v1.minor < v2.patch
	end

	return false
end

local function parse_version(version_str)
	local matches = string.gmatch(version_str, "%d+")
	local version = {}
	version.major = tonumber(matches())
	version.minor = tonumber(matches())
	version.patch = tonumber(matches())
	version.version_str = version_str

	return version
end

local function find_angular_versions(root_dir)
	local package_json_files = vim.fs.find(function(name, path)
		return not path:match("node_modules") and name:match(".*package%.json$")
	end, { limit = math.huge, path = root_dir })

	local ng_info = {}
	for _, value in pairs(package_json_files) do
		local path = vim.fs.dirname(value) .. "/node_modules/@angular/core/package.json"
		local h = io.open(path)

		if h then
			local package_content = h:read("*a")
			h:close()
			local package_info = vim.json.decode(package_content)

			local version = parse_version(package_info.version)
			table.insert(ng_info, version)
		end
	end

	return ng_info
end

local cmd = function(root_dir)
	local command = { "ngserver", "--stdio" }
	local root_modules_path = "/home/jaco/n/lib"
	-- local modules_path = root_modules_path
	-- local local_modules_path = get_probe_dir(root_dir)

	-- local ng_probe_locations = { root_modules_path }
	--
	-- if root_dir ~= nil and root_dir ~= "" then
	-- 	table.insert(ng_probe_locations, root_dir)
	-- end

	table.insert(command, "--logFile")
	table.insert(command, "/tmp/angular.log")

	table.insert(command, "--tsProbeLocations")
	table.insert(command, root_modules_path)

	table.insert(command, "--ngProbeLocations")
	table.insert(command, root_modules_path)

	local angular_versions = find_angular_versions(root_dir)

	if #angular_versions > 0 then
		if array_all(angular_versions, function(info)
			return info.major < 17
		end) then
			table.insert(command, "--disableBlockSyntax")
		end

		if array_all(angular_versions, function(v)
			return v.major < 18 or (v.major == 18 and v.minor < 1)
		end) then
			table.insert(command, "--disableLetSyntax")
		end
	end

	table.sort(angular_versions, version_cmp)

	if #angular_versions > 0 then
		table.insert(command, "--angularCoreVersion")
		table.insert(command, '"' .. angular_versions[1].version_str .. '"')
	end

	-- if local_modules_path ~= nil and local_modules_path ~= "" then
	-- 	modules_path = local_modules_path .. "," .. modules_path
	-- end

	local cmd_str = ""
	for _, value in ipairs(command) do
		cmd_str = cmd_str .. value .. " "
	end

	return command
end

lspconfig.angularls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	cmd = cmd(),
	on_new_config = function(new_config, root_dir)
		local new_cmd = cmd(root_dir)
		new_config.cmd = new_cmd
	end,
})
