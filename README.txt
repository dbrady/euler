= Project Euler

http://projecteuler.net

DON'T READ THESE FILES IF YOU HAVEN'T TRIED YOUR HAND AT PROJECT
EULER! My solutions aren't that great; they're not worth ruining the
exploration for yourself.

This project contains my solutions to Project Euler problems.

About a third of my solutions are effectively one-liners. Another
third have been refactored to use common code in lib/, the last third
still await refactoring.

lib/ contains common code for the solutions. My general approach has
been to write elegant, readable solutions and optimize them later; as
a result I find myself monkeypatching the core classes a lot in order
to gain expressiveness. Let's face it, 42.factors() and 13.prime? are
much more readable and expressive than trying to chain up piles of
nested calls.


