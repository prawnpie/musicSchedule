bitly=http://bit.ly/2014hsb

cp scheduleSource/index_page_qr.png out/

mkdir tmp

../sched.pl < scheduleSource/2014friday.tab > tmp/friday.inc
cat ../template.html \
| sed 's/DAY_GOES_HERE/Friday, October 3/g' \
| sed "s#BITLY_GOES_HERE#${bitly}#" \
| sed 's/QR_CODE_TOP/450/' | sed 's/QR_CODE_LEFT/790/' \
> tmp/friday.html.tmp
perl -ne 's#CONTENT_GOES_HERE#`cat tmp/friday.inc`#e;print' tmp/friday.html.tmp > out/friday.html 

../sched.pl < scheduleSource/2014saturday.tab > tmp/saturday.inc
cat ../template.html \
| sed 's/DAY_GOES_HERE/Saturday, October 4/g' \
| sed "s#BITLY_GOES_HERE#${bitly}#" \
| sed 's/QR_CODE_TOP/450/' | sed 's/QR_CODE_LEFT/790/' \
> tmp/saturday.html.tmp
perl -ne 's#CONTENT_GOES_HERE#`cat tmp/saturday.inc`#e;print' tmp/saturday.html.tmp > out/saturday.html

../sched.pl < scheduleSource/2014sunday.tab > tmp/sunday.inc
cat ../template.html \
| sed 's/DAY_GOES_HERE/Sunday, October 5/g' \
| sed "s#BITLY_GOES_HERE#${bitly}#" \
| sed 's/QR_CODE_TOP/450/' | sed 's/QR_CODE_LEFT/940/' \
> tmp/sunday.html.tmp
perl -ne 's#CONTENT_GOES_HERE#`cat tmp/sunday.inc`#e;print' tmp/sunday.html.tmp > out/sunday.html

rm -rf tmp/
