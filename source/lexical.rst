Lexical Structure
=================

.. role:: modelica(code)
   :language: modelica

This chapter describes several of the basic building blocks of Modelica
such as characters and lexical units including identifiers and literals.
Without question, the smallest building blocks in Modelica are single
characters belonging to a character set. Characters are combined to form
lexical units, also called tokens. These tokens are detected by the
lexical analysis part of the Modelica translator. Examples of tokens are
literal constants, identifiers, and operators. Comments are not really
lexical units since they are eventually discarded. On the other hand,
comments are detected by the lexical analyzer before being thrown away.

The information presented here is derived from the more formal
specification in Appendix B.

Character Set
-------------

The character set of the Modelica language is Unicode, but restricted to
the Unicode characters corresponding to 7-bit ASCII characters in
several places; for details see Appendix B.1.

Comments
--------

There are two kinds of comments in Modelica which are not lexical units
in the language and therefore are treated as whitespace by a Modelica
translator. The whitespace characters are space, tabulator, and line
separators (carriage return and line feed); and whitespace cannot occur
inside tokens, e.g., <= must be written as two characters without space
or comments between them. [*The comment syntax is identical to that of
C++*\ ]. The following comment variants are available:

==================  =======================================================================
``// comment``      Characters from // to the end of the line are ignored.
``/* comment */``   Characters between /\* and \*/ are ignored, including line terminators.
==================  =======================================================================

Modelica comments do not nest, i.e., ``/* */`` cannot be embedded within
``/* */``. The following is *invalid*:

.. code-block :: modelica

  /* Commented out - erroneous comment, invalid nesting of comments!
  /* This is an interesting model */

  model interesting
   // ...
  end interesting;
  */

There is also a kind of "documentation comment," really a *documentation
string* that is part of the Modelica language and therefore not ignored
by the Modelica translator. Such "comments" may occur at the ends of
declarations, equations, or statements or at the beginning of class
definitions. For example:

.. code-block :: modelica

  model TempResistor "Temperature dependent resistor"
    // ...
    parameter Real R "Resistance for reference temp.";
    // ...
  end TempResistor;

Identifiers, Names, and Keywords
--------------------------------

*Identifiers* are sequences of letters, digits, and other characters
such as underscore, which are used for *naming* various items in the
language. Certain combinations of letters are *keywords* represented as
*reserved* words in the Modelica grammar and are therefore not available
as identifiers.

Identifiers
~~~~~~~~~~~

Modelica *identifiers*, used for naming classes, variables, constants,
and other items, are of two forms. The first form always start with a
letter or underscore (\_), followed by any number of letters, digits, or
underscores. Case is significant, i.e., the names Inductor and inductor
are different. The second form (Q-IDENT) starts with a single quote,
followed by a sequence of any printable ASCII character, where
single-quote must be preceded by backslash, and terminated by a single
quote, e.g. '12H', '13\\'H', '+foo'. Control characters in quoted
identifiers have to use string escapes. The single quotes are part of
the identifier, i.e., 'x' and x are distinct identifiers. The following
BNF-like rules define Modelica identifiers, where curly brackets {}
indicate repetition zero or more times, and vertical bar \| indicates
alternatives. A full BNF definition of the Modelica syntax and lexical
units is available in :ref:`old Appendix B`.

.. code-block :: ebnf

  IDENT = NONDIGIT { DIGIT | NONDIGIT } | Q-IDENT ;
  Q-IDENT = "'" { Q-CHAR | S-ESCAPE } "'" ;
  NONDIGIT = "_" | letters "a" to "z" | letters "A" to "Z" ;
  DIGIT = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
  Q-CHAR = NONDIGIT | DIGIT | "!" | "#" | "$" | "%" | "&" | "(" | ")" | "\*" | "+" |
    "," | "-" | "." | "/" | ":" | ";" | "<" | ">" | "=" | "?" | "@" | "[" | "]" |
    "^" | "{" | "}" | "|" | "~" | " " | "_" ;
  S-ESCAPE = "\" ( "'" """" "?" "\" "a" "b" "f" "n" "r" "t" "v" ) ;

Names
~~~~~

A *name* is an identifier with a certain interpretation or meaning. For
example, a name may denote an Integer variable, a Real variable, a
function, a type, etc. A name may have different meanings in different
parts of the code, i.e., different scopes. The interpretation of
identifiers as names is described in more detail in :ref:`todo: Chapter 5`. The
meaning of package names is described in more detail in :ref:`todo: Chapter 13`.

Modelica Keywords
~~~~~~~~~~~~~~~~~

The following Modelica *keywords* are reserved words and may not be used
as identifiers, except as listed in :ref:`old Appendix B.1`:

+-----------------+----------------+------------+-------------+---------------+
| algorithm       | discrete       | false      | loop        | pure          |
+-----------------+----------------+------------+-------------+---------------+
| and             | each           | final      | model       | record        |
+-----------------+----------------+------------+-------------+---------------+
| annotation      | else           | flow       | not         | redeclare     |
+-----------------+----------------+------------+-------------+---------------+
|                 | elseif         | for        | operator    | replaceable   |
+-----------------+----------------+------------+-------------+---------------+
| block           | elsewhen       | function   | or          | return        |
+-----------------+----------------+------------+-------------+---------------+
| break           | encapsulated   | if         | outer       | stream        |
+-----------------+----------------+------------+-------------+---------------+
| class           | end            | import     | output      | then          |
+-----------------+----------------+------------+-------------+---------------+
| connect         | enumeration    | impure     | package     | true          |
+-----------------+----------------+------------+-------------+---------------+
| connector       | equation       | in         | parameter   | type          |
+-----------------+----------------+------------+-------------+---------------+
| constant        | expandable     | initial    | partial     | when          |
+-----------------+----------------+------------+-------------+---------------+
| constrainedby   | extends        | inner      | protected   | while         |
+-----------------+----------------+------------+-------------+---------------+
| der             | external       | input      | public      | within        |
+-----------------+----------------+------------+-------------+---------------+

Literal Constants
-----------------

Literal constants are unnamed constants that have different forms
depending on their type. Each of the predefined types in Modelica has a
way of expressing unnamed constants of the corresponding type, which is
presented in the ensuing subsections. Additionally, array literals and
record literals can be expressed.

Floating Point Numbers
~~~~~~~~~~~~~~~~~~~~~~

A floating point number is expressed as a decimal number in the form of
a sequence of decimal digits optionally followed by a decimal point,
optionally followed by an exponent. At least one digit must be present.
The exponent is indicated by an E or e, followed by an optional sign (+
or -) and one or more decimal digits. The minimal recommended range is
that of IEEE double precision floating point numbers, for which the
largest representable positive number is ``1.7976931348623157E+308`` and the
smallest positive number is ``2.2250738585072014E-308``. For example, the
following are floating point number literal constants:

.. code-block :: modelica

  22.5, 3.141592653589793, 1.2E-35

The same floating point number can be represented by different literals.
For example, all of the following literals denote the same number:

.. code-block :: modelica

  13., 13E0, 1.3e1, 0.13E2

Integer Literals
~~~~~~~~~~~~~~~~

Literals of type Integer are sequences of decimal digits, e.g. as in the
integer numbers ``33, 0, 100, 30030044``. [*Negative numbers are formed by
unary minus followed by an integer literal*\ ]. The minimal recommended
number range is from ``-2147483648`` to ``+2147483647`` for a two’s-complement
32-bit integer implementation.

Boolean Literals
~~~~~~~~~~~~~~~~

The two Boolean literal values are :modelica:`true` and :modelica:`false`.

Strings
~~~~~~~

String literals appear between double quotes as in "between". Any
character in the Modelica language character set (see appendix B.1 for
allowed characters) apart from double quote (") and backslash (\\),
including new-line, can be *directly* included in a string without using
an escape code. Certain characters in string literals can be represented
using escape codes, i.e., the character is preceded by a backslash (\\)
within the string. Those characters are:

======== ===================================================================
``"\'"`` single quote may also appear without backslash in string constants.
``"\""`` double quote
``"\?"`` question-mark may also appear without backslash in string constants.
``"\\"`` backslash itself
``"\a"`` alert (bell, code 7, ctrl-G)
``"\b"`` backspace (code 8, ctrl-H)
``"\f"`` form feed (code 12, ctrl-L)
``"\n"`` new-line (code 10, ctrl-J)
``"\r"`` return (code 13, ctrl-M)
``"\t"`` horizontal tab (code 9, ctrl-I)
``"\v"`` vertical tab (code 11, ctrl-K)
======== ===================================================================

For example, a string literal containing a tab, the words: This is,
double quote, space, the word: between, double quote, space, the word:
us, and new-line, would appear as follows:

.. code-block :: modelica

  "\tThis is\" between\" us\n"

Concatenation of string literals in certain situations (see the Modelica
grammar) is denoted by the + operator in Modelica, e.g. :modelica:`"a" + "b"`
becomes :modelica:`"ab"`. This is useful for expressing long string literals that
need to be written on several lines.

[*Note, if the contents of a file is read into a Modelica string, it is
assumed that the reading function is responsible to handle the different
line ending symbols on file (e.g. on Linux systems to have a “newline”
character at the end of a line and on Windows systems to have a
“newline” and a “carriage return” character. As usual in programming
languages, the content of a file in a Modelica string only contains the
“newline” character.*

*For long string comments, e.g., the “info” annotation to store the
documentation of a model, it would be very inconvenient, if the string
concatenation operator would have to be used for every line of
documentation. It is assumed that a Modelica tool supports the
non-printable “newline” character when browsing or editing a string
literal. For example, the following statement defines one string that
contains (non-printable) newline characters:*

.. code-block :: modelica

  assert(noEvent(length > s_small), "
      The distance between the origin of frame_a and the origin of frame_b of a
      LineForceWithMass component became smaller as parameter s_small
      (= a small number, defined in the \"Advanced\" menu). The distance is
      set to s_small, although it is smaller, to avoid a division by zero
      when computing the direction of the line force.",
    level = AssertionLevel.warning);

]

Operator Symbols
----------------

The predefined operator symbols are formally defined on :ref:`todo: page 255` and
summarized in the table of operators in :numref:`table-operators`.
