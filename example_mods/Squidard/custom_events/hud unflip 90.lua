function onEvent(name)
	if name == "hud unflip 90" then
		doTweenAngle('turn1', 'camHUD', 360, 0.1, 'linear')
	end
end
