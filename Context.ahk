#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey
#MaxHotkeysPerInterval 200
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;TODO:
;Fix "restore", "teleport", windows
;multiple attempts to activate?

#SingleInstance force
CoordMode, Mouse, Screen

BSZ=25
BDR=5
Gui, font, s16 cSilver, Consolas
Gui, Add, Text, % "X" . (2*BDR)       . " Y" . (BSZ*3+BDR) . " W" . BSZ . " H25", v
Gui, Add, Text, % "X" . (BSZ+2*BDR)   . " Y" . (BSZ*3+BDR) . " W" . BSZ . " H25", X

SysGet, numMon, MonitorCount
Loop, %numMon%
{
	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+BDR)       . " Y" . BDR          . "  W" . BSZ . " H" . BSZ, 
	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+BSZ+BDR)   . " Y" . BDR          . "  W" . BSZ . " H" . BSZ, |
	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+2*BSZ+BDR) . " Y" . BDR          . "  W" . BSZ . " H" . BSZ,

	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+BDR)       . " Y" . (BSZ+BDR)    . "  W" . BSZ . " H" . BSZ, -
	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+BSZ+BDR)   . " Y" . (BSZ+BDR)    . "  W" . BSZ . " H" . BSZ, %A_Index%
	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+2*BSZ+BDR) . " Y" . (BSZ+BDR)    . "  W" . BSZ . " H" . BSZ, -

	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+BDR)       . " Y" . (BSZ*2+BDR)  . "  W" . BSZ . " H" . BSZ, 
	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+BSZ+BDR)   . " Y" . (BSZ*2+BDR)  . "  W" . BSZ . " H" . BSZ, |
	Gui, Add, Text, % "X" . ((A_Index-1)*(3*BSZ+2*BDR)+2*BSZ+BDR) . " Y" . (BSZ*2+BDR)  . "  W" . BSZ . " H" . BSZ,
	 
	SysGet, Mon%A_Index%, MonitorWorkArea, %A_Index%

	Mon%A_Index%TLX:=	 Mon%A_Index%Left
	Mon%A_Index%TLY:=	 Mon%A_Index%Top
	Mon%A_Index%TLW:=	(Mon%A_Index%Right-Mon%A_Index%Left)/2
	Mon%A_Index%TLH:=	(Mon%A_Index%Bottom-Mon%A_Index%Top)/2
	Mon%A_Index%TX :=	 Mon%A_Index%Left
	Mon%A_Index%TY :=	 Mon%A_Index%Top
	Mon%A_Index%TW :=	(Mon%A_Index%Right-Mon%A_Index%Left)
	Mon%A_Index%TH :=	(Mon%A_Index%Bottom-Mon%A_Index%Top)/2
	Mon%A_Index%TRX:=	 Mon%A_Index%Left+Mon%A_Index%TLW
	Mon%A_Index%TRY:=	 Mon%A_Index%Top
	Mon%A_Index%TRW:=	(Mon%A_Index%Right-Mon%A_Index%Left)/2
	Mon%A_Index%TRH:=	(Mon%A_Index%Bottom-Mon%A_Index%Top)/2

	Mon%A_Index%MLX:=	 Mon%A_Index%Left
	Mon%A_Index%MLY:=	 Mon%A_Index%Top
	Mon%A_Index%MLW:=	(Mon%A_Index%Right-Mon%A_Index%Left)/2
	Mon%A_Index%MLH:=	(Mon%A_Index%Bottom-Mon%A_Index%Top)
	Mon%A_Index%MBX:=	 Mon%A_Index%Left
	Mon%A_Index%MBY:=	 Mon%A_Index%Top
	Mon%A_Index%MBW:=	(Mon%A_Index%Right-Mon%A_Index%Left)
	Mon%A_Index%MBH:=	(Mon%A_Index%Bottom-Mon%A_Index%Top)
	Mon%A_Index%MRX:=	 Mon%A_Index%Left+Mon%A_Index%MLW
	Mon%A_Index%MRY:=	 Mon%A_Index%Top
	Mon%A_Index%MRW:=	(Mon%A_Index%Right-Mon%A_Index%Left)/2
	Mon%A_Index%MRH:=	(Mon%A_Index%Bottom-Mon%A_Index%Top)

	Mon%A_Index%BLX:=	 Mon%A_Index%Left
	Mon%A_Index%BLY:=	 Mon%A_Index%Top+Mon%A_Index%TLH
	Mon%A_Index%BLW:=	(Mon%A_Index%Right-Mon%A_Index%Left)/2
	Mon%A_Index%BLH:=	(Mon%A_Index%Bottom-Mon%A_Index%Top)/2
	Mon%A_Index%BX :=	 Mon%A_Index%Left
	Mon%A_Index%BY :=	 Mon%A_Index%Top+Mon%A_Index%TLH
	Mon%A_Index%BW :=	(Mon%A_Index%Right-Mon%A_Index%Left)
	Mon%A_Index%BH :=	(Mon%A_Index%Bottom-Mon%A_Index%Top)/2
	Mon%A_Index%BRX:=	 Mon%A_Index%Left+Mon%A_Index%TLW
	Mon%A_Index%BRY:=	 Mon%A_Index%Top+Mon%A_Index%TLH
	Mon%A_Index%BRW:=	(Mon%A_Index%Right-Mon%A_Index%Left)/2
	Mon%A_Index%BRH:=	(Mon%A_Index%Bottom-Mon%A_Index%Top)/2
}
Gui, Add, Text, % "X" . (BSZ*2+2*BDR) . " Y" . (BSZ*3+BDR) . " W" . BSZ . " H25", -
Gui, Add, Text, % "X" . (BSZ*3+2*BDR) . " Y" . (BSZ*3+BDR) . " W" . BSZ . " H25", -
Gui, Add, Text, % "X" . (BSZ*4+2*BDR) . " Y" . (BSZ*3+BDR) . " W" . BSZ . " H25", -
Gui, Add, Text, % "X" . (BSZ*5+2*BDR) . " Y" . (BSZ*3+BDR) . " W" . BSZ . " H25", -


Gui, -Caption +ToolWindow
Gui, color, Gray
GUI, Show, % "w" . (BSZ*3+BDR*2)*numMon . " h" . (BSZ*4+BDR*2), contextUtil
WinWaitActive, contextUtil
WinGet, GuiID, ID, A
Winset, Region, % "0-0 W" . (BSZ*3+BDR*2)*numMon .  " H" . (BSZ*4+BDR*2) . " R" . (BDR*4) . "-" . (BDR*4), A

Gui, hide
Return

Static1:
	Gui, Hide
	WinActivate, ahk_id, %ActiveID%
	WinWaitActive, ahk_id %ActiveID%
	WinMinimize, A
Return
Static2:
	Gui, Hide
	WinActivate, ahk_id, %ActiveID%
	WinWaitActive, ahk_id %ActiveID%
	WinClose, A	
Return
GuiEscape:
	Gui, Hide
Return


Capslock:: Send {enter}
!capslock:: Send !{enter}
^Capslock:: Send ^{enter}


$NumpadDot::
	MouseGetPos, mouseX, mouseY, ActiveID
	if ActiveID
	{
		WinGetClass, wClass, ahk_id %ActiveID%

    	WinGetClass, WinClass, A
    	If wClass = EASTBrowser
    	{
            GuiControl,,Static30, D
            GuiControl,,Static31, K
            GuiControl,,Static32, -
            GuiControl,,Static33, -
    	}
    	else if wClass = SunAwtFrame
    	{
            GuiControl,,Static30, D
            GuiControl,,Static31, -
            GuiControl,,Static32, -
            GuiControl,,Static33, -
    	}
    	else if wClass = Chrome_WidgetWin_1
    	{
    	}
    	else if wClass = AcrobatSDIWindow
    	{
            GuiControl,,Static30, R
            GuiControl,,Static31, O
            GuiControl,,Static32, S
            GuiControl,,Static33, N
    	}
    	else if wClass = EASTMainFrame
    	{
    	    GuiControl,,Static30, *
            GuiControl,,Static31, P
            GuiControl,,Static32, D
            GuiControl,,Static33, -
    	}
    	else
    	{
            GuiControl,,Static30, -
            GuiControl,,Static31, -   	
            GuiControl,,Static32, -
            GuiControl,,Static33, -
    	}
		AM=1
		while mouseX>Mon%AM%Right
			AM+=1	
		Gui, Show, % "x" . (mouseX-(BSZ*3+BDR*2)/2-(AM-1)*(BSZ*3+BDR*2)) . " y" . (mouseY-(BSZ*3+BDR*2)/2)
		keywait, NumpadDot
		MouseGetPos,,,mouseWin,ControlNN
		Gui, Hide
		WinActivate, ahk_id %ActiveID%
		WinWaitActive, ahk_id %ActiveID%,,2
		WinGet, MinMaxState, MinMax, A	
		if (mouseWin = GuiID && ErrorLevel != 1 && ControlNN != "" )
			GoSub, %ControlNN%
	}
Return

Static30:
    If wClass = EASTBrowser
    {
        WinMove,A,,Mon2Left,Mon3Top,% Mon3Right-Mon2Left,Mon3Bottom-Mon2Top
    }
    else if wClass = SunAwtFrame
    {
        WinMove,A,,Mon2Left,Mon3Top,% Mon3Right-Mon2Left,Mon3Bottom-Mon2Top
    }
    else if wClass = Chrome_WidgetWin_1
    {
    }
    else if wClass = AcrobatSDIWindow
    {
        Send ^+r
        Send {enter}
    }
    else if wClass = EASTMainFrame
    {
        ControlClick, &DBs, A
        WinWaitActive, Search and Retrieval Options,,2
        if ErrorLevel = 0
        {
            Send, +{tab}+{tab}{space}{tab}{tab}{space}{down}{down}{space}{down}{space}{down}{space}{down}{down}{space}{down}{space}{down}{space}{enter}S
        }
    }
    else
    {
    }
Return
Static31:
    If wClass = EASTBrowser
    {
    ControlGet, CBtxt, Choice,, ComboBox1, A
    If CBtxt=FULL
        Control, ChooseString, KWIC, ComboBox1, A
    else if CBtxt=KWIC
        Control, ChooseString, FULL, ComboBox1, A
        
    }
    else if wClass = SunAwtFrame
    {
    }
    else if wClass = Chrome_WidgetWin_1
    {
    }
    else if wClass = AcrobatSDIWindow
    {
        Send !dcr
        Send {enter}
    }
    else if wClass = EASTMainFrame
    {
        ControlClick, &DBs, A
        WinWaitActive, Search and Retrieval Options,,2
        if ErrorLevel = 0
        {
            Send, +{tab}+{tab}{space}{tab}{tab}{space}{down}{down}{space}{enter}S
        }
    }
    else
    {
    }
Return
Static32:
    If wClass = EASTBrowser
    {    
    }
    else if wClass = SunAwtFrame
    {
    }
    else if wClass = Chrome_WidgetWin_1
    {
    }
    else if wClass = AcrobatSDIWindow
    {
        Send !ws
    }
    else if wClass = EASTMainFrame
    {
        ControlClick, &DBs, A
        WinWaitActive, Search and Retrieval Options,,2
        if ErrorLevel = 0
        {
            Send, +{tab}+{tab}{space}{tab}{tab}{down}{down}{down}{down}{down}{down}{down}{space}{enter}S
        }
    }
    else
    {
    }
Return
Static33:
    If wClass = EASTBrowser
    {    
    }
    else if wClass = SunAwtFrame
    {
    }
    else if wClass = Chrome_WidgetWin_1
    {
    }
    else if wClass = AcrobatSDIWindow
    {
    Send !wn
    }
    else
    {
    }
Return


Static3:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1TLX,Mon1TLY,Mon1TLW,Mon1TLH	
Return
Static4:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1TX,Mon1TY,Mon1TW,Mon1TH	
Return
Static5:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1TRX,Mon1TRY,Mon1TRW,Mon1TRH
	
Return
Static6:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1MLX,Mon1MLY,Mon1MLW,Mon1MLH
Return
Static7:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1MBX,Mon1MBY
	WinMaximize, A
Return
Static8:
	If MinMaxState !=0
		WinRestore, A
	WinMove,A,,Mon1MRX,Mon1MRY,Mon1MRW,Mon1MRH
Return
Static9:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1BLX,Mon1BLY,Mon1BLW,Mon1BLH	
Return
Static10:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1BX,Mon1BY,Mon1TW,Mon1BH	
Return
Static11:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon1BRX,Mon1BRY,Mon1BRW,Mon1BRH
Return


Static12:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2TLX,Mon2TLY,Mon2TLW,Mon2TLH	
Return
Static13:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2TX,Mon2TY,Mon2TW,Mon2TH	
Return
Static14:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2TRX,Mon2TRY,Mon2TRW,Mon2TRH
	
Return
Static15:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2MLX,Mon2MLY,Mon2MLW,Mon2MLH
Return
Static16:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2MBX,Mon2MBY
	WinMaximize, A
Return
Static17:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2MRX,Mon2MRY,Mon2MRW,Mon2MRH
Return
Static18:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2BLX,Mon2BLY,Mon2BLW,Mon2BLH	
Return
Static19:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2BX,Mon2BY,Mon2TW,Mon2BH	
Return
Static20:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon2BRX,Mon2BRY,Mon2BRW,Mon2BRH
	
Return

Static21:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3TLX,Mon3TLY,Mon3TLW,Mon3TLH	
Return
Static22:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3TX,Mon3TY,Mon3TW,Mon3TH	
Return
Static23:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3TRX,Mon3TRY,Mon3TRW,Mon3TRH
	
Return
Static24:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3MLX,Mon3MLY,Mon3MLW,Mon3MLH
Return
Static25:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3MBX,Mon3MBY
	WinMaximize, A
Return
Static26:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3MRX,Mon3MRY,Mon3MRW,Mon3MRH
Return
Static27:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3BLX,Mon3BLY,Mon3BLW,Mon3BLH	
Return
Static28:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3BX,Mon3BY,Mon3TW,Mon3BH	
Return
Static29:
	If MinMaxState != 0
		WinRestore, A
	WinMove,A,,Mon3BRX,Mon3BRY,Mon3BRW,Mon3BRH	
Return


ActivateMouseWindow:
    MouseGetPos, mouseX, mouseY, WinID
    WinGet, CurID, ID, A
    if (CurID <> WinID) {
        WinActivate, ahk_id %WinID%
        WinWaitActive, ahk_id %WinID%,,1
    }
Return


$Numpad0::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		
	}
	else if WinClass = SunAwtFrame
	{
		
	}	
	else if WinClass = Chrome_WidgetWin_1
	{
		Send ^z

	}
	else if WinClass = AcrobatSDIWindow
	{
		Send ^z
	}
	else
	{
		Send ^z
	}
Return

$Numpad3::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		
	}
	else if WinClass = SunAwtFrame
	{
		
	}	
	else if WinClass = Chrome_WidgetWin_1
	{
		Send {esc}
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send {esc}
	}
	else
	{
		Send {esc}
	}
Return

$Numpad1::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		
	}
	else if WinClass = SunAwtFrame
	{
		
	}	
	else if WinClass = Chrome_WidgetWin_1
	{
		
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send ^s
	}
	else
		Send ^s
Return

$Numpad2::
    Gosub, ActivateMouseWindow
    if ErrorLevel
       return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		SendEvent {NumPad7}
	}
	else if WinClass = SunAwtFrame
	{
		Send {NumPad7}
	}
	else if WinClass = Chrome_WidgetWin_1
	{
		Send {Rctrl Down}
		keywait, Numpad2
		Send {Rctrl Up}
	}
	else if WinClass = AcrobatSDIWindow
	{		
		Send {Rctrl Down}
		keywait, Numpad2
		Send {Rctrl Up}
	}
	else
	{
		Send {Rctrl Down}
		keywait, Numpad2
		Send {Rctrl Up}
	}
Return


$Numpad4::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		SendEvent {Numpad1}
	}
	else if WinClass = SunAwtFrame
	{
		Send {Numpad1}
	}	
	else if WinClass = Chrome_WidgetWin_1
	{
		Send !{Right}
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send ^{End}
	}
	else
		Send ^{End}
Return



$!Numpad4::
    Gosub, ActivateMouseWindow
    if ErrorLevel
       return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		SendEvent {NumPad7}
	}
	else if WinClass = SunAwtFrame
	{
		Send {NumPad7}
	}
	else if WinClass = Chrome_WidgetWin_1
	{
		Send !{Left}
	}
	else if WinClass = AcrobatSDIWindow
	{
        Send ^{home}
	}
	else
	{
        Send ^{home}
	}
Return

$Numpad5::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		SendEvent {Numpad3}
	}
	else if WinClass = SunAwtFrame
	{
		Send {Numpad3}
	}
	else if WinClass = Chrome_WidgetWin_1
	{
		Send {PgDn}
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send {PgDn}
	}
	else
		Send {PgDn}
Return
$!Numpad5::
    Gosub, ActivateMouseWindow
    if ErrorLevel
       return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		SendEvent {Numpad9}
	}
	else if WinClass = SunAwtFrame
	{
		Send {Numpad9}
	}
	else if WinClass = Chrome_WidgetWin_1
	{
		Send {PgUp}
	} 
	else if WinClass = AcrobatSDIWindow
	{
		Send {PgUp}
	}
	else
		Send {PgUp}
Return

$Numpad6::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		SendEvent {Numpad2}
	}
	else if WinClass = SunAwtFrame
	{
		Send {Numpad3}
	}
	else if WinClass = Chrome_WidgetWin_1
	{
		Send ^{Tab}
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send {F3}
	}
	else
		Send {F3}
Return
$!Numpad6::
    Gosub, ActivateMouseWindow
    if ErrorLevel
       return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		SendEvent {Numpad8}
	}
	else if WinClass = SunAwtFrame
	{
		Send {Numpad9}
	}
	else if WinClass = Chrome_WidgetWin_1
	{
		Send +^{Tab}
	} 
	else if WinClass = AcrobatSDIWindow
	{
		Send +{F3}
	}
	else
		Send +{F3}
Return

$Numpad7::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
	}
	else if WinClass = SunAwtFrame
	{
	}
	else if WinClass = Chrome_WidgetWin_1
	{
	}
	else if WinClass = AcrobatSDIWindow
	{	
		Send {shift down}
		Sleep 10
		Send {d down}
		Sleep 10
		Send {d up}
		Sleep 10
		Send {shift up}
	}
Return
$!Numpad7::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
	}
	else if WinClass = SunAwtFrame
	{
	}
	else if WinClass = Chrome_WidgetWin_1
	{
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send {d}{LButton Down}
		keywait, Numpad7
		Send {LButton Up}
		Sleep 50
		Send h
	}
Return


$Numpad8::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
	}
	else if WinClass = SunAwtFrame
	{
	}
	else if WinClass = Chrome_WidgetWin_1
	{
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send v{LButton Down}
		keywait, Numpad8
		Send {LButton Up}
		Sleep 50
		Send h
	}
Return
$!Numpad8::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
	}
	else if WinClass = SunAwtFrame
	{
	}
	else if WinClass = Chrome_WidgetWin_1
	{
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send {u}{LButton Down}
		keywait, Numpad8
		Send {LButton Up}
		Sleep 50
		Send h
	}
Return

$Numpad9::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
	}
	else if WinClass = SunAwtFrame
	{
	}
	else if WinClass = Chrome_WidgetWin_1
	{
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send {esc}
	}
Return
$!Numpad9::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
	}
	else if WinClass = SunAwtFrame
	{
	}
	else if WinClass = Chrome_WidgetWin_1
	{
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send {x}{LButton Down}
		keywait, Numpad9
		Send {LButton Up}
	}
	else
		Send {esc}
Return


$NumPadDiv::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	WinGetClass, WinClass, A
	If WinClass = EASTBrowser
	{
		Send !{F4}
	}
	else if WinClass = SunAwtFrame
	{
		Send ^+c
	}
	else if WinClass = Chrome_WidgetWin_1
	{
		Send ^w
	}
	else if WinClass = AcrobatSDIWindow
	{
		Send !{F4}
	}
	else
		Send !{F4}

Return
$!NumPadDiv::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	Send #{Left}
Return

$NumPadMult::
	Send {Enter}
Return
$!NumPadMult::
    Gosub, ActivateMouseWindow
    if ErrorLevel
        return
	Send #{Right}
Return
