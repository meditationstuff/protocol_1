# style guide scratch

## main.txt prose sections:

### general notes

* the goal is to preserve “canonicity”/readability of the unrendered plain text. some concessions will need to be made for escaped characters and “unworkable hardcoded formatting”
* if any deviations from the below might save a lot of finicky/fiddly time, or seem more sane, at least in some places, please let me know

### typos and formatting

* *do* *not* fix typos
* light formatting consistency fixes are ok

### sectioning

* any entry found in the full table of contents should have “### ” added to its section header in the body
* not all lines that end with a colon are section headers. only section headers should have “### ” added to the front of the line, as in the preceding bullet

### subsectioning
* any “dinkus” of either three asterisks “***” or one asterisk “*” should be escaped to be sure it appears as-is

### paragraphs

* paragraphing (blank lines) can generally be left completely as-is—lots of sections may need no changes at all
* multiline line breaks (e.g. two or three empty lines between paragraphs) do not have to be specially formatted, but leave these as-is
* take care that line breaks with no empty intervening line are preserved (“compact paragraphing”), by using two spaces at the end of the line

### quote blocks and nested quote blocks

* take care that quote blocks “>” and ESPECIALLY NESTED quote blocks “> >“[???] render properly
* “>>>” and “<<<” should be escaped if necessary for rending and preserved

### dialogues and verbatim pasting (e.g. from a chat window)

* dialogue clarity may need to be preserved with light use of intensifiers or slightly changed use of empty lines
* “compact verbatim pasting” (i.e. no empty lines or paragraphing, or handles right above message text, with no empty line) should be preserved by adding two spaces at the end of each line; care should be taken that any “one-line block quoting” is either escaped or renders properly

### lists

* lists that have items separated with empty lines (“normal paragraphing”) should be left unchanged (all other lists are “compact lists”)
* indented compact lists should be converted to “indented asterisk lists”
* flat compact lists should use a double space, at the end of the line, for a hard return (except for the last item, generally, i think)
* compact lists that are bulleted with “(*)” or “(#)” should be changed to “indented asterisk lists”
* compact lists that have a mix of numbers and “(*)” should be changed to numbered list
* compact lists that are already asterisk delimited can be left unchanged so as to render as per usual

### intensifiers

* word emphases/intensifiers “*”, “**“, “***” should generally be left as-is

### escaping

* footnotes that make use of asterisks should be escaped, to preserve the asterisk
* pointers to footnotes that are somehow confused for intensifiers should be escaped
* idiosyncratic use of strings of characters should be preserved with escaping, if necessary. please look up all markdown characters that need to be escaped. if this looks like it might become tedious or excessive, please contact me immediately, and we can decide what should be done.

## main.txt p1, p2, etc. sections and many protocol sections, etc.

* more extensive structure-preserving reformatting, with some editor discretion will be needed. can see older partial markdown-ification for inspiration. 

## auxiliary.txt:

* possibly leave as-is

## auxiliary_names.txt:

* possibly automatedly add two spaces to the end of each line

## appendix_p1_en-US.txt

* anything not “listified” should just be first-pass listified

## institutions.txt

* leave untouched for now

## teaching.txt

* leave untouched for now

## partial alternative reference versions

* https://raw.githubusercontent.com/rothos/protocol_1/gh-pages/index.md
* https://github.com/rothos/protocol_1/blob/gh-pages/index.md