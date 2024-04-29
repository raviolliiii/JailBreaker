Dim Arg

Set Arg = WScript.Arguments
id = Arg(0)
src  = Arg(1)
name = Arg(2)
icon = Arg(3)
iconsCount = Arg(4)

Dim objShell, DesktopPath, objShortCut, MyTab
Set objShell = CreateObject("WScript.Shell")
MyTab = Split(src,"\")

DesktopPath = objShell.SpecialFolders("Desktop")

for i=0 To iconsCount
    Set objShortCut = objShell.CreateShortcut(DesktopPath & "\" & name & i & id & ".lnk")

    objShortCut.TargetPath = Chr(34) & src & Chr(34)
    ObjShortCut.IconLocation = icon
    objShortCut.Save
Next