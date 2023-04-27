#Include window_helper.ahk

; Manual window assignment per user's choice, by assigning the active window
AssignWindows(ThisHotkey)
{
	Loop WindowList.Length
	{
		; Assign active window to WindowList array
		WindowList[A_Index] := WinGetID("A")

		; Don't say 'Press F12 on...' at last assingment
		if A_Index == WindowList.Length
		{
			MsgBox "Key " A_Index "/" WindowList.Length " has been assigned to active window."
			return
		}
		MsgBox "Key " A_Index "/" WindowList.Length " has been assigned to active window.`n`nPress F12 on next window to continue"
		Keywait "F12", "D"
	}
}

; Open the respective window
FocusFirstWindow(ThisHotkey)
{
	try WinActivate "ahk_id " WindowList[1]
}
FocusSecondWindow(ThisHotkey)
{
	try WinActivate "ahk_id " WindowList[2]
}
FocusThirdWindow(ThisHotkey)
{
	try WinActivate "ahk_id " WindowList[3]
}
FocusFourthWindow(ThisHotkey)
{
	try WinActivate "ahk_id " WindowList[4]
}