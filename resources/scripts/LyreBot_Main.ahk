#SingleInstance, Force
#NoEnv
#Warn
SendMode Input

#include, %A_ScriptDir%\..\..\lib\songs.ahk
#include, %A_ScriptDir%\..\..\lib\convert.ahk

keyboard := A_Args[1]
song := songs[A_Args[2]]
playing := True

Loop, 3
{
	ToolTip, % 3 - A_Index
	Sleep, 1000
}

ToolTip

Loop, % song.notes.Length()
{
	note := song.notes[A_Index]

	if (InStr(note, "-") > 0) {
		noteArray := note.StrSplit(note, "-")

		Loop, % noteArray.Length()
		{
			note := noteArray[A_Index]
			key := convert(keyboard, note)
			Send {Raw} %key%
		}
	} else if (note != "00") {
		key := convert(keyboard, note)
		Send {Raw} %key%
	}

	Sleep, % 60000 / song.bpm
}

playing = False

NumpadAdd::
if (playing == False)
{
	Run, LyreBot_Settings.ahk
	ExitApp
}

NumpadSub::
ExitApp

