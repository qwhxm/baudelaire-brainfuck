# baudelaire-brainfuck

First, there was a brainfuck program. It didn't do anything useful, but even
so, I thought it was a pity that is wasn't exactly convenient to run it.

To fix that, I created a REST "web service" using AWS Lambda and API Gateway,
and also an HTML/JS client for it, so that the program can be run (and be
useless) more conveniently.

## Backstory

Once upon a time <sup>(in 2010)</sup>, I wrote a
[brainfuck](https://esolangs.org/wiki/Brainfuck) program inspired by
the visual poem "Baudelaire" by Jiří Kolář – or, rather, by its representation
I encountered in a literature textbook. It looked more or less like this:
```
b b b b b b b b b b b b b b b b b b b b
b a a a a a a a a a a a a a a a a a a b
b a u u u u u u u u u u u u u u u u a b
b a u d d d d d d d d d d d d d d u a b
b a u d e e e e e e e e e e e e d u a b
b a u d e l l l l l l l l l l e d u a b
b a u d e l a a a a a a a a l e d u a b
b a u d e l a i i i i i i a l e d u a b
b a u d e l a i r r r r i a l e d u a b
b a u d e l a i r e e r i a l e d u a b
b a u d e l a i r e e r i a l e d u a b
b a u d e l a i r r r r i a l e d u a b
b a u d e l a i i i i i i a l e d u a b
b a u d e l a a a a a a a a l e d u a b
b a u d e l l l l l l l l l l e d u a b
b a u d e e e e e e e e e e e e d u a b
b a u d d d d d d d d d d d d d d u a b
b a u u u u u u u u u u u u u u u u a b
b a a a a a a a a a a a a a a a a a a b
b b b b b b b b b b b b b b b b b b b b
```

The program, when run, asks for an input string, and then outputs a square
of characters from this string following the pattern used in the poem.
(So for the input "baudelaire", the program outputs the above square.)

## Backend

Contents of the directory [backend](backend) are deployed as a Lambda function
on AWS Lambda. The deployment package contains three files:
* [baudelaire.b](backend/baudelaire.b) – The brainfuck program, in
  a "minified" form (stripped of whitespace and comments).
* [esco](backend/esco) – The
  [EsCo (Esoteric Combine) brainfuck interpreter](http://esco.sourceforge.net);
  compiled statically, so that it can run in any environment without issues.
* [baudelaire-brainfuck.py](backend/baudelaire-brainfuck.py) – The actual
  Lambda handler (a simple Python wrapper).

## Frontend

For the Lambda function described above, there is a "REST" API set up (using
AWS API Gateway). It accepts GET requests with input for the Lambda function
specified in a query parameter, and returns a response with its output.

The directory [frontend](frontend) contains two clients that can be used
to call this API:
* [client.sh](frontend/client.sh) – A maximally simple curl-based
  command-line client.
* [client.html](frontend/client.html) – A web client, published at
  https://qwhxm.github.io/baudelaire-brainfuck/client.html using GitHub Pages.
  This should allow for peak convenience as far as running useless brainfuck
  programs goes.

## Extras

In the directory [extras](extras), there is a non-minified version of the
program baudelaire.b, for reference. It it properly structured and even
commented almost to the point of understandability (although the comments are
not in English, sorry).

The two versions are functionally equivalent, except that the output of the
non-minified version contains an extra null character (`\0`) at the beginning,
because of the dot at the end of line 2.
