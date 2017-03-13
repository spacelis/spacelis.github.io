+++
title = "Thoughts on data protection: Hashing! Hashing! Hashing"
Description = ""
Tags = [
  "Development",
  "golang",
]
draft = true
Categories = [
  "Development",
  "GoLang",
]
menu = "main"
date = "2017-03-13T10:49:31Z"

+++


Cryptographic hashing functions are very fascinating in the sense that they guarantee **one-way** computation.
That is, it is much harder to find _x_ for a given _y_ such that
