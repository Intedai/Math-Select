#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


/*
funciton that removes zeroes because some the AHK sqrt function adds unnecessary zeroes after the decimal point
if the decimal point is unnecessary it will also be removed
*/
RemoveZeroes(Num)
{
  ; gets the rightest character and if it's zero it removes it, if it's not zero the loop stops
  Loop, % StrLen(Num)
  {
    ; check if the righest character is 0 and if it is remove it and if not stop the loop
    StringRight, CurrDigit, Num, 1

    if (CurrDigit = "0")
      StringTrimRight, Num, Num, 1
    else
      break
  }

  ; check if the righest character is a decimal point and if it is remove it
  if (CurrDigit = ".")
    StringTrimRight, Num, Num, 1

  return Num
}


/*
The shortcuts below do the following steps:
1. save the text that was already in the Clipboard to the var oldClipboard
2. copy the selected number
3. wait a bit for it to work
4. create a variable that executes a math function (in the sqrt shortcut it also uses the RemoveZeroes() func to remove unnecessary zeroes)
5. types the variable (because the number is selcted it will remove it while writing the variable)
6. changes the clipboard back to it's old saved text (the oldClipboard var)
*/


;[alt+u] -> Convert the selected number to it's sqaure root
!u:: 
  oldClipboard := ClipboardAll
  Send, ^c
  Sleep, 150
  squareRoot := RemoveZeroes(Sqrt(Clipboard))
  Send, %squareRoot%
  Clipboard := oldClipboard
return

;[alt+j] -> Convert the selected number to it's sqaure number
!j:: 
  oldClipboard := ClipboardAll
  Send, ^c
  Sleep, 150
  squared := Clipboard*Clipboard
  Send, %squared%
  Clipboard := oldClipboard
return


;[alt+m] -> Rounds the selected number
!m:: 
  oldClipboard := ClipboardAll
  Send, ^c
  Sleep, 150
  rounded := Round(Clipboard)
  Send, %rounded%
  Clipboard := oldClipboard
return