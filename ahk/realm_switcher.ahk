#Include window_helper.ahk
#Include config.ahk

; End me, please :)
RealmChecked := [	[{IsChecked: False}],
					[{IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}],
					[{IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}],
					[{IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}],
					[{IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}],
					[{IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}, {IsChecked: False}]]

; Reset all realm states
ResetRealms(ThisHotkey)
{
	For , RealmPage in RealmChecked
		For , Realm in RealmPage
			Realm.IsChecked := False
	MsgBox "Realms have been reset."
}

; Switch all characters to different realms
; Excuse my awful nesting
SwitchRealms(ThisHotkey)
{
	SetDefaultMouseSpeed 3
	; For every character
	For , Window in WindowList
	{
		; Switch to the window
		WinActivate "ahk_id " Window
		OuterLoop:
		; Check every page
		For , RealmPage in RealmChecked
		{
			OuterA_Index := A_Index
			; Check every realm in that page
			For , Realm in RealmPage
			{
				InnerA_Index := A_Index
				; If that realm has not been visited yet
				If !Realm.IsChecked
				{
					ArrowRight7C := SubStr(RealmsUIC.ArrorRightC, 1, -1) . " 7}"
					;ArrowRight7C := RealmsUIC.ArrorRightC . " 7"
					; Go to the last page
					Send "{Esc}" RealmsUIC.RealmsC ArrowRight7C
					
					; If the last page has not been visited yet, just click on the first item (there are no more items)
					If OuterA_Index == 1
					{
						Send RealmsUIC.Realm1C
						RealmChecked[1][1].IsChecked := True
					}

					; Else switch to the next free page
					Else
					{
						Loop OuterA_Index - 1
						{
							Send RealmsUIC.ArrorLeftC
						}
						; Click on the next free realm
						Send RealmsUIC.Realm%InnerA_Index%C
						RealmChecked[OuterA_Index][InnerA_Index].IsChecked := True
					}
					; Switch Realm
					Send RealmsUIC.GoToRealmC
					Break OuterLoop
				}
			}
		}
	}
}