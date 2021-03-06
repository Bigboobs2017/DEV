
; #FUNCTION# ====================================================================================================================
; Name ..........: getArmyTroopTime
; Description ...: Obtains time reamining in mimutes for Troops Training - Army Overview window
; Syntax ........: getArmyTroopTime($bOpenArmyWindow = False, $bCloseArmyWindow = False)
; Parameters ....:
; Return values .:
; Author ........: Promac(04-2016), MonkeyHunter (04-2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
;
Global $g_hTrainTimeLeft = 0 ; TimerHandle New Used in Donate/Train only Mode - Ezeck 6-14-17
Func getArmyTroopTime($bOpenArmyWindow = False, $bCloseArmyWindow = False, $bSetLog = True, $CheckWindow = True)

	If $g_iDebugSetlogTrain = 1 Or $g_iDebugSetlog = 1 Then SetLog("Begin getArmyTroopTime:", $COLOR_DEBUG1)

	$g_aiTimeTrain[0] = 0 ; reset time

	If $CheckWindow Then
		If Not $bOpenArmyWindow And Not IsTrainPage() Then ; check for train page
			SetError(1)
			Return ; not open, not requested to be open - error.
		ElseIf $bOpenArmyWindow Then
			If Not OpenArmyOverview() Then
				SetError(2)
				Return ; not open, requested to be open - error.
			EndIf
			If _Sleep($DELAYCHECKARMYCAMP5) Then Return
		EndIf
	EndIf

	; Verify is the Barracks is Boosted
	Local $bBoosted = False
	If QuickMIS("BC1", @ScriptDir & "\imgxml\Resources\Boosted", 690, 155, 750, 190) Then ; search for treasury button
		$bBoosted = True
	Endif

	Local $sResultTroops = getRemainTrainTimer(756, 169) ;Get time via OCR.
	$g_aiTimeTrain[0] = ConvertOCRTime("Troops", $sResultTroops, $bSetLog) ; update global array ;value is in min's

	If $bBoosted then
		;$g_aiTimeTrain[0] = $g_aiTimeTrain[0] / 4
		Setlog("Boosted Barracks detected!", $COLOR_INFO)
	EndIf

;==================================================
	; Used in Donate/Train only Mode - Ezeck 6-14-17
	; Set the Timer to be used in train donate only, durring the donate cycle
		If ($g_iCommandStop = 3 Or $g_iCommandStop = 0) Then
			$g_hTrainTimeLeft = TimerInit()
		EndIf
;==================================================

	If $bCloseArmyWindow Then
		ClickP($aAway, 1, 0, "#0000") ;Click Away
		If _Sleep($DELAYCHECKARMYCAMP4) Then Return
	EndIf
EndFunc   ;==>getArmyTroopTime
