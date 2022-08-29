function onEvent(name)
	if name == "hud flip 90" then
		doTweenAngle('turn1', 'camHUD', 45, 0.1, 'linear')
	end
end
