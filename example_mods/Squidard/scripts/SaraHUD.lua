--[[
    SaraHUD (3.5) by Novikond
    Download Link: https://gamebanana.com/mods/371851
    Plz credit me and helpers if use
--]]

--[[ Default SaraHUD Settings
    style ='classicIcons'

    antialiasingLol = true
    hudMiss = true
    HBoverlay = true
    botplHideInfo = true
    
    songName = true
    timer = true
    iconPoz = true
--]]

--[[ Current Available Styles
    classicTxt                 -- all statics are at the corner of the screen
    classicIcons               -- same as above, but with cool icons
    disStrum                   -- health bar instead of opponent strums (use without middlescroll)
    modern                     -- better if you use it without centered notefield
    cherry                     -- by vCherry-kAI16
--]]

-- Settings --
local pref = {
    style ='classicIcons', --main thing of hud, all available styles are listed above

    antialiasingLol = true, --antialiasing for text things
    hudMiss = true, --purple miss animation for some hud stuff
    HBoverlay = true, --health bar overlay
    botplHideInfo = true, --when you use botplay, it hide info
    infoBop = false, --"score text zoom on hit", but with new info
    
    extraInfo = false, --show your sicks, goods, bads and etc.
    songName = true, --display song name
    timer = true, --display timer
    iconPoz = true, --icons not moving and on corners of health bar
    funkyArrow = false, --arrow, that point where your hp (helpful with "iconPoz" pref)
    
    hpBye = false, --when hp is full, hide health bar
    notesStart = false, --new notes appear animation
    disableBop = false, --disable icon bop (may be shitty if use without "iconPoz" pref)
    hideInfo = false, --hide info at all

    pixelVer = false, --make hud stuff in pixilated style
    autoPixelVer = false, --if pixel stage then pixel version enables

    timeBarr = false, --vanilla time bar (not a timer)
    timebarOver = false, --overlay for... time bar?
    timebarColor = '00FFFF', --color of timebar ('FFFFFF' - white)

    customHBcolors = false, --enable custom colors for health bar
    DADhbColor = 'A22A35', --dad side (vanilla fnf 'FF0000')
    BFhbColor = '75CD5F', --bf side (vanilla fnf '00FF00')

    laneUnderlay = false, --enable lane underlay
    DADunderlay = false, --enable underlay for opponent too
    underlayTransp = 0.5, --setting up transparency

    wowCFont = false, --enable custom font
    cFont = 'PhantomMuff.ttf' --put in mods/fonts
}
-- bottom text --

-- funni code stuff coming (no touchies)
local hudStuff = {'scoreTxt', 'timeTxt', 'timeBar', 'timeBarBG', 'healthBarOverlay'}

function switchStyle() -- style
    makeLuaText('rating', ': ?'); makeLuaText('misses', ': 0'); makeLuaText('score', ': 0')

    if pref.style == 'classicTxt' then
        setProperty('healthBar.y', downscroll and 68 or 655)

        setTextString('rating', 'Rating: ?'); setTextString('misses', 'Misses: 0'); setTextString('score', 'Score: 0')

        setProperty('rating.x', 15); setProperty('rating.y', downscroll and 20 or 678); setTextSize('rating', 20)
        setProperty('misses.x', 15); setProperty('misses.y', downscroll and 80 or 618); setTextSize('misses', 20)
        setProperty('score.x', 15); setProperty('score.y', downscroll and 50 or 648); setTextSize('score', 20)
    end

    if pref.style == 'classicIcons' then
        setProperty('healthBar.y', downscroll and 68 or 655)

        setProperty('rating.x', 52); setProperty('rating.y', downscroll and 22 or 669); setTextSize('rating', 20)
        setProperty('misses.x', 52); setProperty('misses.y', downscroll and 106 or 584); setTextSize('misses', 20)
        setProperty('score.x', 52); setProperty('score.y', downscroll and 64 or 628); setTextSize('score', 20)

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 10, downscroll and 18 or 665); makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 10, downscroll and 100 or 580); makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 10, downscroll and 59 or 623)

        setObjectCamera('ratingIcon', 'hud', true); scaleObject('ratingIcon', 0.7, 0.7)
        setObjectCamera('missesIcon', 'hud', true); scaleObject('missesIcon', 0.7, 0.7)
        setObjectCamera('scoreIcon', 'hud', true); scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon'); addLuaSprite('missesIcon'); addLuaSprite('scoreIcon')
    end

    if pref.style == 'modern' then
        setProperty('healthBar.y', downscroll and 60 or 660); setProperty('healthBar.x', 110)

        setProperty('rating.x', 851); setProperty('rating.y', downscroll and 36 or 666); setTextSize('rating', 20)
        setProperty('misses.x', 851); setProperty('misses.y', downscroll and 86 or 616); setTextSize('misses', 20)
        setProperty('score.x', 961); setProperty('score.y', downscroll and 86 or 616); setTextSize('score', 20)

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 810, downscroll and 30 or 660); makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 810, downscroll and 81 or 610); makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 920, downscroll and 81 or 610)

        setObjectCamera('ratingIcon', 'hud', true); scaleObject('ratingIcon', 0.7, 0.7)
        setObjectCamera('missesIcon', 'hud', true); scaleObject('missesIcon', 0.7, 0.7)
        setObjectCamera('scoreIcon', 'hud', true); scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon'); addLuaSprite('missesIcon'); addLuaSprite('scoreIcon')
    end

    if pref.style == 'cherry' then --Cherry Style by vCherry.kAI.16 (and Novikond make a bit of changes)
        setProperty('healthBar.y', 350); setProperty('healthBar.x', 960); setProperty('healthBar.angle', 90);

        setProperty('botplayTxt.y', downscroll and 578 or 98);

        setProperty('rating.x', 841); setProperty('rating.y', downscroll and 36 or 666); setTextSize('rating', 20)
        setProperty('misses.x', 841); setProperty('misses.y', downscroll and 86 or 616); setTextSize('misses', 20)
        setProperty('score.x', 951); setProperty('score.y', downscroll and 86 or 616); setTextSize('score', 20)

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 800, downscroll and 30 or 660); makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 800, downscroll and 81 or 610); makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 910, downscroll and 81 or 610)

        setObjectCamera('ratingIcon', 'hud', true); scaleObject('ratingIcon', 0.7, 0.7)
        setObjectCamera('missesIcon', 'hud', true); scaleObject('missesIcon', 0.7, 0.7)
        setObjectCamera('scoreIcon', 'hud', true); scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon'); addLuaSprite('missesIcon'); addLuaSprite('scoreIcon')
    end

    if pref.style == 'disStrum' then
        setProperty('healthBar.y', downscroll and 645 or 80); setProperty('healthBar.x', 75)

        setProperty('rating.x', 52); setProperty('rating.y', downscroll and 22 or 669); setTextSize('rating', 20)
        setProperty('misses.x', 52); setProperty('misses.y', downscroll and 106 or 584); setTextSize('misses', 20)
        setProperty('score.x', 52); setProperty('score.y', downscroll and 64 or 628); setTextSize('score', 20)

        makeLuaSprite('ratingIcon', 'saraHUD/ratingIcon', 10, downscroll and 18 or 665); makeLuaSprite('missesIcon', 'saraHUD/missesIcon', 10, downscroll and 100 or 580); makeLuaSprite('scoreIcon', 'saraHUD/scoreIcon', 10, downscroll and 59 or 623)

        setObjectCamera('ratingIcon', 'hud', true); scaleObject('ratingIcon', 0.7, 0.7)
        setObjectCamera('missesIcon', 'hud', true); scaleObject('missesIcon', 0.7, 0.7)
        setObjectCamera('scoreIcon', 'hud', true); scaleObject('scoreIcon', 0.7, 0.7)

        addLuaSprite('ratingIcon'); addLuaSprite('missesIcon'); addLuaSprite('scoreIcon')
    end

    setObjectOrder('ratingIcon', 60); setObjectOrder('missesIcon', 60); setObjectOrder('scoreIcon', 60)
    addLuaText('rating', true); addLuaText('misses', true); addLuaText('score', true)
end

function songBruh() -- songName
    if pref.style == 'classicTxt' or 'classicIcons' then
        makeLuaText('song', '' .. (songName), 500, 388, downscroll and 96 or 618)
        setTextAlignment('song', 'center'); setTextSize('song', 20)
    end
    if pref.style == 'modern' then
        makeLuaText('song', '' .. (songName), 500, 223, downscroll and 82 or 622)
        setTextAlignment('song', 'left'); setTextSize('song', 20)

        makeLuaSprite('songIcon', 'saraHUD/songIcon', 190, downscroll and 80 or 620)
        setObjectCamera('songIcon', 'hud'); scaleObject('songIcon', 0.5, 0.5)
        addLuaSprite('songIcon')
    end
    if pref.style == 'cherry' then
        makeLuaText('song', '' .. (songName), 504, 223, downscroll and 622 or 68)
        setTextAlignment('song', 'right'); setTextSize('song', 13)

        makeLuaSprite('songIcon', 'saraHUD/songIcon', 536, downscroll and 620 or 66)
        setObjectCamera('songIcon', 'hud'); scaleObject('songIcon', 0.4, 0.4)
        addLuaSprite('songIcon')
    end
    if pref.style == 'disStrum' then
        makeLuaText('song', '' .. (songName), 500, 192, downscroll and 608 or 102)
        setTextAlignment('song', 'left'); setTextSize('song', 20)

        makeLuaSprite('songIcon', 'saraHUD/songIcon', 160, downscroll and 606 or 100)
        setObjectCamera('songIcon', 'hud'); scaleObject('songIcon', 0.5, 0.5)
        addLuaSprite('songIcon')
    end

    setObjectOrder('songIcon', 60)
    addLuaText('song', true)
end

function timerBruh() -- timer
    if pref.style == 'classicTxt' or 'classicIcons' then
        makeLuaText('timer', '00:00/00:00', 500, 388, downscroll and 30 or 678)
        setObjectCamera('timer', 'hud'); setTextAlignment('timer', 'center'); setTextSize('timer', 20)
    end
    if pref.style == 'modern' then
        makeLuaText('timer', '00:00/00:00', 500, 70, downscroll and 82 or 622)
        setObjectCamera('timer', 'hud'); setTextAlignment('timer', 'right'); setTextSize('timer', 20)

        makeLuaSprite('timerIcon', 'saraHUD/timerIcon', 575, downscroll and 80 or 620)
        setObjectCamera('timerIcon', 'hud'); scaleObject('timerIcon', 0.5, 0.5)
        addLuaSprite('timerIcon')
    end
    if pref.style == 'cherry' then
        makeLuaText('timer', '00:00/00:00', 500, 227, downscroll and 652 or 32)
        setObjectCamera('timer', 'hud'); setTextAlignment('timer', 'right'); setTextSize('timer', 20)
    
        makeLuaSprite('timerIcon', 'saraHUD/timerIcon', 532, downscroll and 650 or 30)
        setObjectCamera('timerIcon', 'hud'); scaleObject('timerIcon', 0.5, 0.5)
        addLuaSprite('timerIcon')
    end
    if pref.style == 'disStrum' then
        makeLuaText('timer', '00:00/00:00', 500, 42, downscroll and 608 or 102)
        setObjectCamera('timer', 'hud'); setTextAlignment('timer', 'right'); setTextSize('timer', 20)

        makeLuaSprite('timerIcon', 'saraHUD/timerIcon', 545, downscroll and 606 or 100)
        setObjectCamera('timerIcon', 'hud'); scaleObject('timerIcon', 0.5, 0.5)
        addLuaSprite('timerIcon')
    end

    setObjectOrder('timerIcon', 60)
    addLuaText('timer', true)
end

function iconsBruh() -- iconPoz
    if pref.style == 'classicTxt' or 'classicIcons' then
        setProperty('iconP1.x', screenWidth - 445)
        setProperty('iconP2.x', 285)
    end
    if pref.style == 'modern' then
        setProperty('iconP1.x', screenWidth - 680)
        setProperty('iconP2.x', 50)
    end
    if pref.style == 'cherry' then
        setProperty('iconP1.x', screenWidth - 1005)
        setProperty('iconP2.x', screenWidth - 1105)
    end
    if pref.style == 'disStrum' then
        setProperty('iconP1.x', screenWidth - 710)
        setProperty('iconP2.x', 30)
        setProperty('iconP1.y', downscroll and 560 or 30)
        setProperty('iconP2.y', downscroll and 560 or 30)
    end
end

function underlayBruh() -- laneUnderlay
    makeLuaSprite('BFunderlay', null, not middlescroll and 725 or 405, -1000)
	makeGraphic('BFunderlay', 460, 2000, '000000')
	setObjectCamera('BFunderlay', 'hud')
	setProperty('BFunderlay.alpha', 0)
	addLuaSprite('BFunderlay', true)
    setObjectOrder('BFunderlay', getObjectOrder('strumLineNotes') - 1)

    if pref.DADunderlay == true and not middlescroll then
        makeLuaSprite('DADunderlay', null, 85, -1000)
        makeGraphic('DADunderlay', 460, 2000, '000000')
        setObjectCamera('DADunderlay', 'hud')
        setProperty('DADunderlay.alpha', 0)
        addLuaSprite('DADunderlay', true)
        setObjectOrder('DADunderlay', getObjectOrder('strumLineNotes') - 1)
    end

    if pref.notesStart == true then
        setProperty('BFunderlay.x', getProperty('BFunderlay.x') + 6)
        setProperty('DADunderlay.x', getProperty('DADunderlay.x') - 2)
    end

    if pref.style == 'disStrum' then pref.DADunderlay = false end
    if (middlescroll) then pref.DADunderlay = false end
end

function HBoverlayBruh() -- HBoverlay
    makeLuaSprite('healthBarOver', 'saraHUD/healthBarOver', getProperty('healthBar.x') - 4, getProperty('healthBar.y') - 4.9)
    setObjectCamera('healthBarOver', 'hud'); setScrollFactor('healthBarOver', 0.9, 0.9)
    setProperty('healthBarOver.angle', getProperty('healthBar.angle'))
    setObjectOrder('healthBarOver', getObjectOrder('healthBar') + 1)
    addLuaSprite('healthBarOver', true)
end

function noBopBruh() scaleObject('iconP1', 1, 1); scaleObject('iconP2', 1, 1) end -- disableBop

function hudMissBruh() -- hudMiss
    setProperty('missesIcon.color', getColorFromHex('5f1ea4'))
	doTweenColor('missesIcon', 'missesIcon', 'FFFFFF', 0.3, 'linear')
	
	setProperty('scoreIcon.color', getColorFromHex('5f1ea4'))
	doTweenColor('scoreIcon', 'scoreIcon', 'FFFFFF', 0.3, 'linear')
	
    setProperty('ratingIcon.color', getColorFromHex('5f1ea4'))
	doTweenColor('ratingIcon', 'ratingIcon', 'FFFFFF', 0.3, 'linear')

	setProperty('healthBar.color', getColorFromHex('5f1ea4'))
	doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.3, 'linear')

	setProperty('iconP1.color', getColorFromHex('5f1ea4'))
	doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.3, 'linear')
end

function timeBarBruh() -- timeBarr
    setProperty('timeBar.visible', true); setProperty('timeBarBG.visible', true) --;setProperty('timeTxt.visible', true)
    setTimeBarColors(pref.timebarColor)

    -- if pref.style == 'cherry' then setProperty('timeBar.x', 1030); setProperty('timeBar.y', 360); setProperty('timeBar.angle', 270) end
end

function timebarOverBruh() -- timebarOver
    makeLuaSprite('timeOver', 'saraHUD/healthBarOver', getProperty('timeBar.x') - 4, getProperty('timeBar.y') - 4)
    setObjectCamera('timeOver', 'hud'); setScrollFactor('timeOver', 0.9, 0.9)
    scaleObject('timeOver', 0.67, 1); setProperty('timeOver.alpha', 0)
    setProperty('timeOver.angle', getProperty('timeBar.angle'))
    setObjectOrder('timeOver', getObjectOrder('timeBar') + 1)
    addLuaSprite('timeOver', true)
end

function HBcolorsBruh() setHealthBarColors(pref.DADhbColor, pref.BFhbColor) end -- customHBcolors

function hideInfoBruh() -- hideInfo
    setProperty('score.visible', false); setProperty('rating.visible', false); setProperty('misses.visible', false)
    setProperty('scoreIcon.visible', false); setProperty('ratingIcon.visible', false); setProperty('missesIcon.visible', false)
end

function infoBopBruh() -- infoBop
    setProperty('misses.scale.x', 0.9); setProperty('misses.scale.y', 1.05)
    setProperty('rating.scale.x', 0.9); setProperty('rating.scale.y', 1.05)
    setProperty('score.scale.x', 0.9); setProperty('score.scale.y', 1.05)

    doTweenX('MtextSizeX', 'misses.scale', 1, 0.1, 'linear'); doTweenY('MtextSizeY', 'misses.scale', 1, 0.1, 'linear')
    doTweenX('RtextSizeX', 'rating.scale', 1, 0.1, 'linear'); doTweenY('RtextSizeY', 'rating.scale', 1, 0.1, 'linear')
    doTweenX('StextSizeX', 'score.scale', 1, 0.1, 'linear'); doTweenY('StextSizeY', 'score.scale', 1, 0.1, 'linear')
end

function extraInfoBruh() -- extraInfo
    if not inGameOver then
        makeLuaText('sick', 'Sicks: 0', 0, 15, 298); setTextSize('sick', 24); setObjectCamera('sick', 'hud')
	    makeLuaText('good', 'Goods: 0', 0, 15, 328); setTextSize('good', 24); setObjectCamera('good', 'hud')
	    makeLuaText('bad', 'Bads: 0', 0, 15, 358); setTextSize('bad', 24); setObjectCamera('bad', 'hud')
	    makeLuaText('shit', 'Shits: 0', 0, 15, 388); setTextSize('shit', 24); setObjectCamera('shit', 'hud')
        makeLuaText('tnh', 'Total: 0', 0, 15, 438); setTextSize('tnh', 24); setObjectCamera('tnh', 'hud')
        makeLuaText('health', '50%', 0, 15, 468); setTextSize('health', 24); setObjectCamera('health', 'hud')

        addLuaText('sick')
        addLuaText('good')
        addLuaText('bad')
        addLuaText('shit')
        addLuaText('tnh')
        addLuaText('health')
    end
end

function fontBruh() -- wowCFont
    setTextFont('rating', pref.cFont); setTextFont('misses', pref.cFont); setTextFont('score', pref.cFont)
    setTextFont('timer', pref.cFont); setTextFont('song', pref.cFont)

    setTextFont('sick', pref.cFont)
    setTextFont('good', pref.cFont)
    setTextFont('bad', pref.cFont)
    setTextFont('shit', pref.cFont)
    setTextFont('tnh', pref.cFont)
    setTextFont('health', pref.cFont)

    setTextFont('HParrow', pref.cFont)
end

function botplayHideBruh() -- botplHideInfo
    if (botPlay) then
        setProperty('misses.visible', false); setProperty('rating.visible', false); setProperty('score.visible', false)
        setProperty('missesIcon.visible', false); setProperty('ratingIcon.visible', false); setProperty('scoreIcon.visible', false)

        setProperty('sick.visible', false)
        setProperty('good.visible', false)
        setProperty('bad.visible', false)
        setProperty('shit.visible', false)
        setProperty('tnh.visible', false)
        setProperty('health.visible', false)
    else
        setProperty('misses.visible', true); setProperty('rating.visible', true); setProperty('score.visible', true)
        setProperty('missesIcon.visible', true); setProperty('ratingIcon.visible', true); setProperty('scoreIcon.visible', true)

        setProperty('sick.visible', true)
        setProperty('good.visible', true)
        setProperty('bad.visible', true)
        setProperty('shit.visible', true)
        setProperty('tnh.visible', true)
        setProperty('health.visible', true)
    end
end

function arrowBruh() -- funkyArrow (thx vCherry.kAI.16)
    if pref.style == 'classicTxt' or 'classicIcons' then
        makeLuaText('HParrow', '+')
        local HIGHPOINT = 628
        local LOWPOINT = 924
        setProperty('HParrow.x', LOWPOINT) setProperty('HParrow.y', downscroll and 50 or 637); setTextSize('HParrow', 36)

        if getProperty('health') == 1 then
            setProperty('HParrow.x', HIGHPOINT)
        elseif getProperty('health') == 0 then
            setProperty('HParrow.x', LOWPOINT)
        elseif getProperty('health') > 1 then
            setProperty('HParrow.x', LOWPOINT - (getProperty('health') * 292))
        elseif getProperty('health') <= 1 then 
            setProperty('HParrow.x', LOWPOINT - (getProperty('health') * 293))
        end
    end
    if pref.style == 'modern' then
        makeLuaText('HParrow', '>')
        local HIGHPOINT = 395
        local LOWPOINT = 688
        setProperty('HParrow.x', LOWPOINT) setProperty('HParrow.y', downscroll and 20 or 675); setTextSize('HParrow', 30); setProperty('HParrow.angle', downscroll and 90 or -90)

        if getProperty('health') == 1 then
            setProperty('HParrow.x', HIGHPOINT)
        elseif getProperty('health') == 0 then
            setProperty('HParrow.x', LOWPOINT)
        elseif getProperty('health') > 1 then
            setProperty('HParrow.x', LOWPOINT - (getProperty('health') * 292))
        elseif getProperty('health') <= 1 then 
            setProperty('HParrow.x', LOWPOINT - (getProperty('health') * 293))
        end
    end
    if pref.style == 'cherry' then
        makeLuaText('HParrow', '>')
        local HIGHPOINT = 335
        local LOWPOINT = 631
        setProperty('HParrow.x', 1215); setProperty('HParrow.y', LOWPOINT); setTextSize('HParrow', 30)

        if getProperty('health') == 1 then
            setProperty('HParrow.y', HIGHPOINT)
        elseif getProperty('health') == 0 then
            setProperty('HParrow.y', LOWPOINT)
        elseif getProperty('health') > 1 then                
            setProperty('HParrow.y', LOWPOINT - (getProperty('health') * 292))
        elseif getProperty('health') <= 1 then 
            setProperty('HParrow.y', LOWPOINT - (getProperty('health') * 293))
        end
    end
    if pref.style == 'disStrum' then
        makeLuaText('HParrow', '>')
        local HIGHPOINT = 360
        local LOWPOINT = 656
        setProperty('HParrow.x', LOWPOINT) setProperty('HParrow.y', downscroll and 660 or 35); setTextSize('HParrow', 30); setProperty('HParrow.angle', downscroll and -90 or 90)

        if getProperty('health') == 1 then
            setProperty('HParrow.x', HIGHPOINT)
        elseif getProperty('health') == 0 then
            setProperty('HParrow.x', LOWPOINT)
        elseif getProperty('health') > 1 then
            setProperty('HParrow.x', LOWPOINT - (getProperty('health') * 292))
        elseif getProperty('health') <= 1 then 
            setProperty('HParrow.x', LOWPOINT - (getProperty('health') * 293))
        end
    end
    addLuaText('HParrow'); setObjectCamera('HParrow', 'hud', true)
end

function pixVerBruh() -- pixelVer
    loadGraphic('ratingIcon', 'saraHUD/ratingIconPixel'); scaleObject('ratingIcon', 1.4, 1.4); setProperty('ratingIcon.antialiasing', false)
    loadGraphic('missesIcon', 'saraHUD/missesIconPixel'); scaleObject('missesIcon', 1.4, 1.4); setProperty('missesIcon.antialiasing', false)
    loadGraphic('scoreIcon', 'saraHUD/scoreIconPixel'); scaleObject('scoreIcon', 1.4, 1.4); setProperty('scoreIcon.antialiasing', false)

    setTextFont('rating', 'pixel.otf'); setTextFont('misses', 'pixel.otf'); setTextFont('score', 'pixel.otf')
    setTextSize('rating', 16); setTextSize('misses', 16); setTextSize('score', 16)
    setProperty('rating.antialiasing', false); setProperty('misses.antialiasing', false); setProperty('score.antialiasing', false)

    if pref.timer == true then
        loadGraphic('timerIcon', 'saraHUD/timerIconPixel')
        scaleObject('timerIcon', 1.2, 1.2)
        setTextFont('timer', 'pixel.otf'); setTextSize('timer', 16)
        setProperty('timer.antialiasing', false)
        setProperty('timerIcon.antialiasing', false)
    end
    if pref.songName == true then
        loadGraphic('songIcon', 'saraHUD/songIconPixel')
        scaleObject('songIcon', 1.2, 1.2)
        setTextFont('song', 'pixel.otf'); setTextSize('song', 16)
        setProperty('song.antialiasing', false)
        setProperty('songIcon.antialiasing', false)
    end
    if pref.extraInfo == true then
        setTextFont('sick', 'pixel.otf'); setTextSize('sick', 20); setProperty('sick.antialiasing', false)
        setTextFont('good', 'pixel.otf'); setTextSize('good', 20); setProperty('good.antialiasing', false)
        setTextFont('bad', 'pixel.otf'); setTextSize('bad', 20); setProperty('bad.antialiasing', false)
        setTextFont('shit', 'pixel.otf'); setTextSize('shit', 20); setProperty('shit.antialiasing', false)
        setTextFont('tnh', 'pixel.otf'); setTextSize('tnh', 20); setProperty('tnh.antialiasing', false)
        setTextFont('health', 'pixel.otf'); setTextSize('health', 20); setProperty('health.antialiasing', false)
    end
end

function autoPixBruh() -- autoPixelVer
    if getPropertyFromClass('PlayState', 'isPixelStage') == true then
        loadGraphic('ratingIcon', 'saraHUD/ratingIconPixel'); scaleObject('ratingIcon', 1.4, 1.4); setProperty('ratingIcon.antialiasing', false)
        loadGraphic('missesIcon', 'saraHUD/missesIconPixel'); scaleObject('missesIcon', 1.4, 1.4); setProperty('missesIcon.antialiasing', false)
        loadGraphic('scoreIcon', 'saraHUD/scoreIconPixel'); scaleObject('scoreIcon', 1.4, 1.4); setProperty('scoreIcon.antialiasing', false)
    
        setTextFont('rating', 'pixel.otf'); setTextFont('misses', 'pixel.otf'); setTextFont('score', 'pixel.otf')
        setTextSize('rating', 16); setTextSize('misses', 16); setTextSize('score', 16)
        setProperty('rating.antialiasing', false); setProperty('misses.antialiasing', false); setProperty('score.antialiasing', false)
    
        if pref.timer == true then
            loadGraphic('timerIcon', 'saraHUD/timerIconPixel')
            scaleObject('timerIcon', 1.2, 1.2)
            setTextFont('timer', 'pixel.otf'); setTextSize('timer', 16)
            setProperty('timer.antialiasing', false)
            setProperty('timerIcon.antialiasing', false)
        end
        if pref.songName == true then
            loadGraphic('songIcon', 'saraHUD/songIconPixel')
            scaleObject('songIcon', 1.2, 1.2)
            setTextFont('song', 'pixel.otf'); setTextSize('song', 16)
            setProperty('song.antialiasing', false)
            setProperty('songIcon.antialiasing', false)
        end
        if pref.extraInfo == true then
            setTextFont('sick', 'pixel.otf'); setProperty('sick.antialiasing', false)
            setTextFont('good', 'pixel.otf'); setProperty('good.antialiasing', false)
            setTextFont('bad', 'pixel.otf'); setProperty('bad.antialiasing', false)
            setTextFont('shit', 'pixel.otf'); setProperty('shit.antialiasing', false)
            setTextFont('tnh', 'pixel.otf'); setProperty('tnh.antialiasing', false)
            setTextFont('health', 'pixel.otf'); setTextSize('health', 20); setProperty('health.antialiasing', false)
        end
    end
end

function cherryIconsBruh() -- cherry style + without iconPoz
    local HIGHPOINTbf = 335
    local LOWPOINTbf = 631
    local HIGHPOINTdad = 230
    local LOWPOINTdad = 531

    setProperty('iconP1.x', screenWidth - 140)
    setProperty('iconP2.x', screenWidth - 140)
    setProperty('iconP2.flipX', true)
    if getProperty('health') == 1 then
        setProperty('iconP1.y', HIGHPOINTbf)
    elseif getProperty('health') == 0 then
        setProperty('iconP1.y', LOWPOINTbf)
    elseif getProperty('health') > 1 then                
        setProperty('iconP1.y', LOWPOINTbf - (getProperty('health') * 292))
    elseif getProperty('health') <= 1 then 
        setProperty('iconP1.y', LOWPOINTbf - (getProperty('health') * 293))
    end
    if getProperty('health') == 1 then
        setProperty('iconP2.y', HIGHPOINTdad)
    elseif getProperty('health') == 0 then
        setProperty('iconP2.y', LOWPOINTdad)
    elseif getProperty('health') > 1 then                
        setProperty('iconP2.y', LOWPOINTdad - (getProperty('health') * 292))
    elseif getProperty('health') <= 1 then 
        setProperty('iconP2.y', LOWPOINTdad - (getProperty('health') * 293))
    end
end

function byeHPBruh() -- hpBye (HP Bar Go Bye-Bye -Cherry)
    if getProperty('health') <= 1.99 and getProperty('health') >= 1.94 then
        doTweenAlpha('bruhHP1', 'healthBar', 0, 0.1, 'linear')
        doTweenAlpha('bruhHP2', 'healthBarOver', 0, 0.1, 'linear');
        
        doTweenAlpha('whatArr', 'HParrow', 0, 0.1, 'linear')

    elseif getProperty('health') <= 1.93 then
        doTweenAlpha('bruhHP1', 'healthBar', 1, 0.1, 'linear')
        doTweenAlpha('bruhHP2', 'healthBarOver', 0.5, 0.1, 'linear');
        
        doTweenAlpha('whatArr', 'HParrow', 1, 0.1, 'linear')
    end
end

function strumAnimBruh() -- notesStart (SameTheta)
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes',i,'x', -2000)
        setPropertyFromGroup('strumLineNotes',i + 4,'x', 2000)
    end

    for i = 4,7 do
        noteTweenX('p1Tween'..i, i-4, (115 * i) - 375, 0.34 + (i * 0.25), 'elasticOut')
        noteTweenX('p2Tween'..i, i, 275 + (115 * i), 0.34 + (i * 0.25), 'elasticOut')
    end
end

function antialiasingBruh() -- antialiasingLol (thanks to raltyro)
    local gAA = getPropertyFromClass("ClientPrefs", "globalAntialiasing")

    setProperty('rating.antialiasing', gAA); setProperty('misses.antialiasing', gAA); setProperty('score.antialiasing', gAA)
    setProperty('timer.antialiasing', gAA); setProperty('song.antialiasing', gAA)
    setProperty('sick.antialiasing', gAA)
    setProperty('good.antialiasing', gAA)
    setProperty('bad.antialiasing', gAA)
    setProperty('shit.antialiasing', gAA)
    setProperty('tnh.antialiasing', gAA)
    setProperty('health.antialiasing', gAA)
    setProperty('HParrow.antialiasing', gAA)
end

function onCreatePost()
    for i = 1, 5 do setProperty(hudStuff[i] ..'.visible', false) end --this thing hide vanilla stuff

    switchStyle() -- enable styles

    --preferences
    if pref.songName == true then songBruh() end
    if pref.timer == true then timerBruh() end
    if pref.HBoverlay == true then HBoverlayBruh() end
    if pref.timeBarr == true then timeBarBruh() end
    if pref.timebarOver == true then timebarOverBruh() end
    if pref.customHBcolors == true then HBcolorsBruh() end
    if pref.hideInfo == true then hideInfoBruh() end
    if pref.notesStart == true then strumAnimBruh() end
    if pref.laneUnderlay == true then underlayBruh() end
    if pref.extraInfo == true then extraInfoBruh() end
end

function onUpdatePost()
    --preferences ugh
    if pref.style == 'disStrum' then for i = 0, 3 do setPropertyFromGroup('opponentStrums', i, 'alpha', 0) end end

    if pref.iconPoz == true then iconsBruh() end
    if pref.iconPoz == false and pref.style == 'cherry' then cherryIconsBruh() end
    if pref.disableBop == true then noBopBruh() end
    if pref.botplHideInfo == true then botplayHideBruh() end
end

function onBeatHit()
    --make timer work (big thanks for SameTheta)
    local timeElapsed = math.floor(getProperty('songTime')/1000)
    local timeTotal = math.floor(getProperty('songLength')/1000)
    local timeElapsedFixed = string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60)
    local timeTotalFixed = string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60)
    setTextString('timer', timeElapsedFixed .. '/' .. timeTotalFixed)
end

function onUpdate()
    if pref.pixelVer == true then pixVerBruh() end
    if pref.autoPixelVer == true then autoPixBruh() end
    if pref.funkyArrow == true then arrowBruh() end
    if pref.wowCFont == true then fontBruh() end
    if pref.antialiasingLol == true then antialiasingBruh() end
    if pref.hpBye == true then byeHPBruh() end
end

function onRecalculateRating()
    --make info work (thanks to SameTheta for rating percents)
    if pref.style == 'modern' or 'classicIcons' or 'cherry' or 'disStrum' then
        setTextString('misses', ': ' .. misses)
	    setTextString('rating', ': ' .. getProperty('ratingName') .. ' | ' .. string.format("%.2f%%", rating * 100) .. ' | ' .. getProperty('ratingFC'))
	    setTextString('score', ': ' .. score)
    end
    if pref.style == 'classicTxt' then
        setTextString('misses', 'Misses: ' .. misses)
	    setTextString('rating', 'Rating: ' .. getProperty('ratingName') .. ' | ' .. string.format("%.2f%%", rating * 100) .. ' | ' .. getProperty('ratingFC'))
	    setTextString('score', 'Score: ' .. score)
    end
    if pref.extraInfo == true then
        setTextString('sick', 'Sicks: ' .. getProperty('sicks'))
	    setTextString('good', 'Goods: ' ..getProperty('goods'))
	    setTextString('bad', 'Bads: ' .. getProperty('bads'))
	    setTextString('shit', 'Shits: ' .. getProperty('shits'))
        setTextString('tnh', 'Total: '.. getHits())
        setTextString('health', math.ceil(getHealth() * 50) .. '%')
    end
end

function onSongStart()
    if pref.laneUnderlay == true then doTweenAlpha('bfUnderlayTween', 'BFunderlay', pref.underlayTransp, 0.2, 'linear') end
    if pref.DADunderlay == true then doTweenAlpha('dadUnderlayTween', 'DADunderlay', pref.underlayTransp, 0.2, 'linear') end
    if pref.timebarOver == true then doTweenAlpha('timebarStart', 'timeOver', 1, 0.25, circIn) end
end

--i haven't slept properly for about a couple of years, help
function goodNoteHit() if pref.infoBop == true then infoBopBruh() end end

function noteMiss() if pref.hudMiss == true then hudMissBruh() end end