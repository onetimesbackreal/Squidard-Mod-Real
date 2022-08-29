local WindowDance = false
local SineElap = 0

function onSongStart()
	
		noteTweenAngle('NoteTilt11', 1, 60, 0.5, bounceOut)
		noteTweenAngle('NoteTilt21', 2, 180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt31', 3, 180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt41', 4, -60, 0.5, bounceOut)
		
		noteTweenAngle('NoteTilt51', 5, 60, 0.5, bounceOut)
		noteTweenAngle('NoteTilt61', 6, -180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt71', 7, 180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt81', 8, -60, 0.5, bounceOut)
	
	
end

function onTweenCompleted(tag)
	if tag == 'NoteTilt11' then
		noteTweenAngle('NoteTilt12', 1, -60, 0.5, bounceOut)
		noteTweenAngle('NoteTilt22', 2, 180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt32', 3, -180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt42', 4, 60, 0.5, bounceOut)
		
		noteTweenAngle('NoteTilt52', 5, -60, 0.5, bounceOut)
		noteTweenAngle('NoteTilt62', 6, 180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt72', 7, -180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt82', 8, 60, 0.5, bounceOut)
	end
	if tag == 'NoteTilt12' then
		noteTweenAngle('NoteTilt11', 1, 60, 0.5, bounceOut)
		noteTweenAngle('NoteTilt21', 2, -180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt31', 3, 180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt41', 4, -60, 0.5, bounceOut)
		
		noteTweenAngle('NoteTilt51', 5, 60, 0.5, bounceOut)
		noteTweenAngle('NoteTilt61', 6, -180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt71', 7, 180, 0.5, bounceOut)
		noteTweenAngle('NoteTilt81', 8, -60, 0.5, bounceOut)
	end
end