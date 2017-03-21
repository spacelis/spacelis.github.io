+++
title = "Thoughts on data protection: Hashing! Hashing! Hashing"
Description = ""
Tags = [
  "Data",
  "Cryptography",
]
draft = true
Categories = [
  "Pounder"
]
# menu = "main"
date = "2017-03-13T10:49:31Z"

+++

Riddles, secrets exchanging, encryption and so on are always fascinating to fiddle with.
Modern cryptography is based on mathematic theories which guarantees the hardness of breaking.
This means circumventing a cryptographic algorithm is about the same as tackling a corresponding hard mathematic problem.
These building blocks can then be used to design communication protocols enabling secure way of sharing sensitive data.

Sometimes giving out the whole data set may be too _generous_ in the way that you have no control on what information your _collaborators_ extract from the data.
You may want to limit your data to a certain type of use or limit the operations that can be applied to the data.
This poses a problem of **information exposure control**.

It is a very big topic and can not be addressed in this blog.
Here only provides one angle towards solving the problem.
Let's consider a scenario that we want to share some data with our collaborators, allowing them to join their data with ours.
We can model the data as a lookup table, that is a set of key-value pairs.
However, we do not want them to discover keys other than the ones they already have for joining.
That is, they can only exgtract the values if they already have the key.
You may also want to limit their lookup speed to make sure they would not have an quick scan though the data.
How can we assure it?

I am sure there must be similar things having popped up before and may already been put into practice.
It would be much appreciated if I can be pointed to some resources.

Preliminary Solutions
---------------------

Here is my thoughts on it.
To start, we need to clarify the goals.

 1. _Discovering the key set_: Attackers can recover the keys from the processed data with no external resources.
 2. _Lookup speed limits_: Attackers are not being able to do lookup faster than we processing the data given the same computation power.

The second goal can be strengthened to that attackers' machine can be a finite times faster than ours and we can still make sure they are not able to lookup faster than the speed of processing the data.

Now let's review how a data set of key-value pairs would be used.
Users will query the data with a known key and may (not) find a match in the data as well as its associated value.
That is they present a piece of information, and the data give them another piece of information matching theirs.
Note that they have the first piece of information and they find it outside the data.
This means we do not need to provide a data sets with the actual keys since they already have it.
But we still need to keep the capability of matching keys.
That is, we allow them to find a match but they can not know whether we have a key unless they know the key already.
Sounds familiar?
Yes, this has already been done in password protection, hashing.

### Hashing

Hashing has been widely used in password protection against database dump.
The basic idea is to convert the plain text password into a sequence of bytes and the process can not inverse.
That is given a $x$ it is easy to compute $y=f_h(x)$, but given a $y$ it is very hard to find $x$ and the best way may be random guess $x$ and verify whether it can produce the $y$.
Hashing functions make it possible for a system to verify whether a password is valid without store the actual password.
(Note: One should always use hashing function with salt when design a system dealing with passwords.
  Keep reading if you wonder what salt is.)

This is also what we want in the aforementioned problem, matching without storing the original keys.
Thus, we process our data with all the keys being replaced by its hash.
$$ (k, v) \Rightarrow (f_h(k), v) $$
Users are required to do the same to their keys before finding a match in the processed data.
Hence, the processed data can handle matching without storing the actual things!

With this processed data $(f_h(k), v)$, users can perform their query as they have the original data.
For example, they can find a $v$ by a $k$, or join their list of $k$s with the processed data.
All they need to do is to compute $f_h(k)$ first and this would not increate the computation complexity.

To strengthen the key, we can add salt to the hashing algorithm...
<!--  TODO: hashing many times and with salt -->

Now let's look at the second goal we want to achieve, _i.e._, limiting their speed of query.
I started by looking for an encrytion algorithm that having significant speed difference between encrypting and decrypting.
But later I realize such algorithm would be so reliable in limiting the speed, since algorithms are not designed to have a different speed and the difference is unlikely to be able to dialed to an arbitrary value.
Please leave a comment if you know any encryption algorithm that can do the job.

We may not find an algorithm to slow down the decryption, but we can slow down the description by making it harder for retrieve the decryption key.
Suppose we have a symmetric encryption algorithm that take a password $p$ to encrypt a piece of information $v$ to $g_e(v, p)$.
For each $v$ in the dataset, we choose a $p$ randomly from a fixed set of passwords, for example $[0, 255]$.
Then we apply encryption and throw away $p$ immediately after encrypting them.
Now a user of the processed dataset has to guess each $p$ to decrypt the information.
Since the password is garantteed in the fixed range, users will eventually find the password and decrypt the piece of information.
With this technique, we can dial the speed limit down by increase the size of password set, meanwhile make sure the processing speed unchanged.
That is, we can set a speed limit of accessing the data and this speed limit can be easily tuned.
Of course this is based on the assumption that users' computational power is similar to ours.
