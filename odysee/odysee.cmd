@ECHO off

echo ----------------------------------------------------------
echo:
echo ------------------ Optimize video for Odysee
echo:
echo ----------------------------------------------------------
echo:

set /p filename="Enter filename with extension: "

echo:
echo:

ffmpeg -i "%filename%" -c:v libx264 -crf 21 -preset faster -pix_fmt yuv420p -maxrate 5000K -bufsize 5000K -vf "scale=if(gte(iw\,ih)\,min(1920\,iw)\,-2):if(lt(iw\,ih)\,min(1920\,ih)\,-2)" -movflags +faststart -c:a aac -b:a 160k "output.mp4"
