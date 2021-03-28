#include, %A_ScriptDir%\..\..\lib\keyboards.ahk

convert(keyboardConfig, keyCode) 
{
	global keyboards
	
	row := SubStr(keycode, 1, 1) + 0
	col := SubStr(keycode, 2, 1) + 0

	index := (row) * 7 + col
	
	return keyboards[keyboardConfig][index]
}