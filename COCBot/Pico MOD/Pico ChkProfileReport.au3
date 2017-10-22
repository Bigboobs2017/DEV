; #FUNCTION# ====================================================================================================================
; Name ..........: chkProfileReport
; Description ...: This file is all related to Gaining XP by Attacking to Goblin Picninc Signle player
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: rulesss(2017)
; Modified ......: 
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func chkProfileReport()
	If GUICtrlRead($g_hChkProfileReport) = $GUI_CHECKED Then
	$g_iChkProfileReport = 1		
	Else
	$g_iChkProfileReport = 0		
	EndIf
EndFunc ;==>chkProfileReport