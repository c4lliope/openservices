# Open Services

A public index of structured social service data
collected from sources including:

- San Francisco Reentry Council
- San Francisco Homeless Advocacy Project
- St. Anthony's of San Francisco

This data set is inspired by and has grown out of
https://github.com/sfbrigade/sf-openreferral.

# Usage Guidelines

## Importing Data

1. Add data sources to the `sources` directory,
nested under a keyword that describes the source of the data.

For example, data from SF's Adult Probation Department
could be stored in `sources/apd`.
The keyword you choose does not matter,
but it does matter that you stay consistent about the keyword you use
in the following steps.

2. create import scripts in the `lib/import/keyword` directory,
re-using the keyword that you chose in step 1.

For the `apd` data set,
the import script should live inside `lib/import/apd/`,
and preferably be named along the lines of `import.rb`, `import.py`, etc.

3. Run the import script.

The import script should take the raw data stored in `sources`,
and should output structured yaml into the `organizations` directory
according to the schema.

## Maintaining Data

As the schema evolves,
write scripts to transform the data to keep up with the schema.

Store these scripts in the `transforms` directory,
and name them according to the version of the schema
that they transform the data into.

For example, a script that transforms data from version `0.9.8` to `0.10.0`
should be named `transform_0_10_0.rb`.

It is assumed that at the time a transform script is run,
that all organization files will be the same version.
The prerequisite version for a script
is determined by the name of the script immediately proceeding it,
in [semantic versioning] order.

[semantic versioning]: http://semver.org/

If an organization's data is not up to date with the latest schema version,
there will be a linear path to upgrade the data
by running transform scripts in consecutive order
from the current version of the data
to the current version of the schema.
