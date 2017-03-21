+++
date = "2016-12-09T08:24:03Z"
title = "BakMan rules"
Tags = [
  "Tools",
  "Backup",
]
draft = "true"
Categories = [
  "Pounder",
]
# menu = "main"
Description = ""

+++

BakMan use a rule system to select a subset of the input files for certain processes.
However, the components of the language are kind of arbitrary towards the goal of my own needs.
This post tries to evaluate the completeness of the language currently available in BakMan.

Here I use a simple evaluation method.
The core function of the rule system is to select a subset of items from a given pool of items.
Any subset can be encode to a series of
