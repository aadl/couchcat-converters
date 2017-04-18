# couchcat-converters

Supplemental scripts to convert formats into something that couchcat should ingest. This is to keep the couchcat commands cleaner for one-of licenses or for formats where PHP doesn't have good library support.

## Converters

- ONIX - Uses ruby onix library which seems more dependable than any php offering even if it hasn't been updated since 2012. Currently used for Wayne State Press so may need some work to make it more portable.
