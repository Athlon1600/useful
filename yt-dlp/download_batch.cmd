@echo off

echo ----------------------------------------------------------
echo:
echo ------------------ Download all videos from urls inside batch.txt file
echo:
echo ----------------------------------------------------------

yt-dlp --batch-file "batch.txt" -o "%%(upload_date)s-%%(title)s.%%(ext)s" 
