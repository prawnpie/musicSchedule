bitly=http://bit.ly/2014hsb

../sched.pl < scheduleSource/2014friday.tab > tmp/friday.inc
cat ../template.html | sed 's/DAY_GOES_HERE/Friday, October 3/g' | sed "s#BITLY_GOES_HERE#${bitly}#" > tmp/friday.html.tmp
perl -ne 's#CONTENT_GOES_HERE#`cat tmp/friday.inc`#e;print' tmp/friday.html.tmp > out/friday.html 

../sched.pl < scheduleSource/2014saturday.tab > tmp/saturday.inc
cat ../template.html | sed 's/DAY_GOES_HERE/Saturday, October 4/g' | sed "s#BITLY_GOES_HERE#${bitly}#" > tmp/saturday.html.tmp
perl -ne 's#CONTENT_GOES_HERE#`cat tmp/saturday.inc`#e;print' saturday.html.tmp > saturday.html

../sched.pl < scheduleSource/2014sunday.tab > tmp/sunday.inc
cat ../template.html | sed 's/DAY_GOES_HERE/Sunday, October 5/g' | sed "s#BITLY_GOES_HERE#${bitly}#" > tmp/sunday.html.tmp
perl -ne 's#CONTENT_GOES_HERE#`cat tmp/sunday.inc`#e;print' sunday.html.tmp > sunday.html

rm *.tmp
