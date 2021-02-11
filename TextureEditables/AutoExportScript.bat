
::This script will search through several folders in this directory for files ending in .ase or .aseprite, and export them to an output folder.
::By default, all sprites are exported at 5x scale, but that can be modified by changing the SCALE variable
::Note that the script will create folders and overwrite files as needed, but it will not clear the folders first.
::What this means is that you may need to manually delete the ExportedTextures folder from time to time, to clear out textures from files that no longer exist.


::Sprites in the folder simple-sprites will be flattened and exported.
::Sprites in the folder sprite-sheets will be exported as a horizontal sheet with all frames.
::Sprites in the folder by-group will be split into individual layer groups, then each group exported individually.
::Sprites in the folder no-scale will be flattened and exported - and will be exported at 1:1 scaling
::Sprites in the folder not-for-export (or anywhere else) will be ignored.

ECHO OFF
setlocal enabledelayedexpansion

@set ASEPRITE="D:\STEAM\steamapps\common\Aseprite\aseprite.exe"
@set /A SCALE = "5"
@set EXPORTPATH ="..\ExportedTextures\"



for /r .\by-group\ %%F in (*.ase*) do (
	
	 set "EDITABLEFOLDER=%%~dF%%~pF"
	 %ASEPRITE% -b %%F --color-mode rgb --scale %SCALE% --save-as ..\ExportedTextures\!EDITABLEFOLDER:%CD%\=!/{group}.png

	 echo BY-GROUP: File %%~nF%%~xF exported.
)

for /r .\sprite-sheet\ %%F in (*.ase*) do (
	
	 set "EDITABLEFOLDER=%%~dF%%~pF"
	 %ASEPRITE% -b %%F --color-mode rgb --scale %SCALE% --sheet ..\ExportedTextures\!EDITABLEFOLDER:%CD%\=!/%%~nF-sheet.png

	 echo SPRITE-SHEET: File %%~nF%%~xF exported.
)

for /r .\simple-sprites\ %%F in (*.ase*) do (
	
	 set "EDITABLEFOLDER=%%~dF%%~pF"
	 %ASEPRITE% -b %%F --color-mode rgb --scale %SCALE% --save-as ..\ExportedTextures\!EDITABLEFOLDER:%CD%\=!/%%~nF.png

	 echo SIMPLE-SPRITES: File %%~nF%%~xF exported.
)

for /r .\no-scale\ %%F in (*.ase*) do (
	
	 set "EDITABLEFOLDER=%%~dF%%~pF"
	 %ASEPRITE% -b %%F --color-mode rgb --scale 1 --save-as ..\ExportedTextures\!EDITABLEFOLDER:%CD%\=!/%%~nF.png

	 echo NO-SCALE: File %%~nF%%~xF exported.
)


endlocal
::PAUSE
