---
title: Finding Quadratic Residues and Their Square Roots with Fermat's Little Theorem
date: 2026-10-17 00:00:00 +0800
categories: [Cryptography]
tags: [number-theory, quadratic-residues, fermats-little-theorem, legendre-symbol]
math: true
---

Let's recall Fermat's little theorem: if $p$ is a prime number and $a$ is an integer with $a \not\equiv 0 \pmod p$, then

$$
a^{p-1} \equiv 1 \pmod p.
$$

In the CryptoHack challenge, we want to identify quadratic residues and find their square roots modulo a prime. A nonzero integer $a$ modulo $p$ is a quadratic residue if there exists an integer $x$ such that

$$
x^2 \equiv a \pmod p.
$$

For an odd prime $p$, the Legendre symbol helps us determine whether an integer is a quadratic residue modulo $p$:

$$
\left(\frac{a}{p}\right) =
\begin{cases}
0 & \text{if } a \equiv 0 \pmod p, \\
1 & \text{if } a \text{ is a nonzero quadratic residue modulo } p, \\
-1 & \text{if } a \text{ is a quadratic nonresidue modulo } p.
\end{cases}
$$

Euler's criterion gives us a way to calculate this symbol:

$$
\left(\frac{a}{p}\right) \equiv a^{(p-1)/2} \pmod p.
$$

This means we only need to compute $a^{(p-1)/2} \bmod p$ to check whether $a$ is a quadratic residue. We can use modular exponentiation, such as Python's `pow(a, (p - 1) // 2, p)`, instead of a long loop of repeated multiplications. A result of $1$ indicates a nonzero quadratic residue, while $p-1$ represents $-1$ and indicates a nonresidue.

Another convenient fact is that the prime in this problem satisfies

$$
p \equiv 3 \pmod 4.
$$

This gives us a simple formula for the square roots of a quadratic residue. Here's how it works.

Suppose we have checked that $\left(\frac{a}{p}\right)=1$, so $a$ is a nonzero quadratic residue. There exists an $x$ such that

$$
x^2 \equiv a \pmod p.
$$

Since $x \not\equiv 0 \pmod p$, Fermat's little theorem gives us

$$
x^{p-1} \equiv 1 \pmod p.
$$

Using $x^2 \equiv a \pmod p$, we have

$$
a^{(p-1)/2} \equiv (x^2)^{(p-1)/2} = x^{p-1} \equiv 1 \pmod p.
$$

Multiplying both sides by $a$, we get

$$
a^{(p-1)/2+1} = a^{(p+1)/2} \equiv a \pmod p.
$$

Because $p \equiv 3 \pmod 4$, the exponent $(p+1)/4$ is an integer. Therefore,

$$
\left(a^{(p+1)/4}\right)^2 = a^{(p+1)/2} \equiv a \pmod p.
$$

So one square root of $a$ is

$$
r \equiv a^{(p+1)/4} \pmod p,
$$

and the other is $-r$, since $(-r)^2=r^2$.

These roots are distinct because $p$ is odd and $a$ is nonzero modulo $p$. If $r=-r$ in $\mathbb{F}_p$, then $2r=0$. Since $2$ is invertible in this field, this would imply $r=0$, contradicting $r^2=a\ne 0$.

To see why there are no other roots, consider the polynomial ring $\mathbb{F}_p[X]$. Since $\mathbb{F}_p$ is a field, it has no zero divisors, and

$$
X^2-a=(X-r)(X+r).
$$

Any root $y$ must satisfy $(y-r)(y+r)=0$, so $y=r$ or $y=-r$. Thus, there are exactly two square roots of a nonzero quadratic residue modulo an odd prime. If $a\equiv 0\pmod p$, its only square root is $0$.

