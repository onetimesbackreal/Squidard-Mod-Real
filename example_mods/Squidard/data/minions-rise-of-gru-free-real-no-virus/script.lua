local WindowDance = false
local SineElap = 0

function onSongStart()
	noteTweenX('MoveDatShit1', 0, 732, 1.4, 'back')
	noteTweenX('MoveDatShit2', 1, 844, 2, 'cubic')
	noteTweenX('MoveDatShit3', 2, 956, 2.8, 'quad')
	noteTweenX('MoveDatShit4', 3, 1070, 1, 'quad')
	
	noteTweenX('MoveDatShit5', 4, 92, 0.9999999, 'back')
	noteTweenX('MoveDatShit6', 5, 204, 1.8, 'quad')
	noteTweenX('MoveDatShit7', 6, 316, 2.9, 'back')
	noteTweenX('MoveDatShit8', 7, 430, 0.3, 'cubic')
end

function onStepHit()
	if curStep == 273 then
		noteTweenAngle('NoteTilt1', 1, -60, 6, cubeInOut)
		noteTweenAngle('NoteTilt2', 2, 20, 4, cubeInOut)
		noteTweenAngle('NoteTilt3', 3, 100, 5, cubeInOut)
		noteTweenAngle('NoteTilt4', 4, -19, 3, cubeInOut)
		
		noteTweenAngle('NoteTilt5', 5, 20, 6, cubeInOut)
		noteTweenAngle('NoteTilt6', 6, -60, 4, cubeInOut)
		noteTweenAngle('NoteTilt7', 7, -19, 5, cubeInOut)
		noteTweenAngle('NoteTilt8', 8, 109, 3, cubeInOut)
	end
end