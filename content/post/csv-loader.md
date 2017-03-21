+++
Description = ""
Tags = [
  "Python",
  "Tools"
]
Categories = [
  "Projects",
]
# menu = "main"
date = "2016-12-09T09:02:19Z"
title = "CSV-Loader"
draft = false
+++

My work requires me importing a variety tables from CSV to DBMS.
However, importing CSV is not always an easy and documentable task, as every DBMS has its own way of doing the job.
There are different tools, be it GUI or CUI, that can help the process but there lacks a tool generally available for the task.
I needed a tool for importing CSV tables and I took this opportunity to make a general tool.

CSV-Loader
==========

CSV-Loader uses SQLAlchemy for generalize the DB operating and messytables for schema detecting.
The tool is composed of several commands, one is for generating schemas from arbitrary CSV files.
Another is for uploading the data according to the schema generated.
The third is for building single column indices for all columns on a table.

Schema As Documentation
=======================

The schema generated from the CSV is an intermediate step for importing the CSV files.
It gives users a chance to review the schema before importing millions of rows for a few hours.
Sometimes, simple data type conversion or transformation is needed during the importing.
Thus users can edit the schema file to integrate the conversion or transformation into the importing processes.
In these cases, the schema file can be archived for data documentation, so that when there is similar data required to be imported, the same processes can be reused to ensure the consistance.

Implementation Details
======================

For CSV-Loader, `messytables` is used for detecting the types and names of columns in a CSV file.
Accordingly, the schema is generated in pure Python module.
The schema generating tool will also try to convert column names into a format that will comply with the naming rules in the DB.
When column names are missing in the CSV file, users are required to edit the schema file to assign a name to each column.
Otherwise, the tool may fail importing data into the DB.
This will be improved in the future release.
For example, some random name will be generated to enable importing before naming.

Currently, enabled by `SQLAlchemy`, CSV-Loader supports four different RDBMS, that is, SQLite, MySQL, PostgreSQL, MSSQL.
Since only a small set of language is used in the importing process, a later version of CSV-Loader may integrate non-SQL DB importing.
Hopefull, it can help users that requires different DBMS in their data analysis.
