local WindowDance = false
local TanElap = 0
local DanceAmt = 2 -- I recommend 3

function onCreate()
    setPropertyFromClass('openfl.Lib', 'application.window.y', 180)
    setPropertyFromClass('openfl.Lib', 'application.window.x', 320)
    windowy = getPropertyFromClass("openfl.Lib", "application.window.y")
    windowx = getPropertyFromClass("openfl.Lib", "application.window.x")
    curWindowX = getPropertyFromClass("openfl.Lib", "application.window.x")    
end

function onStepHit()
    if curStep >= 783 and curStep <= 848 then
        WindowDance = true
    end
    if curStep == 849 then
        WindowDance = false
    end
	if curStep >= 976 and curStep <= 1048 then
        WindowDance = true
    end
    if curStep == 1049 then
        WindowDance = false
    end
end

function onUpdatePost(elapsed)
    TanElap = TanElap + (elapsed*(DanceAmt/3))

    if WindowDance == true then
        if curWindowX >= 1950 then
            setPropertyFromClass('openfl.Lib', 'application.window.x', -1300)
        end
        curWindowX = getPropertyFromClass("openfl.Lib", "application.window.x")
        setPropertyFromClass('openfl.Lib', 'application.window.y', 100*math.tan(TanElap)+windowy)
        setPropertyFromClass('openfl.Lib', 'application.window.x', curWindowX + DanceAmt)
    end
end    