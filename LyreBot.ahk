#SingleInstance, Force
#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

/*
if not A_IsAdmin
{
	Run, *RunAs %A_ScriptFullPath%
	ExitApp
}
*/

SettingsScriptPath = %A_ScriptDir%\resources\scripts\LyreBot_Settings.ahk

Run, %SettingsScriptPath%
ExitApp