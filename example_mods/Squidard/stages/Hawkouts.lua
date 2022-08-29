function onCreate()
	-- background shit
	
	makeLuaSprite('hawkout', 'hawkout', -600, -300);
	setScrollFactor('hawkout', 0.9, 0.9);
	
	makeLuaSprite('UpsideUp', 'UpsideUp', -600, -300);
	setScrollFactor('UpsideUp', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);
	
	 addGlitchEffect('UpsideUp', 1.2, 1.75)
	
	addLuaSprite('stagefront', false);
	
	setProperty('UpsideUp.visible', false);

	addLuaSprite('hawkout', false);
	addLuaSprite('UpsideUp', false);
	
end
function onEvent(name,value1,value2)
	if name == 'Flash Camera' then --name of the event to be used
		
		if value2 == 'normal' then --put the normal bg
			setProperty('hawkout.visible', true);
			setProperty('UpsideUp.visible', false);
		elseif value2 == 'UpsideUp' then --put the 1 bg
			setProperty('hawkout.visible', false);
			setProperty('UpsideUp.visible', true);
		end
	end
end