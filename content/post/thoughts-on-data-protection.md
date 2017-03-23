+++
title = "Thoughts on data protection: Hashing! Hashing! Hashing"
Description = ""
Tags = [
  "Data",
  "Cryptography",
]
draft = false
Categories = [
  "Pounder"
]
# menu = "main"
date = "2017-03-13T10:49:31Z"

+++

Riddles, secrets exchanging, encryption and so on are always fascinating to fiddle with.
Modern cryptography is based on mathematical theories which guarantees the hardness of breaking.
This means circumventing a cryptographic algorithm is about the same as tackling a corresponding hard mathematical problem.
These building blocks can then be used to design communication protocols enabling secure way of sharing sensitive data.

Sometimes giving out the whole data set may be too _generous_ in the sense that you have no control on what information your _collaborators_ would extract from the data.
You may want to limit your data to a certain type of use or limit the operations that can be applied to the data.
This poses a problem of **information exposure controlling**.

It is a very big topic and can not be fully addressed in this blog.
Here only provides one angle approaching the problem.
Let's consider a scenario that we want to share some data with our collaborators, allowing them to join their data with ours.
We can model the data as a lookup table, that is, a set of key-value pairs.
However, we do not want them to discover keys from our data other than the ones they already have for joining.
That is, they can **only** extract the values if they already have the key.
We may also want to limit their lookup speed to make sure they would not have an quick scan through the data.
How can we make sure of it?

**Note**: Similar things must have been popped up before and may already been put into practice.
It would be much appreciated if I can be pointed to some resources.
Here is my thoughts on it.

An Approach
-----------

To start, we need to clarify the goals.

 1. _Discovering the key set_: Attackers can recover the keys from the data with no external resources.
 2. _Lookup speed limits_: Attackers are not being able to do lookup faster than we processing the data given the same computation power.

The second goal can be strengthened to that attackers' machine can be a finite times faster than ours and we can still make sure they are not able to lookup faster than the speed of processing the data.

Now let's review how a data set of key-value pairs is used.
Users will query the data with a known key and may (not) find a match in the data as well as its associated value.
That is they present a piece of information, and the data give them another piece of information matching theirs.
Note that they have the first piece of information and they find it outside the data.
This means we do not need to provide the data sets with the actual keys since they already have it.
But we still need to keep its capability of matching keys.
That is, we allow them to find a match but they can not know whether the data have a key unless they know the key already.
Sounds familiar?
Yes, hashed password!

Hashing
-------

Hashing has been widely used in password protection against database dumping.
The basic idea is to convert the plain text password into a sequence of bytes and the process can not inverse.
Given $x$, it is easy to compute $y=f_h(x)$, but given $y$ it is very hard to find $x$ and the best way may be random guess $x$ and verify whether it can produce the $y$ via the hashing function $f_h$.
Hashing functions make it possible for a system to verify whether a password is valid without store the actual password.
(Note: One should always use hashing function with salt when design a system dealing with passwords. Check [Wiki Page][1])

Hashing Key Set
--------------

This is what we want in the aforementioned problem, matching without storing the original keys.
Thus, we process our data by replacing all the keys with their hash values.
$$ (k, v) \Rightarrow (f_h(k), v) $$
When users query the data, they are required to do the same to their keys before finding a match in the processed data.
Hence, the processed data can handle matching without storing the actual things!

With this processed data $(f_h(k), v)$, users can perform their query as they have the original data.
For example, they can find a $v$ by a $k$, or join their list of $k$s with the data.
All they need to do is to compute $f_h(k)$ first and this would only increase the computation time a little bit.

Hashing can prevent attackers to obtain the original keys by only looking at its hash value.
But attackers can still get help from big dictionaries, containing possible sequences of characters along with their hashing values.
They can look up the hash values from the target data in the dictionary and the matched ones will tell them what the original key is for those hash values.
To strengthen the protection, we need to use different hashing functions for our keys in one data set.
An easy way of doing that is to add random salt to the keys before hashing: $f_{sh}(k) = f_h(ks)$, where $ks$ means concatenating $k$ with $s$.
Every hash value is then produced by a unique hash function.
Thus a dictionary attack is nearly impossible.
Of course, the uniqueness of hash functions depends on how the salt is generated.


Retrial Speed Limit
-------------------

Now let's look at the second goal we want to achieve, _i.e._, limiting the speed of query.
I started by looking for an encryption algorithm that having significant speed difference between encrypting and decrypting.
But later I realized that such algorithms would not be so reliable in limiting the speed, since algorithms are not designed to have a different speed and the difference is unlikely to be adjustable easily.
Please leave a comment if you know any encryption algorithm that can do the job.

We may not find an algorithm to slow down the decryption, but we can slow down the description by making it harder for retrieve the decryption key.
Suppose we have a symmetric encryption algorithm that take a password $p$ to encrypt a piece of information $v$ to $g_e(v, p)$.
For each $v$ in the dataset, we choose a $p$ randomly from a fixed set of passwords, for example $[0, 255]$.
Then we apply encryption and throw away $p$ immediately after encrypting them.
Now a user of the data has to guess each $p$ to decrypt the piece of information $g_e(v, p)$.
Since the password is guaranteed in the fixed range, users will eventually find the password and decrypt the piece of information via, for example, random guess.
With this technique, we can dial the speed limit down by increase the size of password set and it would not increase the processing speed.
Of course this is based on the assumption that users' computational power is similar to ours.

We can further slow down the decrypting process by generating passwords from random numbers via hashing.
Given a random number $e$, we generate the password by $$p = \underbrace{\mathrm{hash}( \mathrm{hash}(... \mathrm{hash}}_{n} (e)...)).$$
This gives us a strong password and slow down the retrieval speed even further.

Summary
-------

Information Exposure Controlling is useful in the way that the owner of the data can make sure their data is used in a proper way.
Hashing functions can be used in different part of the problem.
This is just a showcase of the problem and what we can do about it.
Let me know if you have any thoughts on it.

[1]: https://en.wikipedia.org/wiki/Salt_(cryptography)
