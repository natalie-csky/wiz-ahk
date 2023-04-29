WindowList := WinGetList("ahk_exe WizardGraphicalClient.exe")

GetWizClientList(ThisHotkey)
{
    global WindowList := WinGetList("ahk_exe WizardGraphicalClient.exe")
    AmountClients := WindowList.Length
    if(not AmountClients)
    {
        MsgBox "No clients found"
    }
    else
    {
        MsgBox AmountClients . " Client(s) automatically assigned by window layers"
    }
}