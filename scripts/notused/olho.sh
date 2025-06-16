#!bin/sh
counter=1
while [ $counter -le 123456 ]
do
echo "Enter the link" $counter
read link
#youtube-dl -o '~/Music/Teste/'$counter' - %(title)s.%(ext)s' $link
yt-dlp -o '~/Music/%(playlist_title)s/'$counter' - %(title)s.%(ext)s' -ciw -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --cookies '~/Documents/ytdl/cookies-youtube-com.txt' $link
((counter++))
done
echo Done
