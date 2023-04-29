#Include window_helper.ahk
#Include config.ahk

FriendOrder := Array()
; Assign character of active window into next position of group
SetupTeleport(ThisHotkey)
{
	Loop WindowList.Length
	{
		FriendOrder.InsertAt(A_Index, WinGetID("A")) 
		if A_Index == WindowList.Length
		{
			MsgBox "Active character has been assigned to #" A_Index " position in your group."
			return
		}
		MsgBox "Active character has been assigned to #" A_Index " position in your group.`nPress F11 to continue."

		KeyWait "F11", "D"
	}
}

; Teleport all other characters to active character
; There is a double WindowList.Length loop in there, but I'm too lazy too figure out how to improve that, it works just fine
Teleport(ThisHotkey)
{
	If FriendOrder.Length == 0
	return
	MyID := WinGetID("A")
	MyPosition := 0

	; Get active character (MyPosition)
	Loop WindowList.Length
	{
		If MyID == FriendOrder[A_Index]
			MyPosition := A_Index
	}

	Loop WindowList.Length
	{
		If MyID != FriendOrder[A_Index]
		{
			SendMode "Event"
			SetDefaultMouseSpeed 2
			WinActivate "ahk_id " FriendOrder[A_Index]
			send FriendUIC.FriendListC
			send FriendUIC.Friend%MyPosition%C
		}
	}
	WinActivate "ahk_id " MyID
}