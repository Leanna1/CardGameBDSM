F9:: ; starts the game (press F9)
global usedPics := Object()
global Pics := Object()
global x := 0
Loop, Files, %A_Desktop%\Card Game\*.png, R ; replace "%A_Desktop%\Card Game\" with the directory of your image folder
{
	usedPics[x] := false
    Pics[x] := ( A_LoopFileFullPath )
	x += 1
}
createGui()
return

F12:: ; used for drawing new cards (press F12)
createGui()
return

drawCards(numberOfCards) ; opens the given number of cards (which were not used yet) in your standard picture opening programm
{
	i := 0
	while i<numberOfCards
	{
		if(cardsLeft()=true)
		{
			Random, y,0,(x-1)
			if(usedPics[y] = false){
				Run % Pics[y]
				usedPics[y] := true
				i += 1
			}
		}else{
			MsgBox All cards were used! You win ^_^
			i += 1
		}
	}
}

cardsLeft() ; checks if there are still cards left which weren't used yet
{
	i := 0
	while(i<(Pics.Length()+1))
	{
		if(usedPics[i]=false)
		{
			return true
		}
		i += 1
	}
	return false
}

createGui() ; asks for the number of cards and then calls the function which will open the cards
{
	InputBox, Cards, Card, Number of cards:,,140,130,,,,
	drawCards(Cards)
}