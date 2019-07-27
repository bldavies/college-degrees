# College Degrees in the US

This repository contains the source data for my [first](http://bldavies.com/blog/college-degrees-demographics/), [second](http://bldavies.com/blog/college-degrees-similarity-measures/) and [third](http://bldavies.com/blog/college-degrees-community-detection/) blog posts on college degrees in the US.

## Data

I derive `data/observations.csv` from the [2016 ACS PUMS](https://census.gov/programs-surveys/acs/data/pums.html) data by running `code/observations.do` in [Stata MP/15](https://www.stata.com/statamp/).
The data dictionary for `data/observations.csv` is as follows.

Variable | Type |Description
:--- |:--- |:---
`age` | int | Age of respondent at survey date
`female` | int | Binary indicator for whether respondent is female
`level` | int | Educational attainment level ID as in `data/attainment.csv`
`field1`, `field2` | int | Degree field IDs as in `data/fields.csv`
`weight` | dbl | Aggregated sample weight

I create `data/attainment.csv` and `data/fields.csv` manually based on the [PUMS data dictionary](https://www2.census.gov/programs-surveys/acs/tech_docs/pums/data_dict/PUMSDataDict16.txt).

## License

All repository content is licensed under the [MIT license](https://github.com/bldavies/college-degrees/blob/master/LICENSE).
