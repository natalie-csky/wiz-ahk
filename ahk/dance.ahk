; EndGamePixelSearchVariation := 40

; EndGamePixelColor			:= 0xFFFF00

ArrowIntervalTime 			:= 340
AdditionalSleep 			:= 1000
PressDelayTime 				:= 100
ClickDelayTime				:= 200

LoopTimeoutLimit			:= 20

; TODO: Replace Temp variables with image recognition function that checks if game has ended or loading screen is over
TempWaitEndGameTime 		:= 2000
TempWaitEndLoadTime			:= 3000
; ===

SendMode "Event"
SetDefaultMouseSpeed 2

HasFoundArrowIcon()
{
	Return PixelSearch(&PixelFoundC, &PixelFoundC, IconArrowArgs.PixelXCoord, IconArrowArgs.PixelYCoord, 
		IconArrowArgs.PixelXCoord, IconArrowArgs.PixelYCoord, IconArrowArgs.PixelColor, IconArrowArgs.Variation)
}

SleepUntilArrowDisplayed()
{
	While(HasFoundArrowIcon() == False)
	{
		Continue
	}
}

HasFoundArrow(ArrowXPixel, ArrowYPixel)
{
	Return PixelSearch(&PixelFoundC, &PixelFoundC, ArrowXPixel, ArrowYPixel, 
		ArrowXPixel, ArrowYPixel, ArrowPixelSearchArgsInstance.PixelColor, ArrowPixelSearchArgsInstance.Variation)
}

GetArrowDirection()
{
	Loop LoopTimeoutLimit
	{
		If(HasFoundArrow(ArrowPixelSearchArgsInstance.RightXCoord, ArrowPixelSearchArgsInstance.RightYCoord))
		{
			Return "Right"
		}

		If(HasFoundArrow(ArrowPixelSearchArgsInstance.UpXCoord, ArrowPixelSearchArgsInstance.UpYCoord))
		{
			Return "Up"
		}

		If(HasFoundArrow(ArrowPixelSearchArgsInstance.LeftXCoord, ArrowPixelSearchArgsInstance.LeftYCoord))
		{
			Return "Left"
		}

		If(HasFoundArrow(ArrowPixelSearchArgsInstance.DownXCoord, ArrowPixelSearchArgsInstance.DownYCoord))
		{
			Return "Down"
		}
	}
	Throw Error("Pet game timeout", -1)
}

CaptureAndPlay(AmountArrows)
{
	Directions := Array()

	Loop (AmountArrows)
	{
		Directions.Push(GetArrowDirection())
		Sleep ArrowIntervalTime
	}

	For Direction in Directions
	{
		Sleep PressDelayTime
		If (Direction == "Right")
		{
			Send "{Right}"
		}
		If (Direction == "Up")
		{
			Send "{Up}"
		}
		If (Direction == "Left")
		{
			Send "{Left}"
		}
		If (Direction == "Down")
		{
			Send "{Down}"
		}
	}
}

; Image thingamajig I think lol
; ChechGameEnded()
; {
; 	Return PixelSearch(&PixelFoundC, &PixelFoundC, ArrowXPixel, ArrowYPixel, 
; 		ArrowXPixel, ArrowYPixel, ArrowPixelColor, ArrowPixelSearchVariation)
; }

; Semi-automate pet dancing game
AutoPetDanceGame(ThisHotkey, IsRepeating := False)
{
	MouseGetPos(&MouseX, &MouseY)
	WorldC := "{Click " . MouseX . " " . MouseY . "}"

	ih := InputHook(, "{Del}")
	Loop
	{
		if(IsRepeating)
			ih.Start()
		Send WorldC
		Send PetGameUIC.PlayC

		try
		{
			SleepUntilArrowDisplayed()
			CaptureAndPlay(3)

			Sleep AdditionalSleep
			SleepUntilArrowDisplayed()
			CaptureAndPlay(4)

			Sleep AdditionalSleep
			SleepUntilArrowDisplayed()
			CaptureAndPlay(5)

			Sleep AdditionalSleep
			SleepUntilArrowDisplayed()
			CaptureAndPlay(6)

			Sleep AdditionalSleep
			SleepUntilArrowDisplayed()
			CaptureAndPlay(7)
		}
		Catch as e
		{
			if(e.message == "Pet game timeout")
			{
				Send PetGameUIC.CloseC
				ih.Stop()
				Exit
			}
			else
				throw e
		}

		If(Not IsRepeating Or ih.EndReason == "EndKey")
		{
			Break
		}

		Sleep TempWaitEndGameTime
		Send PetGameUIC.AboveContinueC
		Send PetGameUIC.ContinueC
		Sleep ClickDelayTime
		Send PetGameUIC.Snack1C
		Sleep ClickDelayTime
		Send PetGameUIC.ContinueC
		Sleep ClickDelayTime
		Send PetGameUIC.PlayAgainC
		Sleep TempWaitEndLoadTime
		ih.Stop()
	}
	
	
}

AutoPetDanceGameRepeat(ThisHotkey)
{
	AutoPetDanceGame(ThisHotkey, True)
}