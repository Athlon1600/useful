@ECHO off

echo ----------------------------------------------------------
echo:
echo ------------------ Add overlay.png to video
echo:
echo ----------------------------------------------------------
echo:

set /p filename="Enter filename with extension: "

echo:
echo Where should the overlay go to?
echo 1. Top Left
echo 2. Top Right
echo 3. Bottom Left
echo 4. Bottom Right
echo:

set /p choice="Select option: " || set choice=2

:: Top Right default
set overlay=main_w-overlay_w-10:10

IF %choice% == 1 (set overlay=10:10)
:: IF %choice% == 2 (set overlay=main_w-overlay_w-10:10)
IF %choice% == 3 (set overlay=10:main_h-overlay_h-10)
IF %choice% == 4 (set overlay=main_w-overlay_w-10:main_h-overlay_h-10)

ffmpeg -i "%filename%" -i overlay.png -filter_complex "overlay=%overlay%" -preset faster -codec:a copy output.mp4
