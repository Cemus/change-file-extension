@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set /p folder="Entrez le chemin du dossier : "

if not exist "%folder%" (
    echo Le dossier spécifié n'existe pas.
	pause
    exit /b 1
)

set /p extension="Entrez l'extension choisie : "
set /a counter = 0


for %%f in ("%folder%\*") do (
    if "%%~xf"=="" (
        set "filename=%%~nf"
        ren "%%f" "!filename!.%extension%"
		set /a counter+=1
    )
)

echo Les extensions de %counter% fichier(s) ont été modifiées en %extension%.
pause
