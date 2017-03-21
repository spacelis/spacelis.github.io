+++
Description = ""
Tags = [
  "Development",
  "Docker",
]
Categories = [
  "Development",
  "Docker",
]
# menu = "main"
date = "2017-03-20T01:58:52Z"
title = "Container Oriented or Image Oriented"

+++

However, my first attempt was not quite satisfactory.
I was too ambitious in building a system composed of several containers with each process in one container, as recommended in the community.
However, this makes initialization of components running in different containers very complex.
I put a lot of effort in making sure they are initialized in the right order, even using [consul]() for distribution configurations.
This did not work very well, especially when the hardware went down.
The lack of tools and knowledge of doing it in the right way frustrated me and make me going in a different direction.

I put a lot of attention to the containers in my previous attampt
