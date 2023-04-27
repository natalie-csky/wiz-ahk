HotIfWinActive("ahk_exe WizardGraphicalClient.exe")

; SCRIPT
Hotkey "F1",            CloseScriptMain
Hotkey "F2",            ToggleSuspension

; ANTI IDLE DISCONNECT
Hotkey "F3",            ToggleAntiIdleDisconnect

; MULTI-PRESS / -CLICK
Hotkey "x",             PressXEveryWindow
Hotkey "q",             PressQEveryWindow
Hotkey "e",             PressPEveryWindow
Hotkey "space",         PressSpaceEveryWindow
Hotkey "mbutton",       LCLickEveryWindow

; REALMS
Hotkey "F5",            SwitchRealms
Hotkey "F9",            ResetRealms

; MULTI-TELEPORT
Hotkey "F11",           SetupTeleport
Hotkey "Tab",           Teleport

; WINDOW MANAGEMENT
Hotkey "LShift & F12",  GetWizClientList
Hotkey "F12",           AssignWindows
Hotkey "1",             FocusFirstWindow
Hotkey "2",             FocusSecondWindow
Hotkey "3",             FocusThirdWindow
Hotkey "4",             FocusFourthWindow

; CHEATS
Hotkey "F4",            AutoPetDanceGame

; === 1920*1080 resolution / SMALL UI size - Mouse click coordinates {Click X Y (ClickAmount)}

CloseC          := "{Click 1880 520}"
FriendListC     := "{Click 1865 40}"
Friend1C        := "{Click 1740 75 2}"
Friend2C        := "{Click 1740 115 2}"
Friend3C        := "{Click 1740 140 2}"
Friend4C        := "{Click 1740 180 2}"

RealmsC         := "{Click 1240 240}"
ArrorLeftC      := "{Click 640 800}"
ArrorRight7C    := "{Click 830 800 7}"
Realm1C         := "{Click 700 480}"
Realm2C         := "{Click 700 530}"
Realm3C         := "{Click 700 580}"
Realm4C         := "{Click 700 625}"
Realm5C         := "{Click 700 670}"
Realm6C         := "{Click 700 720}"
Realm7C         := "{Click 700 750}"
GoToRealmC      := "{Click 700 860}"

; === 1920*1080 resolution / REGULAR UI size - Mouse click coordinates {Click X Y (ClickAmount)}

CloseC          := "{Click 1870 590}"
FriendListC     := "{Click 1865 40}"
Friend1C        := "{Click 1740 75 2}"
Friend2C        := "{Click 1740 115 2}"
Friend3C        := "{Click 1740 160 2}"
Friend4C        := "{Click 1740 200 2}"

RealmsC         := "{Click 1270 200}"
ArrorLeftC      := "{Click 590 845}"
ArrorRight7C    := "{Click 815 845 7}"
Realm1C         := "{Click 700 480}"
Realm2C         := "{Click 700 530}"
Realm3C         := "{Click 700 580}"
Realm4C         := "{Click 700 625}"
Realm5C         := "{Click 700 670}"
Realm6C         := "{Click 700 720}"
Realm7C         := "{Click 700 765}"
GoToRealmC      := "{Click 700 900}"
