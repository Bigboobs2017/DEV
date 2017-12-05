; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "MOD" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: ProMac ( 2017)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

; *********************************** JUST INFOS ************************************
; To change the Child Tabs Icons ITEM1 , ITEM 2 and ITEM 3 :
; GUI Control.au3 line 1841 :
; Case $g_hGUI_MOD_TAB
; the icons for MOD tab
;Local $aIconIndex[3] = [$eIcnPBNotify, $eIcnPBNotify, $eIcnPBNotify]

; TO change the TAB icon MOD
; GUI Control.au3 line 1793 :
; Case $g_hTabMain
; the icons for main tab
;Local $aIconIndex[6] = [$eIcnHourGlass, $eIcnTH11, $eIcnAttack, ** $eIcnPBNotify ** , $eIcnGUI, $eIcnInfo]

; *********************************** END  INFOS ************************************

; ================================================== SWITCH ACCOUNT PART ================================================== ;
Global $chkEnableSwitchAccount = 0, $lblNB = 0, $g_cmbAccountsQuantity = 0
Global $g_achkCanUse[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_achkDonateAccount[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_acmbAccount[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_cmbMaxStayDelay = 0, $g_cmbMinDelayToSwitch = 0
Global $g_lblEndSwitchAccount

; ================================================== BOT HUMANIZATION PART ================================================== ;
Global $g_chkUseBotHumanization = 0, $g_chkUseAltRClick = 0, $g_acmbPriority = 0, $g_challengeMessage = 0, $g_ahumanMessage
Global $g_Label1 = 0, $g_Label2 = 0, $g_Label3 = 0, $g_Label4 = 0
Global $g_Label5 = 0, $g_Label6 = 0, $g_Label7 = 0, $g_Label8 = 0
Global $g_Label9 = 0, $g_Label10 = 0, $g_Label11 = 0, $g_Label12 = 0
Global $g_Label14 = 0, $g_Label15 = 0, $g_Label16 = 0, $g_Label13 = 0
Global $g_Label17 = 0, $g_Label18 = 0, $g_Label20 = 0
Global $g_chkCollectAchievements = 0, $g_chkLookAtRedNotifications = 0, $g_cmbMaxActionsNumber = 0
Global $g_acmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_acmbMaxSpeed[2] = [0, 0]
Global $g_acmbPause[2] = [0, 0]
Global $g_ahumanMessage[2] = ["", ""]

; ================================================== TREASURY COLLECT PART ================================================== ;
Global $g_chkEnableTrCollect = 0, $g_chkForceTrCollect = 0
Global $g_chkGoldTrCollect = 0, $g_chkElxTrCollect = 0, $g_chkDarkTrCollect = 0
Global $g_txtMinGoldTrCollect = 0, $g_txtMinElxTrCollect = 0, $g_txtMinDarkTrCollect = 0
Global $g_chkFullGoldTrCollect = 0, $g_chkFullElxTrCollect = 0, $g_chkFullDarkTrCollect = 0

; ================================================== AUTO UPGRADE PART ================================================== ;
Global $g_chkAutoUpgrade = 0, $g_FirstAutoUpgradeLabel = 0, $g_AutoUpgradeLog = 0
Global $g_SmartMinGold = 0, $g_SmartMinElixir = 0, $g_SmartMinDark = 0
Global $g_chkResourcesToIgnore[3] = [0, 0, 0]
Global $g_chkUpgradesToIgnore[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

; ================================================== BB FEATURES PART ================================================== ;
Global $g_alblBldBaseStats[4] = ["", "", ""], $g_chkCollectBldGE = 0, $g_chkCollectBldGems = 0, $g_chkActivateClockTower = 0
Global $g_chkBBSuggestedUpgrades = 0, $g_chkBBSuggestedUpgradesIgnoreGold = 0 , $g_chkBBSuggestedUpgradesIgnoreElixir , $g_chkBBSuggestedUpgradesIgnoreHall = 0
Global $g_chkPlacingNewBuildings = 0

; ================================================== Super XP PART ================================================== ;
Global $grpSuperXP = 0 , $chkEnableSuperXP = 0 , $rbSXTraining = 0 , $lblLOCKEDSX = 0 , $rbSXIAttacking = 0 , $txtMaxXPtoGain = 0
Global $chkSXBK = 0 , $chkSXAQ = 0 , $chkSXGW = 0
Global $DocXP1 = 0 , $DocXP2 = 0 , $DocXP3 = 0 ,$DocXP4 = 0
Global $lblXPatStart = 0 , $lblXPCurrent = 0 , $lblXPSXWon = 0 , $lblXPSXWonHour = 0

; ================================================== Chat FEATURES PART ================================================== ;
Global $cmblang = 0, $icmblang = 8
Global $chkGlobalChat = 0,$chkGlobalScramble = 0,$chkSwitchLang = 0,$TxtGlobChatTimeDalay = 0, $chkClanChat = 0
Global $chkUseResponses = 0,$chkUseGeneric = 0,$chkChatNotify = 0,$chkPbSendNewChats = 0
Global $editGlobalMessages1 = "", $editGlobalMessages2 = "",$editGlobalMessages3 = "",$editGlobalMessages4 = ""
Global $editResponses = 0,$editGeneric = 0,$ChatbotQueuedChats[0],$ChatbotReadQueued = False,$ChatbotReadInterval = 0,$ChatbotIsOnInterval = False,$TmpResp
Global $g_alblAinGlobal,$g_alblSGchats,$g_alblSwitchlang,$g_alblChatclan,$g_alblUsecustomresp,$g_alblUsegenchats,$g_alblNotifyclanchat,$g_alblSwitchlang,$g_alblUseremotechat,$g_alblTimeDalay
Global $g_hGUI_MOD = 0

; For future child Tabs
; #include "MBR GUI Design Child MOD - ITEMXXX.au3"
; The Child Tabs
Global $g_hGUI_MOD_TAB = 0, $g_hGUI_MOD_TAB_ITEM1 = 0, $g_hGUI_MOD_TAB_ITEM2 = 0, $g_hGUI_MOD_TAB_ITEM3 = 0, $g_hGUI_MOD_TAB_ITEM4 = 0, $g_hGUI_MOD_TAB_ITEM5 = 0, $g_hGUI_MOD_TAB_ITEM6 = 0, $g_hGUI_MOD_TAB_ITEM7 = 0, $g_hGUI_MOD_TAB_ITEM8 = 0

Func CreateMODTab()

	$g_hGUI_MOD = _GUICreate("", $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hFrmBotEx)

	GUISwitch($g_hGUI_MOD)
	$g_hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, BitOR($TCS_SINGLELINE, $TCS_RIGHTJUSTIFY))
	$g_hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem("Profiles")
	CreateBotProfiles()
	TabItem1()
	$g_hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem("Treasury")
	TabItem3()
	$g_hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem("Humanization")
	TabItem2()
	$g_hGUI_MOD_TAB_ITEM4 = GUICtrlCreateTabItem("Auto Upgrade")
	TabItem4()
	$g_hGUI_MOD_TAB_ITEM5 = GUICtrlCreateTabItem("Builders Base")
	TabItem5()
    $g_hGUI_MOD_TAB_ITEM6 = GUICtrlCreateTabItem("Goblin XP")
    TabItem6()
	$g_hGUI_MOD_TAB_ITEM7 = GUICtrlCreateTabItem("Forecast")
    TabItem7()
	; needed to init the window now, like if it's a tab
    $g_hGUI_MOD_TAB_ITEM8 = GUICtrlCreateTabItem("Chat")
	TabItem8()
	CreateDropOrderGUI()

	GUICtrlCreateTabItem("")

EndFunc   ;==>CreateMODTab

; ITEM TABS ZONE
Func TabItem1()

	Local $x = 11, $z = 189, $w = 357, $y = 85

	GUICtrlCreateGroup("Smart Switch Accounts", $x, $y, 430, 330)

	$x += 10
	$y += 20

	$chkEnableSwitchAccount = GUICtrlCreateCheckbox("Use Smart Switch Accounts", $x, $y, 152, 17)
	GUICtrlSetOnEvent(-1, "chkSwitchAccount")
	$lblNB = GUICtrlCreateLabel("Number of accounts on Emulator :", $x + 195, $y + 2, 165, 17)
	$g_cmbAccountsQuantity = GUICtrlCreateCombo("", $x + 365, $y - 2, 45, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "cmbAccountsQuantity")
	GUICtrlSetData(-1, "2|3|4|5|6|7|8", "2")

	$y += 35

	$g_achkCanUse[1] = GUICtrlCreateCheckbox("Use Account 1 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[1] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[1] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")

	$y += 30

	$g_achkCanUse[2] = GUICtrlCreateCheckbox("Use Account 2 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[2] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[2] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")

	$y += 30

	$g_achkCanUse[3] = GUICtrlCreateCheckbox("Use Account 3 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[3] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[3] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")

	$y += 30

	$g_achkCanUse[4] = GUICtrlCreateCheckbox("Use Account 4 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[4] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[4] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")

	$y += 30

	$g_achkCanUse[5] = GUICtrlCreateCheckbox("Use Account 5 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[5] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[5] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")

	$y += 30

	$g_achkCanUse[6] = GUICtrlCreateCheckbox("Use Account 6 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[6] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[6] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")

	$y += 30

	$g_achkCanUse[7] = GUICtrlCreateCheckbox("Use Account 7 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[7] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[7] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")

	$y += 30

	$g_achkCanUse[8] = GUICtrlCreateCheckbox("Use Account 8 with Profile :", $x, $y, 150, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_acmbAccount[8] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	$g_achkDonateAccount[8] = GUICtrlCreateCheckbox("Donate only", $w, $y, 77, 17)
	GUICtrlSetOnEvent(-1, "chkAccountsProperties")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	setupProfileComboBox()
	;PopulatePresetComboBox()

	$y += 35

	GUICtrlCreateLabel("Stay on Accounts max", $x, $y + 2, -1, 17)
	$g_cmbMaxStayDelay = GUICtrlCreateCombo("", $x + 110, $y - 2, 45, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "20|25|30|35|40|45|50|55|60", "30")
	_GUICtrlSetTip(-1, "That will force Switch Account to Switch, even if Army is ready when delay is exceeded." & @CRLF & _
					   "That is useful if you are in higher league, where search delay is very long, so, when attack" & @CRLF & _
					   "is finished, you army is always ready, so Switch Account never Switch to another account." & @CRLF & _
					   "This setting allow to prevent that to happens, by force switching after selected delay.")
	GUICtrlSetOnEvent(-1, "cmbMaxStayDelay")
	GUICtrlCreateLabel("mins", $x + 160, $y + 2, -1, 17)

	$x += 200

	GUICtrlCreateLabel("Don't switch if Train Delay <", $x, $y + 2, -1, 17)
	$g_cmbMinDelayToSwitch = GUICtrlCreateCombo("", $x + 138, $y - 2, 45, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1|2|3|4|5|8|10|15", "3")
	_GUICtrlSetTip(-1, "That will prevent Switch Account to Switch if remaining train delay for current account is short." & @CRLF & _
					   "Warning: this setting is overwritten by Max Stay on Account delay. If remaining train delay is" & @CRLF & _
					   "short but Max Stay on Account delay is exceeded, Switch Account will go to next account anyway...")
	GUICtrlSetOnEvent(-1, "cmbMinDelayToSwitch")
	$g_lblEndSwitchAccount = GUICtrlCreateLabel("mins", $x + 188, $y + 2, -1, 17)

EndFunc   ;==>TabItem1

Func TabItem2()

	GUICtrlCreateGroup("Settings", 5, 25, 442, 360)

	Local $x = 0, $y = 20

	$g_chkUseBotHumanization = GUICtrlCreateCheckbox("Enable Bot Humanization", 20, 47, 137, 17)
	GUICtrlSetOnEvent(-1, "chkUseBotHumanization")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_chkUseAltRClick = GUICtrlCreateCheckbox("Make ALL BOT clicks random", 274, 47, 162, 17)
	GUICtrlSetOnEvent(-1, "chkUseAltRClick")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$x += 10
	$y += 60

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnChat, $x, $y + 5, 32, 32)
	$g_Label1 = GUICtrlCreateLabel("Read the Clan Chat", $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[0] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label2 = GUICtrlCreateLabel("Read the Global Chat", $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label4 = GUICtrlCreateLabel("Say...", $x + 40, $y + 30, 31, 17)
	$g_ahumanMessage[0] = GUICtrlCreateInput("Hello !", $x + 75, $y + 25, 121, 21)
	$g_Label3 = GUICtrlCreateLabel("Or", $x + 205, $y + 30, 15, 17)
	$g_ahumanMessage[1] = GUICtrlCreateInput("Re !", $x + 225, $y + 25, 121, 21)
	$g_acmbPriority[2] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label20 = GUICtrlCreateLabel("Launch Challenges with message", $x + 40, $y + 55, 170, 17)
	$g_challengeMessage = GUICtrlCreateInput("Can you beat my village ?", $x + 205, $y + 50, 141, 21)
	$g_acmbPriority[12] = GUICtrlCreateCombo("", $x + 355, $y + 50, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 81

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnRepeat, $x, $y + 5, 32, 32)
	$g_Label5 = GUICtrlCreateLabel("Watch Defenses", $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[3] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_Label6 = GUICtrlCreateLabel("Watch Attacks", $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[4] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbStandardReplay")
	$g_Label7 = GUICtrlCreateLabel("Max Replay Speed", $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[0] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_Label8 = GUICtrlCreateLabel("Pause Replay", $x + 240, $y + 30, 110, 17)
	$g_acmbPause[0] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnClan, $x, $y + 5, 32, 32)
	$g_Label9 = GUICtrlCreateLabel("Look at War log", $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[5] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label10 = GUICtrlCreateLabel("Visit Clanmates", $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[6] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label11 = GUICtrlCreateLabel("Look at Best Players", $x + 240, $y + 5, 110, 17)
	$g_acmbPriority[7] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label12 = GUICtrlCreateLabel("Look at Best Clans", $x + 240, $y + 30, 110, 17)
	$g_acmbPriority[8] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnTarget, $x, $y + 5, 32, 32)
	$g_Label14 = GUICtrlCreateLabel("Look at Current War", $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[9] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label16 = GUICtrlCreateLabel("Watch Replays", $x + 40, $y + 30, 110, 17)
	$g_acmbPriority[10] = GUICtrlCreateCombo("", $x + 155, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	GUICtrlSetOnEvent(-1, "cmbWarReplay")
	$g_Label13 = GUICtrlCreateLabel("Max Replay Speed", $x + 240, $y + 5, 110, 17)
	$g_acmbMaxSpeed[1] = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sReplayChain, "2")
	$g_Label15 = GUICtrlCreateLabel("Pause Replay", $x + 240, $y + 30, 110, 17)
	$g_acmbPause[1] = GUICtrlCreateCombo("", $x + 355, $y + 25, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")

	$y += 56

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnSettings, $x, $y + 5, 32, 32)
	$g_Label17 = GUICtrlCreateLabel("Do nothing", $x + 40, $y + 5, 110, 17)
	$g_acmbPriority[11] = GUICtrlCreateCombo("", $x + 155, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sFrequenceChain, "Never")
	$g_Label18 = GUICtrlCreateLabel("Max Actions by Loop", $x + 240, $y + 5, 103, 17)
	$g_cmbMaxActionsNumber = GUICtrlCreateCombo("", $x + 355, $y, 75, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1|2|3|4|5", "2")

	$y += 25

	$g_chkCollectAchievements = GUICtrlCreateCheckbox("Collect achievements automatically", $x + 40, $y, 182, 17)
	GUICtrlSetOnEvent(-1, "chkCollectAchievements")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	$g_chkLookAtRedNotifications = GUICtrlCreateCheckbox("Look at red/purple flags on buttons", $x + 240, $y, 187, 17)
	GUICtrlSetOnEvent(-1, "chkLookAtRedNotifications")
	GUICtrlSetState(-1, $GUI_UNCHECKED)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	For $i = $g_Label1 To $g_chkLookAtRedNotifications
		GUICtrlSetState($i, $GUI_DISABLE)
	Next

	chkUseBotHumanization()

EndFunc   ;==>TabItem2

Func TabItem3()

	Local $x = 5, $y = 25

	Local $Group1 = GUICtrlCreateGroup("Treasury Collect", $x, $y, 442, 110)

	$x -= 2

	GUICtrlCreatePic(@ScriptDir & "\images\Treasury.jpg", $x + 12, $y + 25, 70, 38.6)
	$g_chkEnableTrCollect = GUICtrlCreateCheckbox("Enable", $x + 93, $y + 35, 52, 17)
	GUICtrlSetOnEvent(-1, "chkEnableTrCollect")
	_GUICtrlSetTip(-1, "Check to enable automatic Treasury collecion")
	$g_chkForceTrCollect = GUICtrlCreateCheckbox("Always collect Treasury", $x + 15, $y + 75, 127, 17)
	GUICtrlSetOnEvent(-1, "chkForceTrCollect")
	_GUICtrlSetTip(-1, "Check to force Treasury collection" & _
			@CRLF & "Treasury will be collected all the time, ignoring any criteria")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnGold, $x + 160, $y + 15, 24, 24)
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnElixir, $x + 160, $y + 45, 24, 24)
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnDark, $x + 160, $y + 75, 24, 24)

	$g_chkGoldTrCollect = GUICtrlCreateCheckbox("Collect when Gold <", $x + 190, $y + 18, 112, 17)
	GUICtrlSetOnEvent(-1, "chkResTrCollect")
	_GUICtrlSetTip(-1, "When your Village Gold is below this value, it will collect Treasury")
	$g_txtMinGoldTrCollect = GUICtrlCreateInput("200000", $x + 305, $y + 17, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	$g_chkFullGoldTrCollect = GUICtrlCreateCheckbox("When full", $x + 370, $y + 18, 67, 17)
	GUICtrlSetOnEvent(-1, "chkFullResTrCollect")
	_GUICtrlSetTip(-1, "When your Gold level in Treasury is full, it will colect it to empty Treasury")

	$g_chkElxTrCollect = GUICtrlCreateCheckbox("Collect when Elixir <", $x + 190, $y + 48, 112, 17)
	GUICtrlSetOnEvent(-1, "chkResTrCollect")
	_GUICtrlSetTip(-1, "When your Village Elixir is below this value, it will collect Treasury")
	$g_txtMinElxTrCollect = GUICtrlCreateInput("200000", $x + 305, $y + 47, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	$g_chkFullElxTrCollect = GUICtrlCreateCheckbox("When full", $x + 370, $y + 48, 67, 17)
	GUICtrlSetOnEvent(-1, "chkFullResTrCollect")
	_GUICtrlSetTip(-1, "When your Elixir level in Treasury is full, it will colect it to empty Treasury")

	$g_chkDarkTrCollect = GUICtrlCreateCheckbox("Collect when Dark <", $x + 190, $y + 78, 112, 17)
	GUICtrlSetOnEvent(-1, "chkResTrCollect")
	_GUICtrlSetTip(-1, "When your Village Dark is below this value, it will collect Treasury")
	$g_txtMinDarkTrCollect = GUICtrlCreateInput("200000", $x + 305, $y + 77, 56, 21, BitOR($ES_CENTER, $ES_NUMBER))
	$g_chkFullDarkTrCollect = GUICtrlCreateCheckbox("When full", $x + 370, $y + 78, 67, 17)
	GUICtrlSetOnEvent(-1, "chkFullResTrCollect")
	_GUICtrlSetTip(-1, "When your Dark level in Treasury is full, it will colect it to empty Treasury")

	chkEnableTrCollect()
	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>TabItem3

Func TabItem4()

	Local $x = 25, $y = 45

	GUICtrlCreateGroup("Auto Upgrade", $x - 20, $y - 20, 442, 400)

	$g_chkAutoUpgrade = GUICtrlCreateCheckbox("Enable Auto Upgrade", $x - 5, $y, -1, -1)
		_GUICtrlSetTip(-1, "Check box to enable automatically starting Upgrades from builders menu")
		GUICtrlSetOnEvent(-1, "chkAutoUpgrade")

	$g_FirstAutoUpgradeLabel = GUICtrlCreateLabel("Save", $x, $y + 32, -1, -1)
	$g_SmartMinGold = GUICtrlCreateInput("", $x + 33, $y + 29, 60, 21, BitOR($ES_CENTER, $ES_NUMBER))
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnGold, $x + 98, $y + 32, 16, 16)
	$g_SmartMinElixir = GUICtrlCreateInput("", $x + 118, $y + 29, 60, 21, BitOR($ES_CENTER, $ES_NUMBER))
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnElixir, $x + 183, $y + 32, 16, 16)
	$g_SmartMinDark = GUICtrlCreateInput("", $x + 203, $y + 29, 60, 21, BitOR($ES_CENTER, $ES_NUMBER))
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnDark, $x + 268, $y + 32, 16, 16)
	GUICtrlCreateLabel("after launching upgrade", $x + 290, $y + 32, -1, -1)

	$g_chkResourcesToIgnore[0] = GUICtrlCreateCheckbox("Ignore Gold Upgrades", $x, $y + 55, -1, -1)
	GUICtrlSetOnEvent(-1, "chkResourcesToIgnore")
	$g_chkResourcesToIgnore[1] = GUICtrlCreateCheckbox("Ignore Elixir Upgrades", $x + 130, $y + 55, -1, -1)
	GUICtrlSetOnEvent(-1, "chkResourcesToIgnore")
	$g_chkResourcesToIgnore[2] = GUICtrlCreateCheckbox("Ignore Dark Elixir Upgrades", $x + 258, $y + 55, -1, -1)
	GUICtrlSetOnEvent(-1, "chkResourcesToIgnore")

	GUICtrlCreateGroup("Upgrades to ignore", $x - 15, $y + 85, 432, 155)

	Local $x = 21, $y = 100

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnTH11, $x + 5, $y + 50, 40, 40)
	$g_chkUpgradesToIgnore[0] = GUICtrlCreateCheckbox("", $x + 20, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnKing, $x + 95, $y + 50, 40, 40)
	$g_chkUpgradesToIgnore[1] = GUICtrlCreateCheckbox("", $x + 110, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnQueen, $x + 140, $y + 50, 40, 40)
	$g_chkUpgradesToIgnore[2] = GUICtrlCreateCheckbox("", $x + 155, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnWarden, $x + 185, $y + 50, 40, 40)
	$g_chkUpgradesToIgnore[3] = GUICtrlCreateCheckbox("", $x + 200, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnCC, $x + 275, $y + 50, 40, 40)
	$g_chkUpgradesToIgnore[4] = GUICtrlCreateCheckbox("", $x + 290, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnLaboratory, $x + 365, $y + 50, 40, 40)
	$g_chkUpgradesToIgnore[5] = GUICtrlCreateCheckbox("", $x + 380, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBarrack, $x + 5, $y + 120, 40, 40)
	$g_chkUpgradesToIgnore[6] = GUICtrlCreateCheckbox("", $x + 20, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnDarkBarrack, $x + 50, $y + 120, 40, 40)
	$g_chkUpgradesToIgnore[7] = GUICtrlCreateCheckbox("", $x + 65, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnSpellFactory, $x + 140, $y + 120, 40, 40)
	$g_chkUpgradesToIgnore[8] = GUICtrlCreateCheckbox("", $x + 155, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnDarkSpellFactory, $x + 185, $y + 120, 40, 40)
	$g_chkUpgradesToIgnore[9] = GUICtrlCreateCheckbox("", $x + 200, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnMine, $x + 275, $y + 120, 40, 40)
	$g_chkUpgradesToIgnore[10] = GUICtrlCreateCheckbox("", $x + 290, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnCollector, $x + 320, $y + 120, 40, 40)
	$g_chkUpgradesToIgnore[11] = GUICtrlCreateCheckbox("", $x + 335, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnDrill, $x + 365, $y + 120, 40, 40)
	$g_chkUpgradesToIgnore[12] = GUICtrlCreateCheckbox("", $x + 380, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkUpgradesToIgnore")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_AutoUpgradeLog = GUICtrlCreateEdit("", 10, 287, 432, 124, BitOR($GUI_SS_DEFAULT_EDIT, $ES_READONLY))
	GUICtrlSetData(-1, "                                             ----- AUTO UPGRADE LOG -----")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>TabItem4

Func TabItem5()

	; New group
	Local $x = 15, $y = 45

	GUICtrlCreateGroup("Builders Base Stats", $x - 10, $y - 20, 442, 50)

		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldGold, $x, $y - 2, 24, 24)
		$g_alblBldBaseStats[$eLootGold] = GUICtrlCreateLabel("---", $x + 35, $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)

		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldElixir, $x + 140, $y - 2, 24, 24)
		$g_alblBldBaseStats[$eLootElixir] = GUICtrlCreateLabel("---", $x + 175, $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)

		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldTrophy, $x + 280, $y - 2, 24, 24)
		$g_alblBldBaseStats[$eLootTrophy] = GUICtrlCreateLabel("---", $x + 315, $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	; New group
	Local $x = 15, $y = 100

	GUICtrlCreateGroup("Some awesome features !", $x - 10, $y - 20, 442, 110)

		$x += 45

		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldGold, $x, $y - 2, 24, 24)
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldElixir, $x + 28, $y - 2, 24, 24)
		$g_chkCollectBldGE = GUICtrlCreateCheckbox("Collect Gold and Elixir", $x + 60, $y - 2, -1, -1)
			GUICtrlSetOnEvent(-1, "chkCollectBldGE")

		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnGem, $x + 14, $y + 28, 24, 24)
		$g_chkCollectBldGems = GUICtrlCreateCheckbox("Collect Gems", $x + 60, $y + 28)
			GUICtrlSetOnEvent(-1, "chkCollectBldGems")

		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldClockBtn, $x + 14, $y + 58, 24, 24)
		$g_chkActivateClockTower = GUICtrlCreateCheckbox("Activate Clock Tower when available (awesome !)", $x + 60, $y + 58)
			GUICtrlSetOnEvent(-1, "chkActivateClockTower")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	; New group
	Local $x = 13, $y = 215

	GUICtrlCreateGroup("Suggested Upgrades ", $x - 10, $y - 20, 442, 233)

		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnMBisland, $x , $y , 64, 64)
		$g_chkBBSuggestedUpgrades = GUICtrlCreateCheckbox("Suggested Upgrades", $x + 70, $y + 25, -1, -1)
			;GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgrades")
		$g_chkBBSuggestedUpgradesIgnoreGold = GUICtrlCreateCheckbox("Ignore Gold values", $x + 200, $y + 15, -1, -1)
			;GUICtrlSetState(-1, BitOR($GUI_UNCHECKED, $GUI_DISABLE))
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesGold")
		$g_chkBBSuggestedUpgradesIgnoreElixir = GUICtrlCreateCheckbox("Ignore Elixir values", $x + 200, $y + 40, -1, -1)
			;GUICtrlSetState(-1, BitOR($GUI_UNCHECKED, $GUI_DISABLE))
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesElixir")
		$g_chkBBSuggestedUpgradesIgnoreHall = GUICtrlCreateCheckbox("Ignore Builder Hall", $x + 320, $y + 28, -1, -1)
			;GUICtrlSetState(-1, BitOR($GUI_UNCHECKED, $GUI_DISABLE))
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesGold")

	Local $x = 13, $y = 220
		$g_chkPlacingNewBuildings = GUICtrlCreateCheckbox("Build 'New' tagged buildings", $x + 70, $y + 60, -1, -1)
			GUICtrlSetOnEvent(-1, "chkPlacingNewBuildings")

	GUICtrlCreateGroup("", -99, -99, 1, 1)


EndFunc   ;==>TabItem5

Func TabItem6()

     Local $x = 25, $y = 50, $xStart = 25, $yStart = 50

	$grpSuperXP = GUICtrlCreateGroup("Goblin XP", $x - 20, $y - 20, 440, 340)
		$chkEnableSuperXP = GUICtrlCreateCheckbox("Enable Goblin XP", $x, $y - 1, 102, 17, -1, -1)
		GUICtrlSetOnEvent(-1, "chkEnableSuperXP")
			$rbSXTraining = GUICtrlCreateRadio("Farm XP during troops Training", $x, $y + 25, 175, 17)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
			$lblLOCKEDSX = GUICtrlCreateLabel( "LOCKED", $x + 210, $y + 35, 173, 50)
			GUICtrlSetFont(-1, 30, 800, 0, "Arial")
			GUICtrlSetColor(-1, 0xFF0000)
			GUICtrlSetState(-1, $GUI_HIDE)
			$rbSXIAttacking = GUICtrlCreateRadio( "Farm XP instead of Attacking", $x, $y + 45, 158, 17)
			GUICtrlCreateLabel ("Max XP to Gain" & ":", $x, $y + 78, -1, 17)
			GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
			$txtMaxXPtoGain = GUICtrlCreateInput("500", $x + 85, $y + 75, 70, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetLimit(-1, 8)
			GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
	$x += 129
	$y += 120
		GUICtrlCreateLabel("Use", $x - 35, $y + 13, 23, 17)
			_GUICtrlCreateIcon($g_sLibIconPath, $eIcnKing, $x, $y, 32, 32)
			_GUICtrlCreateIcon($g_sLibIconPath, $eIcnQueen, $x + 40, $y, 32, 32)
			_GUICtrlCreateIcon($g_sLibIconPath, $eIcnWarden, $x + 80, $y, 32, 32)
		GUICtrlCreateLabel("to gain XP", $x + 123, $y + 13, 53, 17)
	$x += 10
		$chkSXBK = GUICtrlCreateCheckbox("", $x, $y + 35, 13, 13)
		GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
		$chkSXAQ = GUICtrlCreateCheckbox("", $x + 40, $y + 35, 13, 13)
		GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")
		$chkSXGW = GUICtrlCreateCheckbox("", $x + 80, $y + 35, 13, 13)
		GUICtrlSetOnEvent(-1, "chkEnableSuperXP2")

	$x = $xStart + 25
	$y += 85
		GUICtrlCreateLabel("", $x - 25, $y, 5, 19)
		GUICtrlSetBkColor (-1, 0xD8D8D8)
		$DocXP1 = GUICtrlCreateLabel("XP at Start", $x - 20, $y, 98, 19)
		GUICtrlSetBkColor (-1, 0xD8D8D8)
		$DocXP2 = GUICtrlCreateLabel("Current XP", $x + 63 + 15, $y, 104, 19)
		GUICtrlSetBkColor (-1, 0xD8D8D8)
		$DocXP3 = GUICtrlCreateLabel("XP Won", $x + 71 + 76 + 35, $y, 103, 19)
		GUICtrlSetBkColor (-1, 0xD8D8D8)
		$DocXP4 = GUICtrlCreateLabel("XP Won/Hour", $x + 69 + 55 + 110 + 45, $y, 87, 19)
		GUICtrlSetBkColor (-1, 0xD8D8D8)
		;GUICtrlCreateGroup("", $x - 28, $y - 7, 395, 29)
	$y += 15
			GUICtrlCreateLabel("", $x - 25, $y + 7, 5, 36)
			GUICtrlSetBkColor (-1, 0xbfdfff)
		$lblXPatStart = GUICtrlCreateLabel("0", $x - 20, $y + 7, 99, 36)
			GUICtrlSetFont(-1, 20, 800, 0, "Arial")
			GUICtrlSetBkColor (-1, 0xbfdfff)
		$lblXPCurrent = GUICtrlCreateLabel("0", $x + 78, $y + 7, 105, 36)
			GUICtrlSetFont(-1, 20, 800, 0, "Arial")
			GUICtrlSetBkColor (-1, 0xbfdfff)
		$lblXPSXWon = GUICtrlCreateLabel("0", $x + 182, $y + 7, 97, 36)
			GUICtrlSetFont(-1, 20, 800, 0, "Arial")
			GUICtrlSetBkColor (-1, 0xbfdfff)
		$lblXPSXWonHour = GUICtrlCreateLabel("0", $x + 279, $y + 7, 87, 36)
			GUICtrlSetFont(-1, 20, 800, 0, "Arial")
			GUICtrlSetBkColor (-1, 0xbfdfff)

	$x = $xStart
	$y += 60
		GUICtrlCreateLabel( "Goblin XP attack continuously the TH of Goblin Picnic to farm XP.", $x, $y, 312, 17)
		GUICtrlCreateLabel( "At each attack, you win 5 XP", $x, $y + 20, 306, 17)

	chkEnableSuperXP()

	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc   ;==>TabItem6

Func TabItem7()

    Global $g_alblSwitchto
	
    Local $sTxtTip = ""
	Local $xStart = 0, $yStart = 0
	Local $x = $xStart + 10, $y = $yStart + 25
	$ieForecast = GUICtrlCreateObj($oIE, $x , $y , 430, 310)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += 100 + 220
		$chkForecastBoost = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastBoost", "Boost When >"), $x, $y, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastBoost_Info_01", "Boost Barracks,Heroes, when the loot index."))
			GUICtrlSetOnEvent(-1, "chkForecastBoost")
		$txtForecastBoost = GUICtrlCreateInput("6.0", $x + 100, $y, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastBoost_Info_02", "Minimum loot index for boosting."))
			GUICtrlSetLimit(-1, 3)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetState(-1, $GUI_DISABLE)

		$chkForecastPause = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastPause", "Halt when below"), $x, $y + 30, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastPause_Info_01", "Halt attacks when the loot index is below the specified value."))
			GUICtrlSetOnEvent(-1, "chkForecastPause")
		$txtForecastPause = GUICtrlCreateInput("2.0", $x + 100, $y + 30, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastPause_Info_02", "Minimum loot index for halting attacks."))
			GUICtrlSetLimit(-1, 3)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetState(-1, $GUI_DISABLE)

		$cmbSwLang = GUICtrlCreateCombo("", $x, $y + 60, 45, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "EN" & "|" & "RU" & "|" & "FR" & "|" & "DE" & "|" & "ES" & "|" & "FA" & "|" & "PT" & "|" & "IN", "EN")
			GUICtrlSetOnEvent(-1, "cmbSwLang")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x += 150
		$chkForecastHopingSwitchMax = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastHopingSwitch", "Switch to"), $x, $y, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastHopingSwitch_Info_01", "Switch to Profile when the loot index") & " <"
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMax")
		$cmbForecastHopingSwitchMax = GUICtrlCreateCombo("", $x + 68, $y - 2, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastHopingSwitch_Info_02", "When Index") & " <", $x + 175, $y + 3, -1, -1)
		$txtForecastHopingSwitchMax = GUICtrlCreateInput("2.5", $x + 250, $y, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			_GUICtrlEdit_SetReadOnly(-1, True)

		$chkForecastHopingSwitchMin = GUICtrlCreateCheckbox(GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastHopingSwitch", -1), $x, $y + 30, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastHopingSwitch_Info_01", -1) & " >"
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMin")
		$cmbForecastHopingSwitchMin = GUICtrlCreateCombo("", $x + 68, $y + 28, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateLabel(GetTranslatedFileIni("MOD GUI Design - Forecast", "ForecastHopingSwitch_Info_02", -1) & " >", $x + 175, $y + 33, -1, -1)
		$txtForecastHopingSwitchMin = GUICtrlCreateInput("2.5", $x + 250, $y + 30, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			_GUICtrlEdit_SetReadOnly(-1, True)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	setupProfileComboBox()
EndFunc   ;==>TabItem7
#include <Process.au3>
#include <Array.au3>
#include <WinAPIEx.au3>
Func TabItem8()

    ChatbotReadSettings()	
	Local $x = 10, $y = 130

   GUICtrlCreateGroup("Global Chat", 16 - $x, 160 - $y , 438, 208)
    
   $chkGlobalChat = GUICtrlCreateCheckbox("Advertise in global", 32 - $x, 184 - $y, 105, 17)
	_GUICtrlSetTip($chkGlobalChat, "Use global chat to send messages")
   GUICtrlSetState($chkGlobalChat, $ChatbotChatGlobal)
   GUICtrlSetOnEvent(-1, "chkGlobalChat")
	
   
   $chkGlobalScramble = GUICtrlCreateCheckbox("Scramble global chats", 32 - $x, 205 - $y, 125, 17)
	_GUICtrlSetTip($chkGlobalScramble, "Scramble the message pieces defined in the textboxes below to be in a random order")
   GUICtrlSetState($chkGlobalScramble, $ChatbotScrambleGlobal)
   GUICtrlSetOnEvent(-1, "chkGlobalScramble")
   
   
   $g_alblTimeDalay = GUICtrlCreateLabel("Time Dalay", 46 - $x, 232 - $y, 55, 17)
   $TxtGlobChatTimeDalay = GUICtrlCreateInput("0", 120 - $x, 230 - $y, 30, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
   _GUICtrlSetTip($TxtGlobChatTimeDalay, "Global Chat time dalay in seconds.")
   GUICtrlSetLimit(-1, 3)
  ;GUICtrlSetOnEvent(-1, "txtGlobChatTimeDalay")
   GUICtrlSetState($TxtGlobChatTimeDalay, $iTxtGlobChatTimeDalay)
   
   $chkSwitchLang = GUICtrlCreateCheckbox("Switch languages", 176 - $x, 184 - $y, 81, 17)
	_GUICtrlSetTip($chkSwitchLang, "Switch languages after spamming for a new global chatroom")
   GUICtrlSetState($chkSwitchLang, $ChatbotSwitchLang)
   GUICtrlSetOnEvent(-1, "chkSwitchLang")   
	;======kychera===========
   $cmbLang = GUICtrlCreateCombo("", 280 - $x, 184 - $y, 50, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
   GUICtrlSetData(-1, "FR|DE|ES|IT|NL|NO|PR|TR|RU", "RU")
   ;==========================
   
   $editGlobalMessages1 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages1, @CRLF), 24 - $x, 261 - $y, 420, 49)
   GUICtrlSetTip($editGlobalMessages1, "Take one item randomly from this list (one per line) and add it to create a message to send to global")
   GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
   
   $editGlobalMessages2 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages2, @CRLF), 24 - $x, 312 - $y, 420, 49)
   GUICtrlSetTip($editGlobalMessages2, "Take one item randomly from this list (one per line) and add it to create a message to send to global")
   GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
   
   ;$editGlobalMessages3 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages3, @CRLF), $x - 15, $y, 202, 65)
  ; GUICtrlSetTip($editGlobalMessages3, "Take one item randomly from this list (one per line) and add it to create a message to send to global")
   ;GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
   ;$y += 65
   ;$editGlobalMessages4 = GUICtrlCreateEdit(_ArrayToString($GlobalMessages4, @CRLF), $x - 15, $y, 202, 55)
   ;GUICtrlSetTip($editGlobalMessages4, "Take one item randomly from this list (one per line) and add it to create a message to send to global")
   ;GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
   ;$y += 65
   GUICtrlCreateGroup("", -99, -99, 1, 1)

	;Local $x = 245, $y = 47

   GUICtrlCreateGroup("Clan Chat", 16 - $x, 370 - $y, 438, 190)
   
   $chkClanChat = GUICtrlCreateCheckbox("Chat in clan chat", 32 - $x, 390 - $y, 97, 17)
	_GUICtrlSetTip($chkClanChat, "Use clan chat to send messages")
   GUICtrlSetState($chkClanChat, $ChatbotChatClan)
   GUICtrlSetOnEvent(-1, "chkClanChat")   
   
   $chkUseResponses = GUICtrlCreateCheckbox("Use custom responses", 32 - $x, 410 - $y, 125, 17)
   GUICtrlSetTip($chkUseResponses, "Use the keywords and responses defined below")
   GUICtrlSetState($chkUseResponses, $ChatbotClanUseResponses)
   GUICtrlSetOnEvent(-1, "chkUseResponses")   
   
   $chkUseGeneric = GUICtrlCreateCheckbox("Use generic chats", 32 - $x, 430 - $y, 97, 17)
   GUICtrlSetTip($chkUseGeneric, "Use generic chats if reading the latest chat failed or there are no new chats")
   GUICtrlSetState($chkUseGeneric, $ChatbotClanAlwaysMsg)
   GUICtrlSetOnEvent(-1, "chkUseGeneric")   
   
   $chkChatNotify = GUICtrlCreateCheckbox("Use remote for chatting", 32 - $x, 480 - $y, 125, 17)
   GUICtrlSetTip($chkChatNotify, "Send and recieve chats via pushbullet or telegram." & @CRLF & "Use BOT <myvillage> GETCHATS <interval|NOW|STOP> to get the latest clan" & @CRLF &  "chat as an image, and BOT <myvillage> SENDCHAT <chat message> to send a chat to your clan") 
   GUICtrlSetState($chkChatNotify, $ChatbotUseNotify)
   GUICtrlSetOnEvent(-1, "chkChatNotify")  
   
   $chkPbSendNewChats = GUICtrlCreateCheckbox("Notify me new chat clan", 32 - $x, 500 - $y, 125, 17)
   GUICtrlSetTip($chkPbSendNewChats, "Will send an image of your clan chat via pushbullet & telegram when a new chat is detected. Not guaranteed to be 100% accurate.")
   GUICtrlSetState($chkPbSendNewChats, $ChatbotPbSendNew)
   GUICtrlSetOnEvent(-1, "chkPbSendNewChats")   
   

   $editResponses = GUICtrlCreateEdit(_ArrayToString($ClanResponses, ":", -1, -1, @CRLF), 200 - $x, 380 - $y, 217, 81)
   GUICtrlSetTip($editResponses, "Look for the specified keywords in clan messages and respond with the responses. One item per line, in the format keyword:response")
   GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
   
   $editGeneric = GUICtrlCreateEdit(_ArrayToString($ClanMessages, @CRLF), 200 - $x, 470 - $y, 217, 81)
   GUICtrlSetTip($editGeneric, "Generic messages to send, one per line")
   GUICtrlSetOnEvent(-1, "ChatGuiEditUpdate")
      
   GUICtrlCreateGroup("", -99, -99, 1, 1)
   
EndFunc   ;==>TabItem8
