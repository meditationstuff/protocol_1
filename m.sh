#!/bin/bash

#"make" the document from *.md to a single index.html

# run as so:
# ./m.sh

./pandoc -f commonmark+autolink_bare_uris index.md auxiliary_names.md auxiliary.md appendix_p1_en-US.md w_culture.md subtle_interaction.md larp_death.md long_covid_jhana.md larp_health.md footer.md -o intermediate.html

cat header.html intermediate.html > index.html

rm ./intermediate.html
