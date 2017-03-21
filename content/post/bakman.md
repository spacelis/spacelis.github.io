+++
Description = ""
date = "2016-11-02T22:17:59Z"
title = "BakMan: A file oriented backup management tool."
draft = false
Tags = [
  "Python",
  "Tools",
  "Backup"
]
Categories = [
  "Projects"
]

+++

If you ever had tons of backup files which quickly fill up all your disk space, this tool might be useful to you.
Bakman is a BAcKup MANagement tool for automatically tracing unneeded backup files and generating management scripts.
The core idea is to filtering backup files by a set of customizable rules.
The rule file will define which files in the piles should be removed or stashed somewhere else.


BakMan
======

This project was originate from my needs to manage the backup files of a website.
The website provides access to quite some datasets which took a lot of place to backup at daily frequency.
It triggered me to thing about the general way of dealing with backup files when the disk was incidently filled up and got the website down.
Therefore I have to delete some backup files to release disk space for running the website.
However, deleting all the backup files up to a certain date is kind of simple and effective way but you may loose the trace and may cause you in trouble if you are not frequently managing the website.
So it might be better to have a tool that allows you to use more complex logic for managing your backups.
For example, you may want to keep all the backups within 7 days and one per week within 3 months and one per month for those older than 3 months.
This logic will greatly reduce the number of backups you need to keep and still give you the ability of tracing the changes since the very beginning.
The downside is that I need to write the tool as I could not find a suitable ones on the Internet.
Maybe I am just curious about whether I can build one myself and there you go BakMan.


Script Generating VS action immediately
=======================================

BakMan accepts a rule file defining how the backup files should be separated, that is, those that need to be deal with and those that should be left untouched.
Based on the rules, BakMan will generate a script by feeding those that need to be dealt with into a template.
For example, if you use `rm -rf {0}`, then the script will try to remove all the unwanted backup files.
If you use `trash {0}`, then the script will put unwanted backup files in the trash can.
An alternative design could be carry out actions immediately without generating a script for user to run.
But making dangeous actions as default is never a good idea.
So giving users a chance to inspect the actual actions that are going to carry out will make sure they are not suprised.
Of course users can still automate the task by piping the output script to bash.
This little extra effort and the delibration asking users to think twice will reduce the chance of going to a disaster.
Similar design can be found every where from querying user when `rm` a file to requesting user to type repository name when deleting it on Github.
It also allows trial run with no harm to the system.


The Rule System
===============

The core of BakMan is the rule system, which make it a nice tool for complex backup retaining strategy.
The rule system is based on group-aware marking.
Simple as it is, it marks files based on its role in a group.
The group can be defined by a period of time, for example, a month or a week.
A role in a group can be the first one in the group or the last one.
The markings from different group can either be merged in a conjunction way or a disjunction way.

The rules are organized in a tree structure as different level of mark merging may be required.
In BakMan, the rule file can be written in YAML or JSON.
A parser will translate it into a tree structure of makers.
This marker will be applied to the files that need to be managed.


An Extensible Tool
==================
Along with developing the rule parser, quite some effort was put into the extensibility of the parsers.
The parser is integrated to the markers which a metaclass is created to allow implicit registering of new markers.
Following the pattern, one can easily create a new marker and it will automatically be integrated into the rule system.

Last Words
==========

This is a tool purely for my own interests.
I hope it can become useful for some of you.
Please let me know you if it helps you.
