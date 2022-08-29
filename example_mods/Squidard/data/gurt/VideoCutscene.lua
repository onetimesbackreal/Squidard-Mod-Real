local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene then --Block the first countdown
		startVideo('Gurt_Start');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end


function onStartCountdown()
	if not allowCountdown and not isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('Gurt_Start');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
	if not allowEnd then
		startVideo('Gurt_End');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end