obs = obslua
path = ""
enabled = true

function script_description()
	return "Simply start a program automatically when opening OBS.\n\nBy edo2313"
end

function script_properties()
	local props = obs.obs_properties_create()
	obs.obs_properties_add_bool(props, "enabled", "Enabled")
	obs.obs_properties_add_path(props, "path", "Path ", obs.OBS_PATH_FILE, "", NULL)
	return props
end

function script_load(settings)
	path = obs.obs_data_get_string(settings, "path")
	enabled = obs.obs_data_get_bool(settings, "enabled")
	if (path ~= "" and enabled) then
		os.execute("start \"\" "..path)
	end
end
