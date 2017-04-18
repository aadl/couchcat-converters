## JSON Format for Couchcat

### Expected fields

| Field Name  | Type   | Use                                                         |
|-------------|:------:|-------------------------------------------------------------|
| id          | string | record id for couch and filenames                           |
| isbns       | array  | array of isbn strings if applicable                         |
| bisac       | array  | array of bisac codes (not literals) if applicable           |
| title       | string | title of work                                               |
| author      | string | main author of work                                         |
| addl_authors| array  | array of authors. can be in place of or addition to author  |
| pub_year    | string | year work was published                                     |
| series      | array  | array of series titles                                      |
| overview    | string | description of work                                         |
