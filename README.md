Mini Logo
=========

Mini Logo is an extremely simplified version of the Logo language for 
programming 2D graphics. The idea behind Logo and Mini Logo is to describe
simple line graphics through commands to move a pen from one position to
another. The pen can either be “up” or “down”. Positions are given by pairs of
integers. Macros can be defined to reuse groups of commands. The syntax of Mini
Logo is as follows (nonterminals are typeset in intalics, and terminals are
typeset in typewriter font).

    cmd ::= `pen` mode
          | `moveto` (pos,pos)
          | `def` name ( pars ) cmd
          | `call` name ( vals )
          | cmd; cmd

    mode ::= `up` | `down`
    pos  ::= num | name
    pars ::= name, pars | name
    vals ::= num, vals | num

Note: Please remember that unspecified nonterminals, such as num and name,
should be represented by corresponding predefined Haskell types, such as Int and
String.

a) Define the abstract syntax for Mini Logo as a Haskell data type.
b) Write a Mini Logo macro vector that draws a line from a given position
   (x1,y1) to a given position (x2,y2) and represent the macro in abstract
   syntax, that is, as a Haskell data type value.

   Note. What you should actually do is write a Mini Logo program that defines a
   vector macro. So the answer should have the following form.

       def vector (...) ...

   This is the textual representation in concrete syntax. Then you should write
   the same Mini Logo program in abstract syntax, that is, give a Haskell data
   type value in the following form (assuming Def is the constructor name
   representing the def production of the Haskell data type).

c) Define a Haskell function steps :: Int -> Cmd that constructs a Mini Logo
   program which draws a stair of n steps.
