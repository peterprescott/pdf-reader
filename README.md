# PDF-Reader

A project for [PrayerMate](https://www.prayermate.net/).

Using [PDF-Reader-Turtletext](https://github.com/tardate/pdf-reader-turtletext) to convert Open Doors' [monthly PDF Prayer Calendar](examplePDF.pdf) to [simple text](example_text.txt).

## 28 Oct.
I've been trying to use PDF-Reader-Turtletext to get the x-coordinates for where each column begins, so that the text can be extracted column by column. Getting the x-coordinates seems to work, but extracting the text doesn't -- mostly all you seem to get are rows of question marks. 

PDF-Reader on its own however seems to be able to extract the text fine. (Is this because ...Turtletext is dependent on an obsolete version of PDF-Reader? v.1.1.1).

Anyway, instead of using coordinates, I've just cut the page into columns by slicing each line at 65-character intervals. That seems to work, though perhaps it could be tidied up a little.
