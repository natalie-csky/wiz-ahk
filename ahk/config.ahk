#Include ../main.ahk
#Include dance.ahk
#include misc.ahk
#include realm_switcher.ahk
#include teleport.ahk
#include window_management.ahk

ConfigParser    := "pythonw py\config_parser.py"
TempFile 		:= "temp.txt"

GetFromParser(Section, Key)
{
	Target := ConfigParser . " " . Section . " " . Key
    RunWait(Target)
	RawOutput := FileRead(TempFile)
	FileDelete(TempFile)
	Output := StrReplace(StrReplace(RawOutput, "`r"),"`n")
	Return Output
}

GetHotkey(Function)
{
    Return GetFromParser("Hotkeys", Function)
}

HotIfWinActive("ahk_exe WizardGraphicalClient.exe")

; SCRIPT
Hotkey GetHotkey("CloseScriptMain"),			CloseScriptMain, "S"
Hotkey GetHotkey("ToggleSuspension"),			ToggleSuspension, "S"

; ANTI IDLE DIS
Hotkey GetHotkey("ToggleAntiIdleDisconnect"),	ToggleAntiIdleDisconnect

; MULTI-PRESS / -CLICK
Hotkey GetHotkey("PressXEveryWindow"),			PressXEveryWindow
Hotkey GetHotkey("PressQEveryWindow"),			PressQEveryWindow
Hotkey GetHotkey("PressPEveryWindow"),			PressPEveryWindow
Hotkey GetHotkey("PressSpaceEveryWindow"),		PressSpaceEveryWindow
Hotkey GetHotkey("LClickEveryWindow"),			LClickEveryWindow

; REALM
Hotkey GetHotkey("SwitchRealms"),				SwitchRealms
Hotkey GetHotkey("ResetRealms"),				ResetRealms

; MULTI-TELEPOR
Hotkey GetHotkey("SetupTeleport"),				SetupTeleport
Hotkey GetHotkey("Teleport"),					Teleport

; WINDOW MANAGEMEN
Hotkey GetHotkey("GetWizClientList"),			GetWizClientList
Hotkey GetHotkey("AssignWindows"),				AssignWindows
Hotkey GetHotkey("FocusFirstWindow"),			FocusFirstWindow
Hotkey GetHotkey("FocusSecondWindow"),			FocusSecondWindow
Hotkey GetHotkey("FocusThirdWindow"),			FocusThirdWindow
Hotkey GetHotkey("FocusFourthWindow"),			FocusFourthWindow

; CHEAT
Hotkey GetHotkey("AutoPetDanceGame"),			AutoPetDanceGame
Hotkey GetHotkey("AutoPetDanceGameRepeat"),		AutoPetDanceGameRepeat

HotIf

GetClickCoordinates(Section, Key)
{
	CoordsX := GetFromParser(Section, Key . "X")
	CoordsY := GetFromParser(Section, Key . "Y")
    return "{Click " . CoordsX . " " . CoordsY . "}"
}

Class FriendUICoordinates
{
	__New()
    {
		Section := "FriendUICoordinates"
        this.CloseC          := GetClickCoordinates(Section, "CloseC")
        this.FriendListC     := GetClickCoordinates(Section, "FriendListC")
        this.Friend1C        := GetClickCoordinates(Section, "Friend1C")
        this.Friend2C        := GetClickCoordinates(Section, "Friend2C")
        this.Friend3C        := GetClickCoordinates(Section, "Friend3C")
        this.Friend4C        := GetClickCoordinates(Section, "Friend4C")
    }
}
FriendUIC := FriendUICoordinates()

Class RealmsUICoordinates
{
	__New()
	{
		Section := "RealmsUICoordinates"
		this.RealmsC		:= GetClickCoordinates(Section, "RealmsC")
		this.ArrorLeftC		:= GetClickCoordinates(Section, "ArrowLeftC")
		this.ArrorRightC	:= GetClickCoordinates(Section, "ArrowRightC")
		this.Realm1C		:= GetClickCoordinates(Section, "Realm1C")
		this.Realm2C		:= GetClickCoordinates(Section, "Realm2C")
		this.Realm3C		:= GetClickCoordinates(Section, "Realm3C")
		this.Realm4C		:= GetClickCoordinates(Section, "Realm4C")
		this.Realm5C		:= GetClickCoordinates(Section, "Realm5C")
		this.Realm6C		:= GetClickCoordinates(Section, "Realm6C")
		this.Realm7C		:= GetClickCoordinates(Section, "Realm7C")
		this.GoToRealmC		:= GetClickCoordinates(Section, "GoToRealmC")
	}
}
RealmsUIC := RealmsUICoordinates()

Class PetGameUICoordinates
{
	__New()
	{
		Section := "PetGameUICoordinates"
		this.PlayC				:= GetClickCoordinates(Section, "PlayC")
		this.AboveContinueC		:= GetClickCoordinates(Section, "AboveContinueC")
		this.ContinueC			:= GetClickCoordinates(Section, "ContinueC")
		this.Snack1C			:= GetClickCoordinates(Section, "Snack1C")
		this.PlayAgainC			:= GetClickCoordinates(Section, "PlayAgainC")
		this.CloseC				:= GetClickCoordinates(Section, "CloseC")
	}
}
PetGameUIC := PetGameUICoordinates()

GetPixelSearchArgs(Section, Key)
{
	PixelArgs := Array()
	KeyVar := Key . "SearchVariation"
	KeyColor := Key . "PixelColor"
	KeyX := Key . "XPixel"
	KeyY := Key . "YPixel"
	PixelArgs.Push(GetFromParser(Section, KeyVar))
	PixelArgs.Push(GetFromParser(Section, KeyColor))
	PixelArgs.Push(GetFromParser(Section, KeyX))
	PixelArgs.Push(GetFromParser(Section, KeyY))
	Return PixelArgs
}

Class PixelSearchArgs
{
	__New(ArgsArray)
	{
		this.Variation 		:= ArgsArray[1]
		this.PixelColor 	:= ArgsArray[2]

		this.PixelXCoord 	:= ArgsArray[3]
		this.PixelYCoord 	:= ArgsArray[4]
	}
}
IconArrowArgs := PixelSearchArgs(GetPixelSearchArgs("PixelSearchArgs", "IconArrow"))

GetArrowPixelSearchArgs()
{
	Section := "PixelSearchArgs"
	Key := "Arrow"

	Directions := Array("Right", "Up", "Left", "Down")

	PixelArgs := Array()

	PixelArgs.Push(GetFromParser(Section, "ArrowPixelSearchVariation"))
	PixelArgs.Push(GetFromParser(Section, "ArrowPixelColor"))

	For Direction in Directions
	{
		KeyX := Direction . Key . "XPixel"
		KeyY := Direction . Key . "YPixel"
		
		PixelArgs.Push(GetFromParser(Section, KeyX))
		PixelArgs.Push(GetFromParser(Section, KeyY))
	}
	Return PixelArgs
}

Class ArrowPixelSearchArgs
{
	__New(ArgsArray)
	{
		this.Variation 		:= ArgsArray[1]
		this.PixelColor 	:= ArgsArray[2]

		this.RightXCoord 	:= ArgsArray[3]
		this.RightYCoord 	:= ArgsArray[4]

		this.UpXCoord 		:= ArgsArray[5]
		this.UpYCoord 		:= ArgsArray[6]

		this.LeftXCoord 	:= ArgsArray[7]
		this.LeftYCoord 	:= ArgsArray[8]

		this.DownXCoord 	:= ArgsArray[9]
		this.DownYCoord 	:= ArgsArray[10]
	}
}

; lord forgive me for horrible naming
ArrowPixelSearchArgsInstance := ArrowPixelSearchArgs(GetArrowPixelSearchArgs())

; === 1920*1080 resolution / REGULAR UI size - Friends UI click coordinates {Click X Y (ClickAmount)}
; Class FHDRegularFriendsUICoordinates
; {
;     CloseC          := "{Click 1870 590}"
;     FriendListC     := "{Click 1865 40}"
;     Friend1C        := "{Click 1740 75 2}"
;     Friend2C        := "{Click 1740 115 2}"
;     Friend3C        := "{Click 1740 160 2}"
;     Friend4C        := "{Click 1740 200 2}"
; }

; === 1920*1080 resolution / REGULAR LL UI size - Realms UI click coordinates 
; Class FHDRegularRealmsUICoordinates
; {
;     RealmsC         := "{Click 1270 200}"
;     ArrorLeftC      := "{Click 590 845}"
;     ArrorRight7C    := "{Click 815 845 7}"
;     Realm1C         := "{Click 700 480}"
;     Realm2C         := "{Click 700 530}"
;     Realm3C         := "{Click 700 580}"
;     Realm4C         := "{Click 700 625}"
;     Realm5C         := "{Click 700 670}"
;     Realm6C         := "{Click 700 720}"
;     Realm7C         := "{Click 700 765}"
;     GoToRealmC      := "{Click 700 900}"
; }