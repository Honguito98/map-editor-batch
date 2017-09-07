	:: Status Library - Developed By Honguito98 ::
	::! This Cannot Run in mode Standalone !::
	:: Usage: Status.bat FILE ::
	:: This show a msg box for information ::
	:: This requires the: setlocal enabledelayedexpansion enableextensions ::
	::  and Fn.dll loaded in 'Ui' variable ::
	SetLocal
	Set "FLN=%~nx1"
	Set "FLN=!FLN:~0,14!"
	If "%2" Neq "" (
		Set [C]=e0
		Set [Title]=Saving 
		Set [Title2]=Stored
		) Else (
		Set [C]=a0
		Set [Title]=Opening
		Set [Title2]=Readed
		)
	::::
	Set Tmp_=
	For %%a in (
	"![C]! "
	"$         ![Title]!              \n$" " f0 "
	"$ ![Title]! File:                \n"
	" ![Title2]! Lines:                \n"
	"                              $"
	) Do Set Tmp_=!Tmp_!%%~a
	Set Tmp_=!Tmp_:$="!
	%Ui% Print 10 30 !Tmp_!
	%Ui% Print 11 45 f0 !FLN!
	%Ui% Locate 12 46 & %Ui% Color f1
	::::
	EndLocal
	Exit/b 0