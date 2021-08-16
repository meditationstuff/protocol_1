#!/bin/bash

#"make" the document from *.md to a single index.html

# run as so:
# ./m.sh

./pandoc -f commonmark+autolink_bare_uris header.md index.md auxiliary_names.md auxiliary.md appendix_p1_en-US.md footer.md -o index.html