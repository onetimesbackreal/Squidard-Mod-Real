function onCreatePost()
	local funny = pcUserName()

	setBotPlayText('Cheater!!!! Meanie!!!!')

	setWindowTitle(funny)

    --addScanlineEffect('camHUD',false)
end

function onCreatePost()
     setProperty('debugKeysChart', null); -- prevents key from doing anything
end

function onUpdate()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
		loadSong('smash')
	end
end