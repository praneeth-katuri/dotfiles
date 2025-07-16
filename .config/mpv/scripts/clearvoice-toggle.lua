local active = false
mp.add_key_binding("CTRL+v", "toggle-clear", function()
	if not active then
		mp.command("af add lavfi=[equalizer=f=300:g=-1,equalizer=f=1000:g=3,equalizer=f=4000:g=2]")
		mp.command("af add lavfi=[acompressor=threshold=-30dB:ratio=3:makeup=4]")
		mp.osd_message("🔊 Clear‑Voice: ON", 2)
	else
		mp.command("af remove lavfi=[equalizer=f=300:g=-1,equalizer=f=1000:g=3,equalizer=f=4000:g=2]")
		mp.command("af remove lavfi=[acompressor=threshold=-30dB:ratio=3:makeup=4]")
		mp.osd_message("🔊 Clear‑Voice: OFF", 2)
	end
	active = not active
end)
