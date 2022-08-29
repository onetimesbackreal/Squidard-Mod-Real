function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Art Note' then
		triggerEvent('Deduct Health Drain', 1, 0);
		--debugPrint('Oooga booga bye bye')
	end
end