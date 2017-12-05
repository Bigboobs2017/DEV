; #FUNCTION# ====================================================================================================================
; Name ..........: chkLabCheck
; Description ...: 
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
Func chkLabCheck()
	If GUICtrlRead($g_hChkLabCheck) = $GUI_CHECKED Then
	$g_iChkLabCheck = 1		
	Else
	$g_iChkLabCheck = 0		
	EndIf
EndFunc ;==>chkLabCheck
