
head=`grep -nH 'LEXICON Root' apertium-nhn.nhn.lexc  | cut -f2 -d':'`

for tag in `cat apertium-nhn.nhn.lexc | grep -o '%<[^>]\+%>' | sort -u`;  do
	found=`head -n $head apertium-nhn.nhn.lexc | grep "$tag" | wc -l`
	if [[ $found -eq 0 ]]; then
		echo "$tag                         !";
	fi
done

for tag in `cat apertium-nhn.nhn.lexc | grep -o '%{[^}]\+%}' | sort -u`;  do
	found=`head -n $head apertium-nhn.nhn.lexc | grep "$tag" | wc -l`
	if [[ $found -eq 0 ]]; then
		echo "$tag                         !";
	fi
done
