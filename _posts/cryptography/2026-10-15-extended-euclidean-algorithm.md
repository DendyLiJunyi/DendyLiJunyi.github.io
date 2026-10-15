---
title: Extended Euclidean Algorithm
date: 2026-10-15 00:00:00 +0800
categories: [Cryptography]
tags: [number-theory, euclidean-algorithm, modular-inverse]
math: true
---

The Euclidean Algorithm offers us a recursive way to find the greatest common divisor of two given numbers.

This algorithm also provides a sequence of intermediate computations.

Let us examine this sequence.
Suppose Euclidean algorithm terminates at step $k$, with $r_{k+1} = 0$.

At step $k - 1$ we must have:

$$
r_{k-2} = r_{k-1} \cdot q_{k-2} + \gcd(x, y)
$$

where $r_{k-2}, r_{k-1}$ can themselves be expressed in terms of $r_{k-3}, r_{k-2}, \ldots r_{1}, r_{0}$.
All the $q_{i}$ are also known.

So we have the following Bezout identity:

There exist integers $u$ and $v$ such that, $u \cdot x + v \cdot y = \gcd(x, y)$

There's also one special case that is $\gcd(x, y) = 1$, i.e. $x$ and $y$ coprime.

When $x$ and $y$ are coprime, Bezout's identity gives us $u \cdot x + v \cdot y = 1$.
Therefore, $u \cdot x \equiv 1 \pmod{y}$, so $u$ is a modular inverse of $x$ modulo $y$.

One question arises - how can we turn this substitution process into an algorithm?

To answer this question we need our earlier observation.

At step $k - 1$ we have:

$$
r_{k-2} = r_{k-1} \cdot q_{k-2} + \gcd(x, y)
$$

which is 

$$
r_{k-2} = r_{k-1} \cdot q_{k-2} + 1
$$

in this case.

We know this is a recursive process and the final goal we want to reach is a value of $u$ satisfying $u \cdot x \equiv 1 \pmod{y}$.

notice that $r_{k-2} - r_{k-1} \cdot q_{k-2} = 1$ implies $r_{k-2} - r_{k-1} \cdot q_{k-2} \equiv 1 \pmod{y}$ thus $r_{k-2} - r_{k-1} \cdot q_{k-2} \equiv u \cdot x \pmod{y}$.

But this doesn't give us enough information to compute $u$, because we have:

$$
r_{k-2} - r_{k-1} \cdot q_{k-2} = u \cdot x + v \cdot y
$$

for some unknown integer $v$.

It's still hard for us to determine the value of $u$ from the equation above.

We may notice that generally we don't have $r_{i-2} - r_{i-1} \cdot q_{i-2} \equiv u \cdot x \pmod{y}$.

We need to define $u$ recursively.

Notice that $r_{k} \equiv u \cdot x \pmod{y}$, let $p_{k} = u$.

We need to show that, for each index $i$, we have $r_{i} \equiv p_{i} \cdot x \pmod{y}$.

We look at the bezout equality:

$$
u \cdot x + v \cdot y = 1
$$

multiply both sides by $r_{i}$ we obtain:

$$
u \cdot x \cdot r_{i} + v \cdot y \cdot r_{i} = r_{i}
$$

Reducing both sides modulo $y$, we obtain:

$$
u \cdot r_{i} \cdot x \equiv r_{i} \pmod{y}
$$

so $p_{i} = u \cdot r_{i}$.

Next we can take a look at the equavalence:

$$
r_{k-2} - r_{k-1} \cdot q_{k-2} \equiv u \cdot x \pmod{y},
$$

after substitution we have:

$$
p_{k-2} \cdot x - p_{k-1} \cdot x \cdot q_{k-2} \equiv p_{k} \cdot x \pmod{y},
$$

which simplifies to :

$$
(p_{k} - p_{k-2} + p_{k-1} \cdot q_{k-2}) \cdot x \equiv 0 \pmod{y}.
$$

since $x$ and $y$ coprime, thus $p_{k} - p_{k-2} + p_{k-1} \cdot q_{k-2} \equiv 0 \pmod{y}$.

For convenient, let $p_{k}$ satisfies:

$$
p_{k} = p_{k-2} - p_{k-1} \cdot q_{k-2}
$$

We need to determine the initial values $p_{0}$ and $p_{1}$ from the inputs.

Thus we can implement extended euclidean algorithm recursively.

