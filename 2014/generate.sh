bitly=http://bit.ly/2014hsb

cat ../template.html | sed 's/DAY_GOES_HERE/Friday, October 3/g' | sed "s#BITLY_GOES_HERE#${bitly}#" > friday.html.tmp
perl -ne 's/CONTENT_GOES_HERE/`cat friday.inc`/e;print' friday.html.tmp > friday.html 

cat ../template.html | sed 's/DAY_GOES_HERE/Saturday, October 4/g' | sed "s#BITLY_GOES_HERE#${bitly}#" > saturday.html.tmp
perl -ne 's/CONTENT_GOES_HERE/`cat saturday.inc`/e;print' saturday.html.tmp > saturday.html

cat ../template.html | sed 's/DAY_GOES_HERE/Sunday, October 5/g' | sed "s#BITLY_GOES_HERE#${bitly}#" > sunday.html.tmp
perl -ne 's/CONTENT_GOES_HERE/`cat sunday.inc`/e;print' sunday.html.tmp > sunday.html

rm *.tmp
