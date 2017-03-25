+++
title = "Hello World From Me"
draft = false
date = "2016-10-27T22:38:35+01:00"
Tags = [
  "Scala",
  "Python",
  "Docker"
]
Categories = [
  "General"
]
description = "A brief history of myself..."
+++

I am fascinated in many things, like programming, physics, mathematics, music.
These all have intrinsic patterns that render the beauty of the master piece.
I really enjoy finding the patterns whenever possible.
<!--more-->

Hello From My Childhood
-----------------------

In my youth time, I am impressed by the huge numbers about stars and the universe.
Everything is so big, totally out of imagination.
I am more impressed that even things of that big can be described in a small little book.
A few statement can make a big prediction on how the stars and the universe would go and evolve.
I can not stop reading and thinking about the mechanisms behind them.

Later, my interests into the universe generally applied to physics when I was in school.
It describes things and makes predictions of their transiting between states.
I started to like learning the details of a how and why rather than accepting it can work.
Learning physics give me accurate thinking.
Though I admit, there is always a point to stop asking why as the beyond is an imaginary world.
That is my very preliminary taste of philosophy.

Hello to Programming
--------------------

Describing things precisely and controlling things is more fun.
That was the start of my programming life.
I write my first BASIC program to move icons around.
The crappy machine I used made me very frustrated because it can not run a program longer than the screen.
Until later I found I could make it work if I consequently input the code without editing back.
My serious programming life started when I chose computer science as my major in the university.
Though I sat through a lot of courses, I think reading and coding myself taught me much more.
Of course, the lectures would give more systematic reviews of the topics, where you learn about alternatives.

I love programming in general, because you can make things happen with your finger tips.
That is not the whole story.
I think I love programming is because it describe how things work in a very subtle way, as you cannot skip steps in describing a thing or an algorithm.
You have to make sure every details right for a piece of code work and you can hardly cheat on that.
Of course, programming languages and tools hide a lot details to make sure your are not bored with those details.
But I believe if you program for some time, you will eventually learn the details as it determines the behaviours of the thing you make.

I started programming with Pascal/Delphi.
I went to programming contests and learn to write basic algorithms in Pascal, as it was one of the designated language for contests at the time.
Following that, I learned Delphi when I tried to program on Windows machines.
I don't think I formally learned C/C++, but I enjoy reading [_The Design and Evolution of C++_](http://www.stroustrup.com/dne.html) by _Bjarne Stroustrup_.
It taught me a lot about how a programming language becomes that way and what actually happen when we write code in OOP.
Java is a language I put quite some time into.
Programming a website with JSP is quite interesting experience.
A complex system with different technology combining together is really a challenge.
Every click on a web page involves a lot of parts moving co-ordinately.
Query information from Javascripts, getting requests handled in logic written in Java, retrieving information from databases in SQL, rendering pages in JSP and so on can make a bug buried deeply in the stack.
The only universal general debugger is _print_.

Hello to Python World
---------------------

I learned Python when it started to prevail.
The simplicity made me feel like sitting in breeze.
The forced indentation in the code was really broaden of my mind in how a programming language can help you build a good habit.
Python then became my major language during my PhD.
I ran Python programs on my laptop, on the server and make them scale.
Jupyter (a.k.a IPython Notebook) is my friend which I need when I want to explore some data and plot them.
Some of my favourite packages include but limit to Matplotlib, Pandas, Numpy, Seaborn, Requests, Click.
I also did some personal exploring project like [lispy](https://github.com/spacelis/lispy) in which I tried to pounder how a lisp program can be built from Python.
Anther one is [lazylist](https://github.com/spacelis/lazylist) which is my trial implementation of infinite list which lazy evaluation in Python.
These projects are not meant to become ones at production level.
They were purely from my curiosity into what a programming language really is.
Turning completeness is great, it can not promise a programming language's expressiveness.
But you can get the feeling of the good and the evil parts of a programming language when you implement some interesting constructs with them.

Hello to Scala
--------------

I am also interested in Scala.
The interests begins when I want to learn some function programming.
I know about Haskell because of my colleague as well as Scala.
The courses on Coursera really inspired me to think about _descriptions_ instead of _commands_.
Scala also has powerful type system and can let you program without much burden in boilerplates.
Many syntactic surges may the code more readable and implicit conversion is really a save of many simple type casting.
Mintsearch is one interesting project built with Scala.
It extensibility can only be that easy with Scala's traits.
Though I believe Python can do similar things as easy as Scala, it can not give you type checking and all other benefit from it.

Hello to a production project
---------------------------

CDRC Data website is my first production project which is a data portal providing information and downloads of the data we hold in CDRC.
It is based on the open data portal platform called [CKAN](http://ckan.org).
It provides a very extensible plugin system.
So I can avoid much of direct editing its codebase and put all functionality in a plugin called _ckanext-cdrc_.
However, it is still difficult if one wants to change behaviours of some deep parts.
For example, we need a two-stage reviewing procedure for data sets when they come into the website.

Deploying is also another challenging task, as the website relies on several components including a uwsgi running CKAN with plugins, a Solr server for indexing and searching, a PostgreSQL Database for persistence, another uwsgi running datapusher, a nginx for reverseproxy, a memcached for caching SQL queries results.
Making sure all these co-operate with each other is complex, especially when initializing them or updating the code.
Docker is really a nice tool to put things together, I mean, literally.
Contrast to the recommendation of keeping containers small, fat images can help you press all complex configurations into a single vinyl that plays well every where.

Developing a production project is really a balance walk and many decisions have to evaluate and re-evaluate during the process.

Finale
-------------------

I am enthusiasm about programming and believe programming can guide me to understand how the world really works.


**_Science is what we understand well enough to explain to a computer. -- D. Knuth_**
