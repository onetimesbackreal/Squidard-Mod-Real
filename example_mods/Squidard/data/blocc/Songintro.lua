	--easy script configs
    IntroTextSize = 25	--Size of the text for the Now Playing thing.
    IntroSubTextSize = 25 --size of the text for the Song Name.
    IntroSubText2Size = 20
    IntroTagColor = 'FFD800' --Color of the tag at the end of the box.
    IntroTagWidth = 15	--Width of the box's tag thingy.
    --easy script configs
    
    --actual script
    function onCreate()
        --the tag at the end of the box
        makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 200)
        makeGraphic('JukeBoxTag', 300+IntroTagWidth, 90, IntroTagColor)
        setObjectCamera('JukeBoxTag', 'other')
        addLuaSprite('JukeBoxTag', true)
    
        --the box
        makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 200)
        makeGraphic('JukeBox', 300, 90, '000000')
        setObjectCamera('JukeBox', 'other')
        addLuaSprite('JukeBox', true)
    
        --text for the song name
        makeLuaText('JukeBoxSubText', 'Blocco Sprites by:', 300, -305-IntroTagWidth, 220)
        setTextAlignment('JukeBoxSubText', 'left')
        setObjectCamera('JukeBoxSubText', 'other')
        setTextSize('JukeBoxSubText', IntroSubTextSize)
        addLuaText('JukeBoxSubText')
    
        --text for the artist name
        makeLuaText('JukeBoxSubText2', 'kat.vhs', 300, -305-IntroTagWidth, 260)
        setTextAlignment('JukeBoxSubText2', 'left')
        setObjectCamera('JukeBoxSubText2', 'other')
        setTextSize('JukeBoxSubText2', IntroSubText2Size)
        addLuaText('JukeBoxSubText2')
    end
    
    --motion functions
    function onSongStart()
        -- Inst and Vocals start playing, songPosition = 0
        doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
        doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
        doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
        doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
        doTweenX('MoveInFive', 'JukeBoxSubText2', 0, 1, 'CircInOut')
        
        runTimer('JukeBoxWait', 3, 1)
    end
    
    function onTimerCompleted(tag, loops, loopsLeft)
        -- A loop from a timer you called has been completed, value "tag" is it's tag
        -- loops = how many loops it will have done when it ends completely
        -- loopsLeft = how many are remaining
        if tag == 'JukeBoxWait' then
            doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
            doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
            doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
            doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
            doTweenX('MoveOutFive', 'JukeBoxSubText2', -450, 1.5, 'CircInOut')
        end
    end