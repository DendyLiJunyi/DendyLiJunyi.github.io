# Legendre Symbol

This is a problem in Cryptohack where I find that number theory actually helps to find out the flag with in the decryption process.
You don't need enough infomations but you can still find out the flag.

## Set-up

The decryption process is clear.
Flag is a string,
we first translate the flag into a bitstring,
where every character in the string becomes an 8-digit binary.

Then we run a function pow(a, e, p) with a random number e, two sufficient large numbers a and q.

If the bit = '1', the corresponding ciphertext is pow(a, e, p),
else we set the corresponding ciphertext is -pow(a, e, p) mod p.

Now we have the ciphertext and the encryption process,
we want to find the orginal flag.

## Decryption process

The decryption process looks clear.
It's just the reverse process of the encryption process.

First we based on the ciphertext to determine the corresponding digit is 0 or 1.

Then we use the plain text to determine the flag string.

The whole process looks clear to me,
the most difficult part is how to determine the corresponding digit is 0 or 1 when the whole decision process is based on a random generate number.

## From ciphertext to bit string

### Basic idea

The basic idea of mine is that one can use brute search?(don't sure if this is the correct name) to determine such random number e.

After trying a minimal example I suddenly realise that this is impossible to do it this way.
Because the number is sufficient large,

### Help from legrende symbol

