= Project Euler

http://projecteuler.net

DON'T READ THESE FILES IF YOU HAVEN'T TRIED YOUR HAND AT PROJECT
EULER! My solutions aren't that great; they're not worth ruining the
exploration for yourself.

This project contains solutions to Project Euler problems by
David Brady (dbrady) and Markus Prinz (cypher), mostly written in Ruby.

About a third of my solutions are effectively one-liners. (My original
plan was to try to solve all of them from the command-line with ruby
-e. I'm pleased with how far I made it before realizing that this was
not a sustainable strategem.) Another third have been refactored to
use common code in lib/, the last third still await refactoring.

lib/ contains common code for the solutions. My general approach has
been to write elegant, readable solutions and optimize them later; as
a result I find myself monkeypatching the core classes a lot in order
to gain expressiveness. Let's face it, 42.factors() and 13.prime? are
much more readable and expressive than trying to chain up piles of
nested calls.


