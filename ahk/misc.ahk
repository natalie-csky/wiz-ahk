#Include window_helper.ahk

; Toggle HUD
ToggleHUD(ThisHotkey)
{
	SendEvent "^g"
}

; Left click on every window
LCLickEveryWindow(ThisHotkey)
{
	x := 0
	y := 0
	MouseGetPos &x, &y
	Coords := x " " y
	ActiveWindow := WinGetID("A")
	For , Window in WindowList
	{
		WinActivate "ahk_id " Window
		Click Coords
	}
	WinActivate "ahk_id " ActiveWindow
}

; Press x on all windows
PressXEveryWindow(ThisHotkey)
{
	Loop WindowList.Length
		ControlSend "x",, WindowList[A_Index]
}

; Press space on all windows
PressSpaceEveryWindow(ThisHotkey)
{
	Loop WindowList.Length
		ControlSend "{space}",, WindowList[A_Index]
}

; Press q (quests) on all windows
PressQEveryWindow(ThisHotkey)
{
	Loop WindowList.Length
		ControlSend "q",, WindowList[A_Index]
}

; Rebind e to spellbook (p) and press on all windows
PressPEveryWindow(ThisHotkey)
{
	Loop WindowList.Length
		ControlSend "p",, WindowList[A_Index]
}
