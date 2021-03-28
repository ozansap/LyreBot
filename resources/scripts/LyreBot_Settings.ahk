#SingleInstance, Force
#NoEnv
#Warn
SendMode Input

#include, %A_ScriptDir%\..\..\lib\songs.ahk
#include, %A_ScriptDir%\..\..\lib\keyboards.ahk

keyboardsList := ""
songsList := ""

For key, value in keyboards
{
	if (key != "QWERTY")
	{
		keyboardsList .= key . "|"
	}
}
keyboardsList .= "QWERTY||"

For key, value in songs
{
	songsList .= value.name . "|"
}
songsList := RTrim(songsList, "|")

Gui, Font, S12 CDefault Bold, Verdana
Gui, Add, Text, x12 y9 w450 h20, % "You are using LyreBot version 1.0"

Gui, Font, S10 CDefault Norm, Verdana

Gui, Add, Text, x12 y59 w450 h20, % "Choose your keyboard layout:"
Gui, Add, DropDownList, x12 y79 w100 vKeyboardSetting, % keyboardsList

Gui, Add, Text, x12 y139 w450 h20, % "Choose a song to play:"
Gui, Add, DropDownList, x12 y159 w450 vSongSetting, % songsList

Gui, Add, Button, x362 y219 w100 h30 gPlay, Play

Gui, Show,, LyreBot
Return

Play:
{
	Gui, Submit

	if (SongSetting == "") 
	{
		MsgBox,, % "Error", % "You need to choose which song to play"
		Reload
	}

	For key, value in songs
	{
		if (value.name == SongSetting)
		{
			SongSetting := key
			Break
		}
	}

	Run "%A_AhkPath%" "%A_ScriptDir%\LyreBot_Main.ahk" %KeyboardSetting% %SongSetting%
	ExitApp
}

GuiClose:
ExitApp

