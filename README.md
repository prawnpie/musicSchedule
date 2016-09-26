musicSchedule
=============

sed for converting `<LI>1:00pm <A HREF='#' onClick='return art_popup("MIWI_LA_LUPA");'>MiWi La Lupa</A><BR>` into tab delimited, still need to convert pm to +12 hours.
```
pbpaste | sed "s|^<LI>\(.*\) <A HREF='#' onClick='return art_popup(\".*\");'>\(.*\)</A><BR>$|   \1              \2|" | sed 's/&/&amp;/g' | sed 's/[ap]m /       /'
```
