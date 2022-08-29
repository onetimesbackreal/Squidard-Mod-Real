function onEvent(name, value1, value2)

 if name == 'go' then

  makeLuaSprite('countdowngo', 'go',361,145)

  setObjectCamera('countdowngo', 'hud')

  doTweenAlpha('goend','countdowngo',0,crochet/1000,'cubeInOut')

  addLuaSprite('countdowngo', true)

 end

end
