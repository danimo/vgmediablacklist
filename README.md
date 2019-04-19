# VG Media Blacklist Generator

## Purpose

This script creates a text and a JSON representation of the [URLs of media
publisher represented by VG Media](https://www.vg-media.de/de/digitale-verlegerische-angebote/berechtigte-presseverleger.html), to e.g. serve as a blacklist.

If you operate a service that makes use of content in one of these
publications, you are required to get a license from VG Media. If you
do not wish or cannot affort to do so, you can use a blacklist to avoid
accidential aggregation of these online publications.

Note that this repository does not provide the actual blacklist, as the author
is not able to vouch for its completeness, as new URLs may be added at any time
and the upstream format is not well defined and may change at any time.

The only change to the data has been do remove the scheme (http vs. https) as
it is not relevant to domain pattern matching and may lead to false negatives
(most publications on that list redirect to https, even though listed as http).

The tools required to run this script are awk, bash, curl, sed and xmllint. They
should be available on Linux, FreeBSD and Mac OS. However, the tool has currently
only been tested on Linux.

# Usage

Running

```
   ./fetchblacklist.sh
```

will create two files: ``blacklist.txt`` and ``blacklist.json``.

# Limits and Disclaimers

This tool is meant to assist in dealing with claims by members of VG Media under
the German "Leistungsschutzrecht für Presseverleger" (§§ 87f bis 87h UrhG).
It does not substitute legal council on the matter.

Also, it does not reflect any consequences of the new European Copyright
Directive, specifically Article 15 (formally known as Article 11), as they are
subject to implementation into local law and it is currently unknown wether VG
Media will represent media organizations from other EU member states going forward.

# Issues and Enhancements

If you find any problems while operating this script, please file an
[issue](https://github.com/danimo/vgmediablacklist/issues).
Better yet, create a fix and submit a [pull request](https://github.com/danimo/vgmediablacklist/pulls).
