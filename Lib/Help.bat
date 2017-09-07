@Echo Off
SetLocal EnableDelayedExpansion
	If "%1" Neq "LoadLib" (
		Echo;StandAlone not supported
		EndLocal
		Goto :Eof
	)
	Set/a Count=0,Vmin=1,Vmax=14
	Set Tmp_=
	For /F "Tokens=* Delims=" %%a in ('Type Lib\Help.hf') Do (
		Set/a Count+=1
		Set "Hlp[!Count!]=%%a"
	)
	Set TotalH=!Count!
	For %%a in (
	"91 $"
	"                     Help                         \n$" " F9 $"
	"\DA\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\BF\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\B3                                                \B3\n"
	"\C0\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\C4\D9\n"
	"$ 70   $\18\19 = Scroll  Any Key = Close                      \n$"
	) Do Set "Tmp_=!Tmp_!%%~a"
	Set Tmp_=!Tmp_:$="!
	%Ui% Print 5 25 !Tmp_!
	rem %Ui% Color f9
	<Nul Set/p=[1;5;47;30m
	Set Count=8
	For /L %%# in (!Vmin!,1,!Vmax!) Do (
		Echo;[!Count!;27H!Hlp[%%#]!
		Set /a Count+=1
	)

	Set "Pos="
	:Help_
	For /L %%# in (1,1,100) Do (
		%Ui% Kbd
		If !Errorlevel! Equ 327 (
			Set Pos=-
		) Else (
			If !Errorlevel! Equ 335 (Set Pos=+) Else Set "Pos="
		)
		If Defined Pos (
			Set Count=8
			If "!Pos!" Equ "+" (
				If !Vmax! Lss !TotalH! Set/a Vmin!Pos!=1,Vmax!Pos!=1
			) Else (
				If !Vmin! Gtr 1 Set/a Vmin!Pos!=1,Vmax!Pos!=1
			)
			For /L %%# in (!Vmin!,1,!Vmax!) Do (
				Echo;[!Count!;27H!Hlp[%%#]!
				Set /a Count+=1
			)
			Set "Pos="
		) Else (
			EndLocal
			Goto :Eof
		)
	)
	Goto :Help_