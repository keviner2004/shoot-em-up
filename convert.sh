for i in *.wav;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" "$name.mp3" -y;
done
