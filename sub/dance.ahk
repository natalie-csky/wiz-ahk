; !!! This script is based on 1920 * 1080p resolution

; TODO: Add UI-/ resolution-based Variables to config.ahk
PlayC			:= "{Click 1240 855}"
AboveContinueC	:= "{Click 1240 800}"
ContinueC		:= "{Click 1240 855}"
Snack1C			:= "{Click 670 730}"
PlayAgainC		:= "{Click 950 850}"
CloseC			:= "{Click 1900 1055}"

; ===

IconPixelSearchVariation	:= 40

IconArrowPixelColor 		:= 0x927821

IconArrowXPixel 			:= 924
IconArrowYPixel 			:= 997

; ===

ArrowPixelSearchVariation 	:= 40

ArrowPixelColor 			:= 0x071D00

RightArrowXPixel 			:= 937
RightArrowYPixel 			:= 983

UpArrowXPixel 				:= 970
UpArrowYPixel 				:= 1020

LeftArrowXPixel 			:= 980
LeftArrowYPixel 			:= 986

DownArrowXPixel 			:= 954
DownArrowYPixel 			:= 972

; ===

ArrowIntervalTime 			:= 340
AdditionalSleep 			:= 1000
PressDelayTime 				:= 100
ClickDelayTime				:= 200

; TODO: Replace Temp variables with image recognition function that checks if game has ended or loading screen is over
TempWaitEndGameTime 		:= 2000
TempWaitEndLoadTime			:= 3000
; ===

SendMode "Event"
SetDefaultMouseSpeed 2

HasFoundArrowIcon()
{
	Return PixelSearch(&PixelFoundC, &PixelFoundC, IconArrowXPixel, IconArrowYPixel, 
		IconArrowXPixel, IconArrowYPixel, IconArrowPixelColor, IconPixelSearchVariation)
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
		ArrowXPixel, ArrowYPixel, ArrowPixelColor, ArrowPixelSearchVariation)
}

GetArrowDirection()
{
	i := 1
	While(True)
	{
		; if bot failed
		if(i == 20)
		{
			Send CloseC
			MsgBox "Your pet has failed. Train it harder."
			Exit
		}
		If(HasFoundArrow(RightArrowXPixel, RightArrowYPixel))
		{
			Return "Right"
		}

		If(HasFoundArrow(UpArrowXPixel, UpArrowYPixel))
		{
			Return "Up"
		}

		If(HasFoundArrow(LeftArrowXPixel, LeftArrowYPixel))
		{
			Return "Left"
		}

		If(HasFoundArrow(DownArrowXPixel, DownArrowYPixel))
		{
			Return "Down"
		}
		i += 1
	}
	
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

; Semi-automate pet dancing game
AutoPetDanceGame(ThisHotkey, IsRepeat := False)
{
	MouseGetPos(&MouseX, &MouseY)
	WorldC := "{Click " . MouseX . " " . MouseY . "}"

	ih := InputHook(, "{Del}")

	Loop
	{
		ih.Start()
		Send WorldC
		Send PlayC

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

		If(Not IsRepeat Or ih.EndReason == "EndKey")
		{
			Break
		}

		Sleep TempWaitEndGameTime
		Send AboveContinueC
		Send ContinueC
		Sleep ClickDelayTime
		Send Snack1C
		Sleep ClickDelayTime
		Send ContinueC
		Sleep ClickDelayTime
		Send PlayAgainC
		Sleep TempWaitEndLoadTime
		ih.Stop()
	}
}

AutoPetDanceGameRepeat(ThisHotkey)
{
	AutoPetDanceGame(ThisHotkey, True)
}