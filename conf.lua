-- Configuration


function love.conf(t)
	t.title = "dotslash" -- The title of the window the game is in (string)
	--t.version = "0.9.1"         -- The L�VE version this game was made for (string)
	t.window.width = 1400
	t.window.height = 900
	t.window.fullscreen = false
	t.window.resizable = true

	-- For Windows debugging
	--t.window.icon = 'assets/placedbear.png'
	t.console = true
end
