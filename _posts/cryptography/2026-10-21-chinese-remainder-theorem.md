---
title: Chinese Remainder Theorem
description: Using Bézout's identity $m_1 n_1 + m_2 n_2 = 1$ to construct a solution of $x \equiv a_i \pmod{n_i}$ when the moduli $n_i$ are pairwise coprime.
date: 2026-10-21 00:00:00 +0800
categories: [Cryptography]
tags: [number-theory, chinese-remainder-theorem, bezout-identity]
math: true
---

Currently I'm taking a look at CryptoHack, and accidentally found that some mathematical concepts I've encountered became useful methods in the crypto world.

I think I should write down something to help me get familiar with those concepts.

In this article we'll review the Chinese remainder theorem.

The statement of the theorem is as follows:

If the $n_i$'s ($i = 1, \ldots, k$) are pairwise coprime, and if the $a_i$'s are integers such that $0 \le a_i < n_i$ for every $i$, then there is one and only one integer $x$ such that $0 \le x < N$ and the remainder of the Euclidean division of $x$ by $n_i$ is $a_i$ for every $i$, where

$$
N = n_1 n_2 \cdots n_k.
$$

We are not discussing the uniqueness part here. This doesn't mean the uniqueness part is not important. We are focusing on the existence part because it gives us the ability to construct $x$ with a given algorithm.

We might look at a simple case first.

$$
\begin{aligned}
x &\equiv a_1 \pmod{n_1} \\
x &\equiv a_2 \pmod{n_2}
\end{aligned}
$$

We want to find $a$ such that $x \equiv a \pmod N$, where $N = n_1 n_2$.

Since $n_1$ and $n_2$ are coprime, by Bézout's identity there exist $m_1$ and $m_2$ such that:

$$
m_1 n_1 + m_2 n_2 = 1.
$$

How can this help us?

Notice that $m_1 n_1 + m_2 n_2 = 1$ is extremely useful because of the following:

$$
\begin{aligned}
m_1 n_1 + m_2 n_2 &\equiv 1 \pmod{n_1} \\
m_1 n_1 + m_2 n_2 &\equiv 1 \pmod{n_2}
\end{aligned}
$$

Since $m_1 n_1 \equiv 0 \pmod{n_1}$ and $m_2 n_2 \equiv 0 \pmod{n_2}$, this means

$$
\begin{aligned}
m_2 n_2 &\equiv 1 \pmod{n_1}, & m_1 n_1 &\equiv 0 \pmod{n_1}, \\
m_1 n_1 &\equiv 1 \pmod{n_2}, & m_2 n_2 &\equiv 0 \pmod{n_2}.
\end{aligned}
$$

So $m_2 n_2$ behaves like $1$ modulo $n_1$ and like $0$ modulo $n_2$, and $m_1 n_1$ does the opposite.

This will give us a candidate for $x$:

$$
x = a_2 m_1 n_1 + a_1 m_2 n_2
$$

One can verify that $x$ satisfies the conditions:

$$
\begin{aligned}
x &\equiv a_2 \cdot 0 + a_1 \cdot 1 \equiv a_1 \pmod{n_1}, \\
x &\equiv a_2 \cdot 1 + a_1 \cdot 0 \equiv a_2 \pmod{n_2}.
\end{aligned}
$$

Then the remainder $a$ is $x \bmod N$, which also satisfies both congruences, since $n_1$ and $n_2$ both divide $N$.

Repeating the construction, we then have the construction of such an $x$ for any $k$.
Write $x_{12}$ for the solution of the first two congruences.
Every integer $y$ with $y \equiv x_{12} \pmod{n_1 n_2}$ satisfies both of them, so it is enough to solve

$$
\begin{aligned}
y &\equiv x_{12} \pmod{n_1 n_2} \\
y &\equiv a_3 \pmod{n_3}
\end{aligned}
$$

which is again the simple case, because $n_1 n_2$ and $n_3$ are coprime (neither $n_1$ nor $n_2$ shares a prime factor with $n_3$).
Continuing in this way with $n_4, \ldots, n_k$, we end up with an $x$ satisfying all $k$ congruences, and then we compute the remainder $a = x \bmod N$.
