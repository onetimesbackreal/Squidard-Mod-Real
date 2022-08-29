function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('jumpscareslender');
end

function onEvent(name, value1, value2)
    if name == "Jumpscare" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('jumpywumpy', "sketchystaticman", 0, 0);
	addAnimationByPrefix('jumpywumpy', 'loop', 'jumpstatic', 24, true);
	setObjectCamera('jumpywumpy','other')
	addLuaSprite('jumpywumpy', true);
	objectPlayAnimation('jumpywumpy', 'loop');
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
    if canDodge == true then    
    Dodged = true;
    
    removeLuaSprite('jumpywumpy');
    canDodge = false
    
    end
 end