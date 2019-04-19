#!/bin/bash
#
# Extracts URLs belonging to VG Media online publications
# Output formats will be plain text and JSON
#
# (C) 2019 Daniel Molkentin <daniel@molkentin.de>
# This script is provided under the CC0 license.

url='https://www.vg-media.de/de/digitale-verlegerische-angebote/berechtigte-presseverleger.html'
xpath='//div[@class="liSendeunternehmenNEW"]/ol/li/a/@title'

blacklisttxt='blacklist.txt'
blacklistjson='blacklist.json'

curl="$(command -v curl)"
xmllint="$(command -v xmllint)"

if [ -z "$curl" ]; then    echo Please install curl!; exit; fi
if [ -z "$xmllint" ]; then echo Please install xmllint!; exit; fi

$curl -s $url \
     | $xmllint -html  --xpath "$xpath" - 2>/dev/null \
     | sed -E 's# title="([^"]*)"#\1\n#g' \
     > "$blacklisttxt"

echo "$blacklisttxt" generated

(
  printf "[\n"
  awk < $blacklisttxt 'NR > 1 { printf(",\n") } { printf("  \"%s\"", $1) }'
  printf "\n]\n"
) > "$blacklistjson"

echo "$blacklistjson" generated
