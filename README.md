# Wizard101 Multi-boxing Tools + More

This AutoHotKey script mainly helps you with multi-boxing in Wizard101 but also provides some other tools.  
All hotkeys are easily customizable via the **config.ini** file.

## Quickstart Guide:

- Launch all windows/characters you want to play with
- Start main.ahk script
- You now want to sort your characters:
  - Focus on the window of your first character
  - Press F12 (default)
  - A message box should open up, telling you that 1/x characters have been assigned. x is the amount of windows you have open in total.
  - Do the same with your next character and with all the other ones as well until the message box says that all characters have been assigned.
- If you now press '1' (on your number row), the focus should switch to your first character. Pressing '2' to your second and so on. This is useful in battle when your characters go into battle the way they are ordered in the window list.

- Now let's setup the teleport. 
  - Put all your characters into the same group. 
  - Switch to the first character in your group (they are always alphabetically sorted). Press F11. Switch to the next character. Press F11. And so on until the message box tells you that all characters have been assigned.
  - Now make sure all your characters have the group tab active, not the friends tab or any other tab. Close that tab on every character. Now switch to the character you want everyone else teleport to. 
  - Now press Tab. If everything went well, you should have a bunch of characters standing inside of you now. If something went wrong, common mistakes (i.e. mistakes that I often do) are not having the groups tab active or having it open. The groups tab needs to be active, but closed. (Might tweak this feature a little in the future)
  
- If you don't want to tediously setup afk spinning on every character, just press F3 and all your characters will jump every now and then. Pressing F3 turns this timer off again.

## Hotkeys: (Default Hotkey - Function)

### Script

- **F1** &ensp; - &ensp; **CloseScriptMain**
  - Exits the main script
- **F2** &ensp; - &ensp; **ToggleSuspension**
  - Toggles suspension state of all hotkeys, except for the CloseScriptMain hotkey. Suspended hotkeys cannot be triggered and can be used as normal again.

### Anti Idle Disconnect

- **F3** &ensp; - &ensp; **ToggleAntiIdleDisconnect**
  - Toggles a timer that makes all characters jump every 8 minutes (by default)

### Multi-press / -click

- **x** &ensp; - &ensp; **PressXEveryWindow**
  - Presses 'x' on every window. Useful in combination with **Teleport** to make all characters talk to the same npc simultaneously.
- **q** &ensp; - &ensp; **PressQEveryWindow**
  - Presses 'q' (opens quest book) on every window.
- **e** &ensp; - &ensp; **PressPEveryWindow**
  - Presses 'p' (opens spells/decks) on every character. I just wanted to press 'e' instead of 'p' to open my decks. Personal preference.
- **space** &ensp; - &ensp; **PressSpaceEveryWindow**
  - Presses 'space' on every character. Useful after pressing 'x', to continue dialogue with NPC on all characters.
- **MButton** &ensp; - &ensp; **LClickEveryWindow**
  - Clicks the left mouse button at the current cursor position on all windows. Useful if you need to go through the same menu on multiple characters. MButton means Middle Mouse Button.

### Realms

- **F5** &ensp; - &ensp; **SwitchRealms**
  - Makes all characters switch to different realms. Useful for reagent farming. Consecutive realm switches makes the characters go further down the realm list (with Wu being the first and Ambrose being the last realm).
- **F9** &ensp; - &ensp; **ResetRealms**
  - Resets the SwitchRealms Hotkey to start at the first realm again.

### Multi-Teleport

- **F11** &ensp; - &ensp; **SetupTeleport**
  - Required for the next hotkey, Teleport. First, make all your characters join the same group. Your group is automatically alphabetically sorted. Now press this hotkey (default=F11) on the first character of your group. Then do it again on your second character, then on your third, then on your fourth (or less characters). A message box should tell you how many characters have been assigned. Also, make sure the "group" tab is the selected tab in your friends list, on all characters. Now close the tab on all characters and you should be good to go.
- **Tab** &ensp; - &ensp; **Teleport**
  - A lifesaver. The most useful hotkey imo. If you have setup this hotkey correctly (see SetupTeleport above), pressing Tab teleports all *other* characters *towards you*. This, in combination with the 'x' and 'space' hotkey, make the game feel like you're playing a single character.

### Window Management
- **LShift + F12** &ensp; - &ensp; **GetWizClientList**
  - Sorts all windows depending on the order they are stacked on your desktop. Also refreshes the internal list of windows. Use this hotkey, if you have added or removed windows after starting the main script.
- **F12** &ensp; - &ensp; **AssignWindows**
  - Manually sort the window order. Similar to the SetupTeleport hotkey, press this hotkey on every character, in order you want them sorted. Press F12 (default) on your first character, again on your second and so on.
- **1** &ensp; - &ensp; **FocusFirstWindow**
  - Switch focus to your first character/window. The way your characters are ordered depends on (one of) the previous two hotkeys. The next three hotkeys do the same things for your other characters.
- **2** &ensp; - &ensp; **FocusSecondWindow**
- **3** &ensp; - &ensp; **FocusThirdWindow**
- **4** &ensp; - &ensp; **FocusFourthWindow**

### Autonomous Dancers
- **F4** &ensp; - &ensp; **AutoPetDanceGame**
  - Makes pets dance without requiring your input. Go to the Dance Game, select a world, then press this hotkey. Make pets work for themselves.
- **Shift + F4** &ensp; - &ensp; **AutoPetDanceGameRepeat**
  - The same as F4, only that this hotkey repeats the whole process automatically. Once the game is won, it selects the first snack in your inventory and then starts a new game of the same world. This loop can be stopped by pressing **Del** while the pet game is running. 

## Configurations:
- This script is made for a 1920 * 1080p resolution and the small UI size option (inside the game settings)
  - Inside the config.ahk file is code to make the script work for regular UI size.
    - Remove all the semicolons from the configurations block at the end of the file (except the title) and add semicolons to the block with the small UI size options.
- If you want to make this script work for other resolutions or other sizes, kindly ask me to add them or add them yourself. AutoHotkey provides a 'Window Spy' with that you can see the x and y coordinates of your mouse cursor. With help of the Window Spy you can edit the config.ahk file to fit your resolution.
