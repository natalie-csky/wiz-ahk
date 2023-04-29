#include ahk/config.ahk
#include ahk/dance.ahk
#include ahk/misc.ahk
#include ahk/realm_switcher.ahk
#include ahk/teleport.ahk
#include ahk/window_management.ahk

; Every 10 minutes, check if Wizard101 client is still running
; If not, close this script
CheckIfRunning()
{
	WindowListTemp := WinGetList("ahk_exe WizardGraphicalClient.exe")
	If WindowListTemp.Length == 0
	{
		ExitApp
	}
}

Timer := 600000 ; 10 minutes
SetTimer CheckIfRunning, Timer

AntiIdleDisconnect()
{
	Loop WindowList.Length
		ControlSend "{space}",, WindowList[A_Index]
}

; Toggle anti idle disconnect timer
ToggleAntiIdleDisconnect(ThisHotkey)
{
	static IsActive := False ; damn, I should use static more often, cool stuff
	IdleTimer := 480000 ; in ms, 8 minutes
	If IsActive
	{
		MsgBox "Timer is off"
		SetTimer AntiIdleDisconnect, 0 ; Turn timer off
		IsActive := False
	}
	Else
	{
		AntiIdleDisconnect()
		MsgBox "Timer is on"
		SetTimer AntiIdleDisconnect, IdleTimer ; Turn timer on
		IsActive := True
	}
}

; Toggle hotkey suspension, except for window switching and closing script
ToggleSuspension(ThisHotkey)
{
	Suspend
	static IsSuspended := False
	If IsSuspended
	{
		MsgBox "Suspension OFF"
		IsSuspended := False
	}
	Else
	{
		MsgBox "Suspension ON"
		IsSuspended := True
	}
}

; Exit script
#HotIf
CloseScriptMain(ThisHotkey)
{
	ExitApp
}