local profiles = {
	{ name = "movie", label = "Movie Mode" },
	{ name = "movie_60fps", label = "Movie 60FPS Mode" },
	{ name = "anime", label = "Anime Mode" },
	{ name = "anime_60fps", label = "Anime 60FPS Mode" },
}

local index = 1

local function cycle_profile()
	index = index + 1
	if index > #profiles then
		index = 1
	end

	local p = profiles[index]
	mp.commandv("set", "profile", p.name)
	mp.osd_message("Switched to: " .. p.label, 2)
end

-- Bind to Ctrl+p (or change as you like)
mp.add_key_binding("Ctrl+p", "cycle-profiles", cycle_profile)
