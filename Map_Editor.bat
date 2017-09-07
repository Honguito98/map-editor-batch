@Echo Off
:    Map Editor - A development tool for create maps used by Seta:Gpu
:    Copyright (C) 2013,2014  Honguito98
:
:    This program is free software: you can redistribute it and/or modify
:    it under the terms of the GNU General Public License as published by
:    the Free Software Foundation, either version 3 of the License, or
:    (at your option) any later version.
:
:    This program is distributed in the hope that it will be useful,
:    but WITHOUT ANY WARRANTY; without even the implied warranty of
:    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:    GNU General Public License for more details.
:
:    You should have received a copy of the GNU General Public License
:    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	Setlocal EnableExtensions DisableDelayedExpansion
	Call :Flush
	Set "Im=%~0"
	Set "Arg2=%~1"
	Cd "%~dps0"
	If Exist "Lib\Mouse.tmp_" (
		Echo;Process Detected!
		Exit /B 2
	)
	Lib\Dclose.dll
	Set LF=^


	:: Do not remove the above two lines!
	Set Macros=Mov;Mouse;Dlg;
	For %%# in (%Macros%) Do (
		Call :AutoMacro %%#
	)
	Setlocal EnabledelayedExpansion
	For %%# in (%Macros%) Do (
		Set ^"%%#=!%%#:[LF]=^%LF%%LF%!"
	)
	Set "ResetM=Set /a Btn=0, X=-1, Y=-1"
	Set Macros=
	Mode 88,28

	:NEW
	::SetLocal
	Set SpeedS=1
	Set "Ui=%~dps0Lib\Fn.dll"
	Set "Nc=%~dps0Lib\Nc.dll"
	Set PasteFile="!Tmp!\Paste.txt"
	%Ui% Color 07
	Set T=\B1
	Set C=2A
	Set Status=
	Set Del=No
	Set PenL=3
	Set TextS=Off
	Set FontS=6
	Set Form=single
	Set "PBCs=0,80 1,27"
	Set "BATS=0,66 1,17"
	Set "PICs=0,68 1,20"
	Set "String=i$dgtor0CV1ss2emp8nwt3lyDvBgHu9, ^^^!&"
	Set "~="
	For %%? In (
	13,7,10,21,31,32,24,14,25,14,22,5,16,14,
	2,32,26,23,32,28,5,18,27,29,0,20,5,30,
	17) Do Set "~=!~!!String:~%%?,1!"
	Set String=
	:: Default palette
	Set /a Cnt=0,CpSel=1
	For %%C in (
		"9B \B1 " "CE \B2 "
		"CD \B0 " "2A \B2 "
		"00 \DB " "00 \DB "
		"00 \DB " "00 \DB "
		"00 \DB " "00 \DB "
	) Do (
		Set /a Cnt+=1
		Set "Cp[!Cnt!]=%%~C"
	)
	If Not Exist Maps Md Maps >Nul 2>&1
If Not Defined Cltb (
	For %%T in (
		"ÚÄ¿"
		"³ ³"
		"ÃÄ´"
		"³ ³"
		"ÃÄ´"
		"³ ³"
		"ÃÄ´"
		"³ ³"
		"ÃÄ´"
		"³ ³"
		"ÃÄ´"
		"³ ³"
		"ÃÄ´"
		"³ ³"
	    "ÃÄ´"
	    "³ ³"
	    "ÃÄ´"
	    "³ ³"
	    "ÃÄ´"
	    "³ ³"
	    "ÀÄÙ"
	) Do Set "Cltb=!Cltb!%%~T\n"
	For %%S in (
		"Â=\C2" "Ä=\C4" "Ã=\C3"
		"´=\B4" "À=\C0" "Ù=\D9"
		"³=\B3" " =\20" "Á=\C1"
		"Ú=\DA" "¿=\BF"
	) Do Set "Cltb=!Cltb:%%~S!"
)
If Not Defined DlgC (
	For %%D in (
		"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
		"³þ                                  þ³"
		"³                                    ³"
		"³                                    ³"
		"³                                    ³"
		"³                                    ³"
		"³                                    ³"
		"³                                    ³"
		"³                                    ³"
		"³                                    ³"
		"³                                    ³"
		"³þ                                  þ³"
		"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
	) Do Set "DlgC=!DlgC!%%D\n"
	For %%S in (
		"þ=\FE" "Ä=\C4" "Ú=\DA"
		"¿=\BF" "À=\C0" "Ù=\D9"
		"³=\B3" " =\20"
	) Do Set "DlgC=!DlgC:%%~S!"
)
	For /F "Tokens=1 Delims=: " %%a in ('"Prompt :$H:&Echo on&For %%b in (1) Do Rem"') Do Set Bs=%%a
	For %%a in (
	"70 \20Open\20 8f "
	"\20\20 "
	"70 \20Save\20 8f "
	"\20\20 "
	"70 \20New\20 8f "
	"\20\20\B3\20Forms:\20 "
	"70 \20__\20 8f "
	"\20\20 "
	"70 \20\DB\DB\20 8f "
	"\20\20\B3\20Misc:\20 "
	"70 \20#\20 8f "
	"\20 "
	"70 \20T\20 8f "
	"\20 "
	"70 \20\08\20 8f "
	"\20 "
	"70 \20\0b\20 8f "
	"\20 "
	"70 \20\9f\20 8f "
	"\20 "
	"70 \20\3f\20 8f "
	"\20\20\20\20\20\20\20\20\20\20 "
	"CF \20\9E\20 80 \20\20\n"
	) Do Set Log1=!Log1!%%~a
	Set Log1=!log1! 04 "ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß"
	Set Log1=!Log1:ß=\DF!
	For %%a in (
	"4C \20\20\20\20Sprites\20\20\20\20\n 8F "
	"\20\01\02\03\04\05\06\07\08\09\0b\0c\0d\0e\20\n"
	"\20\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\20\n"
	"\20\1c\1d\1e\1f\7f\9b\9d\9f\a8\a9\aa\ab\ac\20\n"
	"\20\ad\ae\af\b0\b1\b2\b3\b4\b8\b9\ba\bb\bc\20\n"
	"\20\bd\be\bf\c0\c1\c2\c3\c4\c5\c8\c9\ca\cb\20\n"
	"\20\cc\cd\ce\cf\d0\d8\d9\da\db\dc\df\e6\e7\20\n"
	"\20\e8\ee\ef\f0\f1\f2\f3\2e\f5\f6\f7\f8\f9\20\n"
	"\20\fa\fb\fc\fd\fe\21\23\24\25\2a\2d\5f\7e\20\n"

	) Do Set Log2=!Log2!%%~a

	For %%b in (
	"3B \20\20\20\20Colours\20\20\20\20\n 8F "
	"\20\FF\FFBackground\FF\20\n"
	"\20\FF\FF 00 \Db 01 \DB 02 \DB 03 \Db 04 \DB 05 \DB 06 \Db 07 \Db 8F \FF\FF\FF\20\n"
	"\20\FF\FF 08 \Db 09 \DB 0a \DB 0b \Db 0c \DB 0d \DB 0e \Db 0f \Db 8F \FF\FF\FF\20\n"
	"\20\FF\FFForeground\FF\20\n"
	"\20\FF\FF 00 \Db 01 \DB 02 \DB 03 \Db 04 \DB 05 \DB 06 \Db 07 \Db 8F \FF\FF\FF\20\n"
	"\20\FF\FF 08 \Db 09 \DB 0a \DB 0b \Db 0c \DB 0d \DB 0e \Db 0f \Db 8F \FF\FF\FF\20\n"
	"\20\FF\FFPencil:\FF\FF\FF\FF\20\n"

	) Do Set Log3=!Log3!%%~b
	Set HeadCopy=Map Editor - Developed By !~:~16! - Only Use To Paste
	Title Map Editor !~:~16!
	Set "Log3=!log3:$="!"
	Set "LogZ="
	Set "Sp="
	For /l %%x in (1,1,67) Do (
		Set Logz=!Logz!\C4
		Set "Sp=!Sp! "
	)
	Set "Log4="
	Set Log4=07 \DA!log4!!Logz!\BF\n
	For /l %%y in (1,1,23) Do Set Log4=!Log4!\B3"!SP!"\B3\n
	Set Log4=!Log4!\C0!Logz!\D9
	Set Log5=7f "                                                                                        "
	For %%c in (
	"2A \20\20\20\20\20Move\20\20\20\20\20\20\n 8F "
	"\20\FF\FF\FF\FF 70 \20\18\20 8F \FF\FF\FF\FF\FF\FF\20\n"
	"\20\FF\FF"
	" 70 \20\1B\20 8F \FF 70 \20\1A\20"
	" 8F \FFSpd\20\n"
	"\20\FF\FF\FF\FF 70 \20\19\20 8F \FF\FF\FF 70 \2D 8F \20 70 \2B 8F \20\n"
	"\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\n"
	) Do Set Log6=!Log6!%%~c
	%ui% Cursor 0
	:Tabs
	%ui% Print 0 0 %Log1%
	%ui% Print 2 0 %Log2%
	%ui% Print 12 0 %Log3%

	%ui% Print 2 16 %Log4%
	%Ui% Print 2 85 08 %Cltb% 70 Opn\n 44 \20\20\20 70 \nSav\n 84 \1B\DB\1A

	%ui% Print 27 0 %Log5%
	%ui% Print 21 0 %Log6%
	For %%l in (1,2,3,4,6) Do Set Log%%l=
	Set Logz=
	Set/a Map.X=67,Map.Y=23
	Set Tmp_=
	If Exist "!Arg2!" (
		Set "ObjFile=!Arg2!"
		Set "Arg2="
		Goto :OpenFromArg
	)
	:Setz
	%Dlg% 25 8 0e
	Set Tmp1=
	For %%a in (
	"\00        .::{New Map}::.\n"
	"Name Of Map: [                  ]\n\n"
	"         - Size Of Map -\n"
	"Lenght: [    ]    Height: [    ] \n"
	"(Cols)            (Rows)\n\n"
	"Max: 1168         Max: 500\n"
	"Min: 67           Min: 23\n\n"
	) Do Set "Tmp1=!Tmp1!%%~a"
	%Ui% Print 9 27 0a "!Tmp1!"
	%Ui% Print 19 31 70 " Create " 07 "      " 70 "  Open  "
	%Ui% Print 13 36 0b "!Map.X!"
	%Ui% Print 13 54 0b "!Map.Y!"
	%Ui% Print 10 41 0b "!Tmp_!"
	%ResetM%
	:Setz_
	For /L %%# in (1,1,255) Do (
		%Mouse%
		Title !X! !Y! !Btn!
		If !Btn! Equ 1 (
			If !Y! Equ 13 (
				If !X! Geq 36 If !X! Leq 39 Goto :GetVal.X
				If !X! Geq 54 If !X! Leq 57 Goto :GetVal.Y
			)
			If !Y! Equ 19 (
			If !X! Geq 31 If !X! Leq 38 (
				If Not Defined Tmp_ (
					%Ui% Print 15 29 0c "Filename not specified^!"
					%Ui% Sleep 800
					Goto :Setz
				)
				Goto :Create_Map
			)
			If !X! Geq 45 If !X! Leq 52 (Set Return=Setz& Goto :Open)
			)
			If !Y! Equ 10 If !X! Geq 41 If !X! Leq 58 Goto :GetVal.File
		)
	)
	Goto :Setz_
:GetVal.X
	Set Map.X=
	%Ui% Cursor 50
	%Ui% Print 13 36 00 "    "
	%Ui% Locate 13 36
	Set/p Map.X=
	If !Map.X! Lss 67 Goto :Err.GVX
	If Not Defined Map.X Goto :Err.GVX
	If !Map.X! Gtr 1168 (
		:Err.GVX
		%Ui% Print 15 29 0c "Lenght must be 67 to 1168^!"
		Goto :GetVal.X
	)
	%Ui% Cursor 0
	Goto :Setz
:GetVal.Y
	Set Map.Y=
	%Ui% Cursor 50
	%Ui% Print 13 54 00 "    "
	%Ui% Locate 13 54
	Set/p Map.Y=
	If !Map.Y! Lss 23 Goto :Err.GVY
	If Not Defined Map.X Goto :Err.GVY
	If !Map.Y! Gtr 500 (
		:Err.GVY
		%Ui% Print 15 29 0c "Lenght must be 23 to 500^!"
		Goto :GetVal.Y
	)
	%Ui% Cursor 0
	Goto :Setz
:GetVal.File
	Set Tmp_=
	%Ui% Cursor 50
	%Ui% Print 10 41 00 "                  "
	%Ui% Locate 10 41
	Set/p Tmp_=
	If Not Defined Tmp_ Goto :GetVal.File
	For %%a in (^< ^> ^| ^^ \ / "") Do (
		Set Tmp_|Find "%%a" >Nul && (
			%Ui% Print 15 29 0c "The filename cannot include"
			%Ui% Sleep 800
			%Ui% Print 15 29 0c "characters like '<>|^\\/\22'  "
			Goto :GetVal.File
		)
	)
	If Exist "Maps\!Tmp_!.mpe" (
		%Ui% Print 15 29 0c "The file already exist^!"
		Goto :GetVal.File
	)
	Goto :Setz
:Create_Map
	Set "[File]=!Cd!\Maps\!Tmp_!.mpe"
	%Dlg% 25 8 0a
	%ui% Print 9 27 0b "Please wait..."
	Set/a Hmin=0,Hmax=469,Vmin=1,Vmax=23
	Set/a "MaX.X=(!Map.X!*7)-!Hmax!,CutSpace=!Map.x!*7"
	For /l %%x in (1,1,!Map.x!) Do Set "Blank=!Blank!00 \FF "
	For /l %%y in (1,1,!Map.y!) Do Set "Line[%%y]=!Blank!"
	Set Blank=
	%Mov% Render
	Call :Pen
	Call :CPalette Ref
	For %%A in (![File]!) Do Set "[Name]=%%~nxA"
	Title Map Editor !~:~16! - ![Name]!

	:: Hc = History count
	:: Ht = History total count
	Set HistAct=Off
	Set "Hist=!Tmp!\Mp_![Name]!"
	Md "%Hist%" >Nul 2>&1
	Set /a "Hc=0, Ht=0"
	Set Line[>"%Hist%\H[!Hc!]"

	Set "Blink=" & %ResetM%
:Main
For /L %%! in (1,1,50) Do (
	%Mouse%
	Rem For /F "Tokens=1-3" %%x in ('%ui% mouse') Do (
		rem Set/a Y=%%x,X=%%y,Z=%%z
		Set /a "Xc=(X - 17) * 7 + Hmin, Yc=(Y - 3) + Vmin"
		Set /a "Xc_=Xc + 7, Xc__=Xc + PenL"
	Rem )
	rem Title !X!,!Y! !Xc!,!Yc! !xc_!   vert:[!Vmin!-!Vmax!]  hori [!Hmin!-!Hmax!] !max.x! %%!
	Title !X!,!Y! !Btn! __ !Hc!/!Ht!

	If !Kbd! Equ 332 %Mov% H +
	If !Kbd! Equ 330 %Mov% H -
	If !Kbd! Equ 327 %Mov% V -
	If !Kbd! Equ 335 %Mov% V +
	If !Kbd! Equ 26 (
		If !Hc! Gtr 0 (
			Set /a Hc-=1
			For /F "Useback Delims=" %%D in ("%Hist%\H[!Hc!]") Do Set "%%D"
			%Mov% Render
			%ResetM%
		)
	)
	If !Kbd! Equ 25 (
		If !Hc! Lss !Ht! (
			Set /a Hc+=1
			For /F "Useback Delims=" %%D in ("%Hist%\H[!Hc!]") Do Set "%%D"
			%Mov% Render
			%ResetM%
		)
	)
	rem If Not !X! Geq 17 If Not !X! Leq 83 If Not !Y! Geq 3 If Not !Y! Leq 25 (
		
	rem )
	If !X! Geq 17 If !X! Leq 83 If !Y! Geq 3 If !Y! Leq 25 (
		If Defined Blink (
			%Ui% Cursor 0
			Set "Blink="
		)
		If !Btn! Equ 2 Goto :Menu
		If !Btn! Equ 1 (
			Set HistAct=On
			If !PenL! Equ 3 (
				For /F "Tokens=1-3" %%A in ("!Xc! !Xc_! !Yc!") Do (
					Set "Line[!Yc!]=!Line[%%C]:~0,%%A!!C! !T! !Line[%%C]:~%%B!"
				)
				%ui% Print !Y! !X! !C! !T!
			) Else (
				For /F "Tokens=1-3" %%A in ("!Xc! !Xc__! !Yc!") Do (
					Set "Line[!Yc!]=!Line[%%C]:~0,%%A!!T!!Line[%%C]:~%%B!"
				)
				Set /a "_X=(Xc - PenL) - (67 * 7) + (PenL + PenL) - Hmin"
				For %%T in (!_X!) Do (
					If %%T Gtr 0 (
						%ui% Print !Y! !X! !T:~0,-%%T!
					) Else %ui% Print !Y! !X! !T!

				)
			)
		) Else (
			If "!HistAct!" Equ "On" (
				If Not !Hc! Equ !Ht! (
					Set /a "Ht=Hc + 1, Hc+=1"
					Set Line[>"%Hist%\H[!Hc!]"
				) Else (
					Set /a "Hc+=1, Ht+=1"
					Set Line[>"%Hist%\H[!Hc!]"
				)
				Set "HistAct=Off"
			)
		)
		REM Goto :Main
	)
	If !Btn! Equ 4 (Set>Tmp.txt &Goto :Main)
	If !Btn! Equ 1 (
		If !Y! Equ 0 (
			If !X! Geq 0 If !X! Leq 5  (Set Return=Refresh.Main& Goto :Open)
			If !X! Geq 8 If !X! Leq 13 Goto :Save
			If !X! Geq 16 If !X! Leq 20 (
				Rem EndLocal
				Goto :New
			)
			If !X! Geq 32 If !X! Leq 35 (Set Form=Simple& Goto :Form1)
			If !X! Geq 38 If !X! Leq 41 (Set Form=All& Goto :Form1)
			If !X! Geq 52 If !X! Leq 54 Goto :Delete
			If !X! Geq 56 If !X! Leq 58 Goto :Text
			If !X! Geq 60 If !X! Leq 62 Goto :Copy
			If !X! Geq 64 If !X! Leq 66 Goto :Export
			If !X! Geq 68 If !X! Leq 70 (
				Set/a FontS+=1
				If !FontS! Equ 2 Set FontS=5
				If !FontS! Equ 7 Set FontS=8
				If !FontS! Gtr 9 Set FontS=0
				%ui% Font !FontS!
			)
			If !X! Geq 71 If !X! Leq 74 Goto :Help
			If !X! Geq 85 If !X! Leq 87 Call :Exit || Goto :Eof
		)
		If !Y! Equ 22 If !X! Geq 5 If !X! Leq 7 %Mov% V -
		If !Y! Equ 23 (
			If !X! Geq 3 If !X! Leq 5 %Mov% H -
			If !X! Geq 7 If !X! Leq 9 %Mov% H +
		)
		If !Y! Equ 24 (
			If !X! Geq 5 If !X! Leq 7 %Mov% V +
			If !X! Equ 11 If !SpeedS! Gtr 1 Set /a SpeedS-=1&%ResetM%
			If !X! Equ 13 If !SpeedS! Lss 5 Set /a SpeedS+=1&%ResetM%
		)

		%== Color Palette Bar ==%
		If !Y! Geq 3 If !X! Equ 86 (
			For /L %%N in (3,2,21) Do (
				If !Y! Equ %%N (
					If !Del! Equ Yes Set Del=No& %Ui% Print 0 53 70 #
					Set /a "CpSel=((%%N - 3) / 2 ) + 1"
					For %%S in (!CpSel!) Do (
						Set "C=!Cp[%%S]:~0,2!"
						Set "T=!Cp[%%S]:~3,3!"
					)
					Set PenL=3&Set TextS=Off&Set Status=
					Call :Cpalette
					Call :Pen
				)
			)
		)
		If !X! Geq 85 If !X! Leq 87 (
			If !Y! Equ 23 Call :Cpp 1
			If !Y! Equ 25 Call :Cpp 2
			Call :CPalette
			Call :Pen
		)
		
	)
	If /i "!Del!" Neq "Yes" If !X! Leq 14 If !Y! Geq 2  (
		If Not Defined Blink (
			%Ui% Cursor 100
			Set Blink=1
		) Else %Ui% Locate !Y! !X!
		If !Btn! Equ 1 (
			If !Y! Equ 3 Set CharSet=01;02;03;04;05;06;07;08;09;0B;0C;0D;0E
			If !Y! Equ 4 Set CharSet=0F;10;11;12;13;14;15;16;17;18;19;1A;1B
			If !Y! Equ 5 Set CharSet=1C;1D;1E;1F;7F;9B;9D;9F;A8;A9;AA;AB;AC
			If !Y! Equ 6 Set CharSet=AD;AE;AF;B0;B1;B2;B3;B4;B8;B9;BA;BB;BC
			If !Y! Equ 7 Set CharSet=BD;BE;BF;C0;C1;C2;C3;C4;C5;C8;C9;CA;CB
			If !Y! Equ 8 Set CharSet=CC;CD;CE;CF;D0;D8;D9;DA;DB;DC;DF;E6;E7
			If !Y! Equ 9 Set CharSet=E8;EE;EF;F0;F1;F2;F3;2E;F5;F6;F7;F8;F9
			If !Y! Equ 10 Set CharSet=FA;FB;FC;FD;FE;21;23;24;25;2A;2D;5F;7E

			If Defined CharSet (
				Set Cnt=0
				For %%T in (!CharSet!) Do (
					Set /a Cnt+=1
					If !X! Equ !Cnt! Set T=\%%T
				)
				Set PenL=3&Set TextS=Off&Set Status=
				Call :Pen
				Call :CPalette Ref
				Set "CharSet="
				%ResetM%
			)
			If !Y! Equ 14 (
				If !PenL! Equ 3 (
					If !X! Equ 3 Set C=0!C:~1,2!
					If !X! Equ 4 Set C=1!C:~1,2!
					If !X! Equ 5 Set C=2!C:~1,2!
					If !X! Equ 6 Set C=3!C:~1,2!
					If !X! Equ 7 Set C=4!C:~1,2!
					If !X! Equ 8 Set C=5!C:~1,2!
					If !X! Equ 9 Set C=6!C:~1,2!
					If !X! Equ 10 Set C=7!C:~1,2!
					Call :Pen
					Call :CPalette Ref
				)
			)
			If !Y! Equ 15 (
				If !PenL! Equ 3 (
					If !X! Equ 3 Set C=8!C:~1,2!
					If !X! Equ 4 Set C=9!C:~1,2!
					If !X! Equ 5 Set C=A!C:~1,2!
					If !X! Equ 6 Set C=B!C:~1,2!
					If !X! Equ 7 Set C=C!C:~1,2!
					If !X! Equ 8 Set C=D!C:~1,2!
					If !X! Equ 9 Set C=E!C:~1,2!
					If !X! Equ 10 Set C=F!C:~1,2!
					Call :Pen
					Call :CPalette Ref
				)
			)
			
			If !Y! Equ 17 (
				If !PenL! Equ 3 (
					If !X! Equ 3 Set C=!C:~,1!0
					If !X! Equ 4 Set C=!C:~,1!1
					If !X! Equ 5 Set C=!C:~,1!2
					If !X! Equ 6 Set C=!C:~,1!3
					If !X! Equ 7 Set C=!C:~,1!4
					If !X! Equ 8 Set C=!C:~,1!5
					If !X! Equ 9 Set C=!C:~,1!6
					If !X! Equ 10 Set C=!C:~,1!7
					Call :Pen
					Call :CPalette Ref
				)
			)
			If !Y! Equ 18 (
				If !PenL! Equ 3 (
					If !X! Equ 3 Set C=!C:~,1!8
					If !X! Equ 4 Set C=!C:~,1!9
					If !X! Equ 5 Set C=!C:~,1!A
					If !X! Equ 6 Set C=!C:~,1!B
					If !X! Equ 7 Set C=!C:~,1!C
					If !X! Equ 8 Set C=!C:~,1!D
					If !X! Equ 9 Set C=!C:~,1!E
					If !X! Equ 10 Set C=!C:~,1!F
					Call :Pen
					Call :CPalette Ref
				)
			)
		)
	)
)
	Goto :Main
:Exit
	%Ui% Print 10 36 ^
	CF "          Exit           \n"^
	F0 "                         \n"^
	F0 "    Do you want exit?    \n"^
	F0 "                         \n"^
	F0 "      " 70 " Yes " F0 "   " 70 " No " F0 "       "\n^
	F0 "                         \n"^
	:Exit_
	For /L %%! in (1,1,25) Do (
		%Mouse%
		If !Btn! Equ 1 If !Y! Equ 14 (
			If !X! Geq 42 If !X! Leq 46 (
				Del "Lib\Mouse.Tmp" >Nul 2>&1
				Rd /s /q "%Hist%"   >Nul 2>&1
				EndLocal & EndLocal & Cls
				Title %ComSpec%
				Exit /B 1
			)
			If !X! Geq 50 If !X! Leq 53 (
				%Mov% Render
				Goto :Eof
			)
		)
	
	)
	Goto :Exit_
:Refresh.Main
	Call :Pen
	%Mov% Render
	%ResetM%
	Goto :Main
:CPalette
	If Defined Ycp !Ui! Print !Ycp! 85 08 \B3\00\B3
	Set /a "Ycp= 3 + (CpSel + (CpSel - 2))"
	!Ui! Print !Ycp! 85 0E \B3\00\B3
	Set "Tmp_="
	If "%1" Equ "Ref" (
		Set "Cp[!CpSel!]=!C! !T!"
	)
	For /L %%N in (1,1,10) Do (
		Set "Tmp_=!Tmp_!!Cp[%%N]:~0,6!\n\n "
	)
	!Ui! Print 3 86 !Tmp_!
	Set "Tmp_="
	Goto :Eof
:Cpp
	If %1 Equ 1 (
		Set __Mode=Open
	) Else Set __Mode=Save
	Set Err=
	Set Sfit=
	For %%a in (
		"CPalette Files|.cpal"
	) Do Set "Sfit=!Sfit!%%a,"
	Call :Exec FileBrowser !Sfit!
	%ResetM%
	If !ErrorLevel! Equ 1 (
		%Mov% Render
		Call :Pen
		Call :Cpalette
		Goto :Eof
	)
	If %1 Equ 1 (
		Set Cnt=0
		For /F "Useback Delims=" %%D in ("!ObjFile!") Do (
			Set /a Cnt+=1
			Set "Cp[!Cnt!]=%%D"
		)
	) Else (
		Del "!ObjFile!" >Nul 2>&1
		For /L %%N in (1,1,10) Do (
			Echo;!Cp[%%N]!>>"!ObjFile!"
		)
	)
	%Mov% Render
	Call :Pen
	Call :Cpalette
	Goto :Eof

:Pen
	If !PenL! Equ 3 (
		%ui% Print 19 10 !C! "!T:~0,3!"
	) Else (
		%ui% Print 19 10 !T:~0,7!
	)
	%ui% Print 27 0 70 "!Status!Rows: !Map.Y! \B3 Cols: !Map.X! \B3 Color: !C! \B3 Char: !T:~1,2! \B3                                             "
	Goto :Eof

:Menu
	%ui% Locate !Y! !X! & %ui% Cursor 100
	%Dlg% 25 8 0e
	%ui% Print 9 35 0b " Select an option\n" 03 "to selected pixel\n"^
	70 "   Paste Here   \n\n   Copy Pixel   \n\n   Copy Color   \n\n   Copy Brush   \n\n     Cancel     "
	:Menu_
	For /L %%! in (1,1,25) Do (
		%Mouse%
		If !Btn! Equ 1 If !X! Geq 35 If !X! Leq 50 (
			If !Y! Equ 11 (%ui% Cursor 0&Goto :Paste)
			If !Y! Equ 13 (Set Dropp=Pixel&Goto :Dropp)
			If !Y! Equ 15 (Set Dropp=Color&Goto :Dropp)
			If !Y! Equ 17 (Set Dropp=Brush&Goto :Dropp)
			If !Y! Equ 19 (
				Call :Pen
				%Mov% Render
				%ui% Cursor 0
				%ResetM%
				Goto :Main
			)
		)
	)
	Goto :Menu_
:Open
	Set __Mode=Open
	Set Err=
	Set Sfit=
	For %%a in (
		"All Files Supported|.mpe;.pbc;.pic;.bat;.spr"
		"Map Editor Files|.mpe"
		"Bg Binary Sprite|.spr"
		"Paint Batch Files|.pbc"
		"Pic Editor Files|.pic"
		"Batch Paint Files|.bat"
	) Do Set "Sfit=!Sfit!%%a,"
	Call :Exec FileBrowser !Sfit!
	%ResetM%
	If !Errorlevel! Equ 1 Goto :!Return!
	For /F "Tokens=2 Delims==" %%a in ('Set^|Find /i "Line["') Do Set %%a=
	:OpenFromArg
	For %%I in ("!ObjFile!") Do (
		If /i "%%~xI"==".pbc" (Call :Exec PbcToMpe %%I&Goto :NonMpe)
		If /i "%%~xI"==".pic" (Call :Exec PicToMpe %%I&Goto :NonMpe)
		If /i "%%~xI"==".bat" (Call :Exec BatToMpe %%I&Goto :NonMpe)
		If /i "%%~xI"==".spr" (Call :Exec SprDecoder %%I&Goto :NonMpe)
	)
	Type "!ObjFile!"|Find "!~!">nul||Goto :ErrOpen
	For /F "Tokens=3,4 Skip=1 Delims=x " %%a in ('Type "!ObjFile!"^|Find "*\"') Do (
		Set/a Map.X=%%a,Map.Y=%%b
	)
	Set Count=0
	For /F "Tokens=*" %%a in ('Type "!ObjFile!"^|Find /v "*\"') Do (
		Set/a Count+=1
		Set Line[!Count!]=%%a
	)
	:NonMpe
	If "!Err!" Equ "2" Goto :ErrOpen
	Set/a Hmin=0,Hmax=469,Vmin=1,Vmax=23
	Set/a "MaX.X=(!Map.X!*7)-!Hmax!,CutSpace=!Map.x!*7"
	%Mov% Render
	Call :Pen
	Call :CPalette Ref
	Set "[File]=!ObjFile!"
	For %%R in ("!ObjFile!") Do (
		Title Map Editor !~:~16! - [%%~nxR]
		Set /a Hc=0,Ht=0
		Set HistAct=Off
		Set "Hist=!Tmp!\Mp_%%~nxR"
		Md "!Hist!" >Nul 2>&1
		Set Line[>"!Hist!\H[0]"
	)
	Goto :Main
:ErrOpen
	Set Tmp_=
	For %%a in (
	"c0 "
	"$           Error             \n$" " f0 "
	"$   Cannot be read this file  \n"
	"                             \n"
	"            $ 80 $ Ok $ f0 $             $"
	) Do Set Tmp_=!Tmp_!%%~a
	Set Tmp_=!Tmp_:$="!
	%Ui% Print 10 30 !Tmp_!
	:ErrOpen_
	%Mouse%
	If !Btn! Equ 1 If !Y! Equ 13 If !X! Geq 43 If !X! Leq 46 Goto :Open
	Goto :ErrOpen_
:Save
For %%T in (![File]!) Do Set "Ext=%%~xT" & Set "Rfn=%%~dpnT"
If /i "!Ext!" Equ ".bat" Call :Exec MpeToBat "!Rfn!.bat" !BATs!
If /i "!Ext!" Equ ".pic" Call :Exec MpeToPic "!Rfn!.pic" !PICs!
If /i "!Ext!" Equ ".pbc" Call :Exec MpeToPbc "!Rfn!.pbc" !PBCs!
If /i "!Ext!" Equ ".spr" Call :Exec SprEncoder "!Rfn!.spr" 0,!Map.X! 1,!Map.Y!
If /i "!Ext!" Equ ".mpe" (
	( <Nul Set/p=*\ Map Editor Header - !~! *\!LF!
	  <Nul Set/p=*\ SizeData: !Map.x!x!Map.Y! *\!LF!)>![File]!
	For /l %%a in (1,1,!Map.Y!) Do (
		Set "Line[%%a]=!Line[%%a]:~0,%CutSpace%!"
		<Nul Set/p=!Line[%%a]!!LF!>>![File]!
	)
)
	Goto :Refresh.Main
:Dlg x,y cl
	%ui% Print %2 %1 %3 %Dlg%
	Goto :Eof
:Form1
	If !TextS! Equ On If !Del! Equ No (Set Form=single&Goto :Main)
	Call :Select "Set the area to apply the form, for options press Right Click"
	If !Errorlevel! Equ 3 Goto :Main
	For %%# in (1,2) do If Not Defined F%%# (
		%Mov% Render
		Goto :Form1
	)
	Call :Getpos
	Set ix_=!Ix!
	For /l %%x in (!iX!,7,!fX!) Do (
		Set "fps=!Fps!!C! !T! "
		Set/a ix_+=7
	)
	:: // Check if the form its filled or not
	If /i "!Form!" Equ "All" (
		For /l %%y in (!iY!,1,!fY!) Do (
			Set "Line[%%y]=!Line[%%y]:~0,%iX%!!Fps!!Line[%%y]:~%iX_%!"
		)
		Goto :ok
	)

	:: // Start of form with margins
	For %%# in (!iY!,!fY!) Do (
		Set "Line[%%#]=!Line[%%#]:~0,%iX%!!Fps!!Line[%%#]:~%iX_%!"
	)
	Set/a iX_=!iX!+7
	For /l %%y in (!iY!,1,!fY!) Do (
		Set "Line[%%y]=!Line[%%y]:~0,%iX%!!C! !T! !Line[%%y]:~%iX_%!"
	)
	Set/a iX_=!fX!+7
	For /l %%y in (!iY!,1,!fY!) Do (
		Set "Line[%%y]=!Line[%%y]:~0,%fX%!!C! !T! !Line[%%y]:~%iX_%!"
	)
	:ok
	If Not !Hc! Equ !Ht! (
		Set /a "Ht=Hc + 1, Hc+=1"
		Set Line[>"%Hist%\H[!Hc!]"
	) Else (
		Set /a "Hc+=1, Ht+=1"
		Set Line[>"%Hist%\H[!Hc!]"
	)
	Call :Pen
	%Mov% Render
	Set Fps=&Set Form=single
	%ResetM%
	Goto :Main
:Form2
	:: // Create the form filled
	For /l %%y in (!iY!,1,!fY!) Do (
		Set "Line[%%y]=!Line[%%y]:~0,%iX%!!Fps!!Line[%%y]:~%iX_%!"
	)
	Goto :Eof
:Delete
%ResetM%
If !TextS! Equ Off (
	If /i "!Del!" Equ "No" (
		Set Del=Yes
		%ui% Print 0 53 7c #
		Set Cb=!C!&Set C=00
		Set Tb=!T!&Set T=\FF
	) Else (
		Set Del=No
		%ui% Print 0 53 70 #
		Set C=!Cb!&Set Cb=
		Set T=!Tb!&Set Tb=
	)
)

If !TextS! Equ On (
	If /i "!Del!" Equ "No" (
		Set Del=Yes
		%ui% Print 0 53 7c #
		Set Cb=!C!&Set C=00
		Set Tb=!T!&Set T=\FF
		Set PenLb=!PenL!&Set PenL=3
	) Else (
		Set Del=No
		%ui% Print 0 53 70 #
		Set T=!Tb!&Set Tb=
		Set PenL=!PenLb!&Set PenLb=
		Set C=!Cb!&Set Cb=
	)
)
	Call :Pen
	Goto :Main
:Copy
	Call :Select "Set the area to copy the color sequences, for options press Right Click"
	If !Errorlevel! Equ 3 Goto :Main
	For %%# in (1,2) do If Not Defined F%%# (
		%Mov% Render
		Goto :Copy
	)
	Call :GetPos
	:: Ix = Start Of Pic 'X' Coord
	:: Fx = End Of Pic  'X' Coord
	Set /a "Fx_=(!Fx!-!Ix!)+7"
	Set /a "X__=!Fx_! / 7, Y__=(!FY! - !IY!) + 1"
	(
		Echo;!HeadCopy!
		Echo;*\ SizeData: !X__!x!Y__! *\
	) >"!Tmp!\Copy.txt"
	For /l %%y in (!iY!,1,!fY!) Do Echo;!Line[%%y]:~%iX%,%fX_%!>>"!Tmp!\Copy.txt"
	!Nc! Clipboard ReadFile "!Tmp!\Copy.txt"
	Call :Pen
	%Mov% Render
	Set X__=&Set Y__=
	Goto :Main
:Export
	%Dlg% 25 8 02
	Set Tmp_=
	For %%a in (
	" 0a "
	"$\00        Select An Option\n\n    $"
	" 70  $       Save full map        \n\n$"
	" 07 $    $ 70 "
	"$    Select area to save     \n\n$"
	" 07 $    $ 70 "
	"$ Save with recommended size \n\n\n\n$"
	" 07 $\00            $ 70 "
	"$ Cancel $"
	) Do Set "Tmp_=!Tmp_!%%~a"
	Set Tmp_=!Tmp_:$="!
	%Ui% Print 9 26 !Tmp_!
	:Export_M
	For /L %%! in (1,1,100) Do (
		%Mouse%
		If !Btn! Equ 1 (
			If !X! Geq 30 If !X! Leq 57 (
				If !Y! Equ 11 (
					Set "Coords=0,!Map.X! 1,!Map.Y!"
					Goto :Exp_S
				)
				If !Y! Equ 13 (
					%ResetM%
					%Mov% Render
					Call :Select "Set the area to export. For more options, press Right Click"
					If !Errorlevel! Equ 3 Goto :Main
						For %%# in (1,2) do If Not Defined F%%# (
							%Mov% Render
							rem Goto :F
						)
					)
					Call :GetPos
					Set/a iX=iX/7,fX=fX/7+1
					Set "Coords=!iX!,!fX! !iY!,!fY!"
					Goto :Exp_S
				)
				If !Y! Equ 15 (
					Set Coords={}
					Goto :Exp_S
				)
			)
			If !X! Geq 39 If !X! Leq 46 If !Y! Equ 19 Goto :Refresh.Main
		)
	)
	Goto :Export_M
:Exp_s
	Set __Mode=Save
	Set Sfit=
	For %%a in (
		"Bg Binary Sprite|.spr"
		"Paint Batch Files|.pbc"
		"Pic Editor Files|.pic"
		"Batch Paint Files|.bat"
		"Map Editor Files|.mpe"
	) Do Set "Sfit=!Sfit!%%a,"
	Call :Exec FileBrowser !Sfit!
	If !Errorlevel! Equ 1 Goto :Refresh.Main
	For %%A in (!ObjFile!) Do Set "Tmp_=%%~xA"
	If "!Coords!" Equ "{}" (
		If /i "!Tmp_!" Equ ".pbc" Set "Coords=!PBCs!"
		If /i "!Tmp_!" Equ ".bat" Set "Coords=!BATs!"
		If /i "!Tmp_!" Equ ".pic" Set "Coords=!PICs!"
		If /i "!Tmp_!" Equ ".mpe" Set "Coords=0,!Map.X! 1,!Map.Y!"
		If /i "!Tmp_!" Equ ".spr" Set "Coords=0,80 1,25"
	)
	%ResetM%
	If /i "!Tmp_!" Equ ".mpe" Goto :MpeRAM_To_Mpe
	%Mov% Render
	If  /i "!Tmp_!" Equ ".spr" (
		Call :Exec SprEncoder !ObjFile! !Coords!
	) Else (
		Call :Exec MpeTo!Tmp_:~1! !ObjFile! !Coords!
	)
	Goto :Refresh.Main

:MpeRAM_To_Mpe
	Set Tmp_=&Set Tmp__=&Set Tmp___=
	For /F "Tokens=1-4 Delims=, " %%a in ("!Coords!") Do Set/a X_=%%b-%%a,Y_=%%d-%%c,X=%%a*7,_X=%%b*7
	If !X_! Lss 67 (
		Call :Comp.X.Cr
		Set X_=67
		)
	If !Y_! Lss 23 (
		Call :Comp.Y.Cr
		Set Y_=23
	)
	( <Nul Set/p=*\ Map Editor Header - !~! *\!LF!
	  <Nul Set/p=*\ SizeData: !X_!x!Y_! *\!LF!)>!ObjFile!
		For /F "Tokens=3-4 Delims=, " %%a in ("!Coords!") Do (
		For /L %%# in (%%a,1,%%b) Do (
			<Nul Set/p=!Line[%%#]:~%X%,%_X%!!Tmp_!!LF!>>!ObjFile!
	))
	<Nul Set/p=!Tmp___!>>!ObjFile!
	Goto :Refresh.Main
:Comp.X.Cr
	Set/a Xm=67-!X_!
	For /L %%# in (1,1,!Xm!) Do Set "Tmp_=!Tmp_!00 \FF "
	Set Xm=
	Goto :Eof
:Comp.Y.Cr
	Set/a Ym=23-!Y_!
	For /L %%# in (1,1,!X_!) Do Set "Tmp__=!Tmp__!00 \FF "
	For /L %%# in (1,1,!Ym!) Do Set "Tmp___=!Tmp___!!Tmp__!!LF!"
	Set Ym=
	Goto :Eof
:Paste
	Del !PasteFile! 2>Nul
	!Nc! Clipboard WriteFile !PasteFile!
	If Not Exist !PasteFile! (
		%Mov% Render
		Goto :Main
	)
	For /F "Tokens=* Skip=1" %%x in ('Type !PasteFile!') Do Set "Str=%%x"
	If Not Defined Str (
		%Mov% Render
		Goto :Main
	)
	Type !PasteFile!|Find "!HeadCopy!">nul||(
		%Mov% Render
		Goto :Main
	)
	Call :Getst "!Str!"
	Set/a iy_=!Yc!,Xc_=!Count!+!Xc!
	For /F "Tokens=* Skip=2" %%a in ('Type !PasteFile!') Do Call :Paste_run "%%a"

	If Not !Hc! Equ !Ht! (
		Set /a "Ht=Hc + 1, Hc+=1"
		Set Line[>"%Hist%\H[!Hc!]"
	) Else (
		Set /a "Hc+=1, Ht+=1"
		Set Line[>"%Hist%\H[!Hc!]"
	)

	Call :Pen
	%Mov% Render
	Goto :Main
:paste_run
	If !iy_! Gtr !Map.y! Goto :Eof
	Set "Line[!iy_!]=!Line[%iy_%]:~0,%Xc%!%~1!Line[%iy_%]:~%Xc_%!"
	Set/a iy_+=1
	Goto :Eof

:Dropp
	%ui% Cursor 0
	Set/a Xc_=Xc+3
	If /i "!Dropp!" Equ "Pixel" (
		Set "T=!Line[%Yc%]:~%Xc_%,3!"
		Set "C=!Line[%Yc%]:~%Xc%,2!"
		Set "Cp[!CpSel!]=!C! !T! "
		Set PenL=3
		Set TextS=Off
		Set Status=
	)
	If !TextS! Equ Off (
		If /i "!Dropp!" Equ "Color" (
			Set "C=!Line[%Yc%]:~%Xc%,2!"
			Set "Cp[!CpSel!]=!C! !T! "
		)
		If /i "!Dropp!" Equ "Brush" (
			Set "T=!Line[%Yc%]:~%Xc_%,3!"
			Set "Cp[!CpSel!]=!C! !T! "
		)
	)
	%ui% Print 0 53 70 #
	Set Del=No
	Call :Pen
	Call :CPalette
	%Mov% Render
	Goto :Main
:GetSt
	Set "Tmp_=%~1"
	Set Count=0
	:GetSt_run
	If Not Defined Tmp_ Goto :Eof
	Set "Tmp_=!Tmp_:~7!"
	Set/a Count+=7
	Goto :GetSt_Run
:Select Msg
%ui% Print 27 0 70 "%~1"
:Selc
For %%a in (F1 F2 FB1 FB2) Do Set %%a=
	:Sel_
	For /L %%! in (1,1,100) Do (
		%Mouse%
		Set /a "Xc=(X - 17) * 7 + Hmin, Yc=Y - 3 + Vmin"
		Set /a "Xc_=Xc + 7"
		If !Kbd! Equ 332 %Mov% H +
		If !Kbd! Equ 330 %Mov% H -
		If !Kbd! Equ 327 %Mov% V -
		If !Kbd! Equ 335 %Mov% V +
	
		If !Btn! Equ 2 Call :Boxcon
		If !Btn! Equ 1 (

			If !Y! Equ 22 If !X! Geq 5 If !X! Leq 7 %Mov% V -
			If !Y! Equ 23 (
				If !X! Geq 3 If !X! Leq 5 %Mov% H -
				If !X! Geq 7 If !X! Leq 9 %Mov% H +
			)
			If !Y! Equ 24 (
				If !X! Geq 5 If !X! Leq 7 %Mov% V +
				If !X! Equ 11 If !SpeedS! Gtr 1 Set /a SpeedS-=1&%ResetM%
				If !X! Equ 13 If !SpeedS! Lss 5 Set /a SpeedS+=1&%ResetM%
			)

			If !X! Geq 17 If !X! Leq 83 If !Y! Geq 3 If !Y! Leq 25 (
				Rem :::::::::::::::::::::::::::::::
				If !Errorlevel! Equ 10 (Call :RestCur & Exit/b 0)
				If !Errorlevel! Equ 20 (
					Call :RestCur
					%Mov% Render
					%ResetM%
					Goto :Selc
				)
				If !Errorlevel! Equ 30 (
					%ResetM%
					Call :RestCur
					%Mov% Render
					Call :Pen
					%ResetM%
					Exit /b 3
				)
				Rem :::::::::::::::::::::::::::::::
				
				If Not Defined F1 (
					For /F "Tokens=1-2" %%X in ("!Xc! !Yc!") Do (
						Set "FB1=!Line[%%Y]:~%%X,7!"
						Set F1=%%X.%%Y
						For %%Z in (!Xc_!) Do (
							Set "Line[%%Y]=!Line[%%Y]:~0,%%X!9b \23 !Line[%%Y]:~%%Z!"
						)
					)
				) Else (
					If "!F1!" Neq "!Xc!.!Yc!" (
						If Defined F2 (
							For /F "Tokens=1-2 Delims=." %%x in ("!F2!") Do (
								Set /a "Xc__=%%x + 7"
								For %%Z in (!Xc__!) Do (
									Set "Line[%%y]=!Line[%%y]:~0,%%x!!FB2!!Line[%%y]:~%%Z!"
								)
							)
						)
						For /F "Tokens=1-2" %%X in ("!Xc! !Yc!") Do (
							Set "FB2=!Line[%%Y]:~%%X,7!"
							Set F2=%%X.%%Y
							For %%Z in (!Xc_!) Do (
								Set "Line[%%Y]=!Line[%%Y]:~0,%%X!9b \23 !Line[%%Y]:~%%Z!"
							)
						)
					)
				)
				%Mov% Render
			)
		)
	)
	Goto :Sel_
:RestCur
For %%. in (1 2) Do (
	If Defined F%%. (
		For /F "Tokens=1-2 Delims=." %%x in ("!F%%.!") Do (
			Set /a "Xc_=%%x + 7"
			For %%# in (!Xc_!) Do (
				Set "Line[%%y]=!Line[%%y]:~0,%%x!!FB%%.!!Line[%%y]:~%%#!"
			)
		)
	)
)
	Goto :Eof
:BoxCon
	%Dlg% 25 8 0b
	%ui% Print 9 35 0a ^
		"Select an option" 70 "\n\n       Ok        \n\n      Retry      \n\n      Cancel     "
	:BoxCon_
	For /L %%! in (1,1,100) Do (
		%Mouse%
		If !Btn! Equ 1 (
			If !Y! Equ 11 If !X! Geq 35 If !X! Leq 51 Exit /b 10
			If !Y! Equ 13 If !X! Geq 35 If !X! Leq 51 Exit /b 20
			If !Y! Equ 15 If !X! Geq 35 If !X! Leq 51 Exit /b 30
		)
	)
	Goto :BoxCon_
:GetPos
	For /F "Tokens=1-4 Delims=." %%a in ("!F1!.!F2!") Do (
		Set/a iX=%%a,iY=%%b,fX=%%c,fY=%%d
		If !iX! Gtr !fX! Set/a iX=%%c,fX=%%a
		If !iY! Gtr !fY! Set/a iY=%%d,fY=%%b
	)
	Goto :Eof
:Text
	If !PenL! Equ 3 Set TB=!T!
	Set /a "Bg=0, Fg=7, Xc=26"
	Set "Cls=80 \DC 81 \DC 82 \DC 83 \DC 84 \DC 85 \DC 86 \DC 87 \DC 88 \DC 89 \DC 8A \DC 8B \DC 8C \DC 8D \DC 8E \DC 8F \DC"
	Set "Blank="
	:: Set "Pal="

	For /L %%N in (1,1,38) Do Set "Blank=!Blank! "
	%Ui% Cursor 25

	Set /a "Xc=(TextSize / 7) + 26"
	%Ui% Locate 9 !Xc!
	%ui% Print 5 24 ^
	4C "             Text Stamper                 \n"^
	8F "                                          \n"^
	8F " \10Type the text:                          \n"^
	8F " \DA\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\BF\20\n"^
	8F " \B3\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\20\B3\20\n"^
	8F " \C0\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\D9\20\n"^
	8F "                                          \n"^
	8F " \10Font Color     \10Current: ( )            \n"^
	8F "   Bg " %Cls% 8F "                    \n"^
	8F "   Fg " %Cls% 8F "                    \n"^
	8F "                                          \n"^
	8F "    " 70 " Accept " 8F "       " 70 " Cancel " 8F "      " 70 " Off " 8F "    \n"^
	8F "                                          \n"
	If Defined Pal %Ui% Print  9 26 !Pal!
	%Ui% Print 12 52 !Bg!!Fg! "*" 8F "\00\00!Bg!!Fg!"
	:Text_
	For /L %%! in (1,1,100) Do (
		rem ResetM%
		%Mouse%
		Title !X!.!Y! !Kbd! __ !BG!!FG!
		If !Kbd! Gtr 0 If !Kbd! Lss 256 If !Kbd! Neq 10 (
			%=== Dec To Hex  ===%
			Set "Dec=!Kbd!"
			Set "Hex="
			Set "Map=0123456789ABCDEF"
			For /L %%N in (1,1,2) do (
				Set /a "d=Dec&15,Dec>>=4"
				For %%D in (!D!) Do Set "Hex=!map:~%%D,1!!Hex!"
			)
			%=== End Of ===%
			If !Kbd! Equ 8 (
				If Defined Pal (
					Set "Pal=!Pal:~0,-7!"
					Set /a "TextSize-=7, Xc-=1
					%Ui% Print  9 26 8F "!Blank!"
					%Ui% Print  9 26 !Pal!
					%Ui% Locate 9 !Xc!"
				)
			) Else (
				Rem 26 {InitXpos} + 38 {sizeOfTextBox} = 64 - 1 {Offset Correction} = 63
				If !Xc! Leq 63 (
					Set "Pal=!Pal!!Bg!!Fg! \!Hex! "
					Set /a "TextSize+=7, Xc+=1"
					%Ui% Locate 9 !Xc!
					%Ui% Print  9 26 !Pal!
				)
			)
		)
		If !Btn! Equ 1 (
			If !X! Geq 30 If !X! Leq 45 (
				Set /a "Xc_=(X - 30) * 7"
				For %%X in (!Xc_!) Do (
					Set _=!Cls:~%%X,7!
				)
				If !Y! Equ 13 Set Bg=!_:~1,1!
				If !Y! Equ 14 Set Fg=!_:~1,1!
				Set "_="
				%Ui% Print 12 52 !Bg!!Fg! "*" 8F "\00\00!Bg!!Fg!"
			)
			%== Accept, Cancel, Off buttons ==%
			If !Y! Equ 16 (
				If !X! Geq 28 If !X! Leq 35 (
					If Defined Pal (
						Set TextS=On
						Set "T=!Pal!"
						Set PenL=!TextSize!
						Set "Status=Pencil as Text Stamper \B3 "
					)
					%ResetM%
					%Ui% Cursor 0
					Goto :Refresh.Main
				)
				If !X! Geq 43 If !X! Leq 53 (
					If !TextS! Equ Off Set PenL=3
					%ResetM%
					%Ui% Cursor 0
					Goto :Refresh.Main
				)
				If !X! Geq 57 If !X! Leq 61 (
					Set TextS=Off
					Set PenL=3
					Set T=!TB!
					%ResetM%
					%Ui% Cursor 0
					Goto :Refresh.Main
				)
			)
		)

	)
	Goto :Text_
:Sel_Let
	If Not Defined Pal Set Row_=&Goto :Eof
	%ui% Print 10 27 08 !Bals!
	Set/a "row_=(!X!-27)*7"
	Set/a "Row__=!Row_!+7,Rxw=!Row_!+3"
	Set Pal_=!Pal:~%Row_%,2!
	If Defined Pal_ (
		Set Pal_=!Pal:~%Rxw%,3!
		Set Rxw=
		Set Tmp_=!Pal:~%Row_%,2!
		%ui% Print !Y! !X! 0a \18
		Set Fg=!Tmp_:~1,1!
		Set Bg=!Tmp_:~0,1!
		Set Tmp_=
		Goto :Eof
	)
	Set Row_=
	Goto :Eof

:Help
	Lib\Ansi.dll Lib\Help.bat LoadLib
	%Ui% Cursor 0 & %ResetM%
	Goto :Refresh.Main
:Margins X,Y
	Set Mg=\C4&Set "Fg= "&Set Marg=
	For /l %%x in (1,1,%1) Do Set Mg=!Mg!\C4&Set "Fg=!Fg! "
	For /l %%y in (1,1,%2) Do Set Marg=!Marg!\B3"!Fg!"\B3\n
	Set Marg=\DA!Mg!\BF\n!Marg!\C0!Mg!\D9"
	Set Mg=&Set Fg=
	Goto :Eof

:Exec [File] [Args]
	Set ".=%~1"
	Set "_~=!tmp!\Tmp$.%random%"
	Md "!_~!"
	Copy /y "Lib\!.!.dll" "!_~!\$Tmp.bat" >nul 2>nul
	Call "!_~!\$Tmp.bat" %2 %3 %4 %5 %6 %7 %8 %9
	Set Err=!Errorlevel!
	Rd /s /q "!_~!" >nul 2>nul
	Set .=&Set _~=
	If !Err! Equ 1 (Set Err=&Exit/b 1)
	:Set Err=
	Exit/b 0

:Flush
	For /f "Tokens=1 Delims==" %%a in ('Set') Do (
	If /i "%%a" Neq "Comspec" (
	If /i "%%a" Neq "Tmp" (
	If /i "%%a" Neq "Userprofile" (
	IF /i "%%a" Neq "SystemRoot" (
	IF /i "%%a" Neq "SystemDrive" (
	Set "%%a=")))))
	)
	Set "Path=%comspec:~0,-8%;%SystemRoot%;%Comspec:~0,-8%\Wbem"
	Goto :Eof

	:: Macros ::
<Function=Dlg|2>
	!Ui! Print %2 %1 %3 !DlgC!
</Function=Dlg>
	
<Function=Mouse|1>
	!Ui! Inputhit 1 >Lib\Mouse.tmp
	For /F "Tokens=1-5" %A in (Lib\Mouse.Tmp) Do (
		Set "Char="
		If %A Equ -2 (
			Set WStatus=Not Present
		) Else Set WStatus=Focused
		If %A Geq 0 Set Y=%A
		If %B Geq 0 Set X=%B
		If %C Geq 0 If %C Leq 5 Set Btn=%C
		If %C Geq 10000  Set/a Wheel+=1
		If %C Leq -10000 Set/a Wheel-=1 
		If "%E" Neq "" Set "Char=%E"
		Set Kbd=%D
	)
</Function=Mouse>

<Function=Mov|2>
	Set Err=0
	If %1 Equ H (
		Set /a "n=Hmin %2 ( 7 * SpeedS )"
	) 
	If %1 Equ V (
		Set /a "n=Vmin %2 SpeedS, l=Vmax %2 SpeedS"
	)
	If %1 Equ V (
		If !n! Lss 1 Set Err=-1
		If !l! Gtr !Map.Y! Set Err=-1
	) 
	If %1 Equ H (
		If !n! Gtr !MaX.x! Set Err=-1
		If !n! Lss 0 Set Err=-1
	)
	Rem ???
	If !Err! Neq -1 (
		If %1 Equ H Set /a "Hmin=n"
		If %1 Equ V Set /a "Vmin=n, Vmax=l"
		If "%3" Neq "S" (
			rem !Ui! Print 27 0 70 "!status!Row: !Vmax!/!Map.Y!   Col: !Hmin!/!MaX.X! "
		)
		Set /a "S1vmax=Vmax - 6, S1vmin=Vmin ,S2vmax=Vmax, S2vmin=Vmin + 17"
		rem \\ its 468 instead 469 because for delete the space for remplace a newline
		For %H in (!Hmin!) Do (
			For /l %x in (!S1Vmin!,1,!S1Vmax!) Do Set "Dsp1=!Dsp1!!Line[%x]:~%H,468!\n "
			For /l %x in (!S2Vmin!,1,!S2Vmax!) Do Set "Dsp2=!Dsp2!!Line[%x]:~%H,468!\n "
		)
		!Ui! Print 3 17 !Dsp1!
		!Ui! Print 20 17 !Dsp2!
		Set Dsp1=&Set Dsp2=&Set Kbd=0
	)
</Function=Mov>
	

:AutoMacro
	Set "Start="
	set "Tm=%Tmp%\Tmp.dat"
	Set "End="
	Set "%~1="
	For /F "Tokens=1,3 Delims=>|:" %%a in ('Findstr /N /B "</*Function=%~1" "%Im%"') Do (
		If Not Defined Start (
			Set Start=%%a
			Set Type=%%b
		) Else (
			Set End=%%a
		)
	)
	If %Type% Equ 1 (
		<Nul Set/p=([LF]>"%Tm%"
	)
	If %Type% Equ 2 (
		<Nul Set/p=For %%` in (0;1^) Do If %%` Equ 1 (For /F "Tokens=1-9" %%1 in ("!Argv!"^) Do ([LF]>"%Tm%"
	)
	Set/a Start+=2
	For /F "Tokens=1* Skip=%Start% Delims=[]" %%a in ('Find /N /V "" "%Im%"') do (
		If %%a Geq %End% Goto :End
		<Nul Set/p "=%%b[LF]">>"%Tm%"
	)
:End
	If %Type% Equ 1 (
		<Nul Set/p=^)>>"%Tm%"
	)
	If %Type% Equ 2 (
		<Nul Set/p=^)^) Else Set Argv=>>"%Tm%"
	)

	(
	For /F "Delims=" %%a in ('Type "%Tm%"') Do Set "%~1=%%a"
	) >Nul 2>&1 || Goto :ErrMacro
	Del "%Tm%">Nul 2>&1
	Set Tm=& Set Start=& Set End=
	Goto :Eof
:ErrMacro
	Set/a Start-=2
	For %%a in (
	"Macro Setup Failure from line:"
	"	Start: '%Start%'"
	"	End:   '%End%'"
	"	Expected '%~1' macro with size less than 8KB {8010B} (8100 Letters)"
	) Do Echo;%%~a
	Pause>Nul
	Exit