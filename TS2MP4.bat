for %%f in (*.ts) do call ffmpeg -i "%%~f" -vcodec copy -acodec copy "%%~nf.mp4"