function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Sword Note' then
		triggerEvent('Add Health Drain', 1, 0);
		--debugPrint('Oooga booga bye bye')
	end
end