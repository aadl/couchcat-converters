# couchcat-converters

Supplemental scripts to convert vendor metadata formats into something that couchcat should ingest. The main purpose of this is to keep couchcat from getting bogged down with vendor specific formats and quirks.

Code may be PHP, ruby or other depending on what libraries are available for the format.

## Converters

- ONIX - Uses ruby onix library which seems more dependable than any php offering even if it hasn't been updated since 2012. Currently used for Wayne State Press so may need some work to make it more portable.
