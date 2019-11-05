# PDF-Reader

A project for [PrayerMate](https://www.prayermate.net/).

Converting prayer letter PDFs to text *in the right order*.

I tried using PDF-Reader-Turtletext, and then just PDF-Reader.

But I have now discovered [Docsplit](https://documentcloud.github.io/docsplit/), which is able to read PDFs with surprising intelligence, perfectly clustering all the columns of text (on the two PDFs tried so far).  (And so long as you're able to install xpdf-utils or poppler-utils to your system and add pdftotext to your PATH.)

Leaving us with nothing to do but to find the turning point of the file and output a final rendition that starts at the beginning of the prayer month and ends at the end.

