function onCreate()
	-- background shit
	
	makeAnimatedLuaSprite('stageback1','stageback1',0, 0)addAnimationByPrefix('stageback1','dance','Bg0',24,true)
	objectPlayAnimation('stageback1','dance',false)
	setScrollFactor('stageback1', 0.9, 0.9);
	
	makeAnimatedLuaSprite('stageback2','stageback2',0, 0)addAnimationByPrefix('stageback2','dance','Bg0',24,true)
	objectPlayAnimation('stageback2','dance',false)
	setScrollFactor('stageback2', 0.9, 0.9);
	
	setProperty('stageback2.visible', false);

	addLuaSprite('stageback1', false);
	addLuaSprite('stageback2', false);
	
end
function onEvent(name,value1,value2)
	if name == 'Flash Camera' then --name of the event to be used
		
		if value2 == 'bgnormal' then --put the normal bg
			setProperty('stageback1.visible', true);
			setProperty('stageback2.visible', false);
		elseif value2 == 'bg1' then --put the 1 bg
			setProperty('stageback1.visible', false);
			setProperty('stageback2.visible', true);
		end
	end
end