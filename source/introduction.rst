Introduction
============

Overview of Modelica
--------------------

Modelica is a language for modeling of physical systems, designed to
support effective library development and model exchange. It is a modern
language built on acausal modeling with mathematical equations and
object-oriented constructs to facilitate reuse of modeling knowledge.

Scope of the Specification
--------------------------

The semantics of the Modelica language is specified by means of a set of
rules for translating any class described in the Modelica language to a
flat Modelica structure. A class must have additional properties in
order that its flat Modelica structure can be further transformed into a
set of differential, algebraic and discrete equations (= flat hybrid
DAE). Such classes are called simulation models.

The flat Modelica structure is also defined for other cases than
simulation models; including functions (can be used to provide
algorithmic contents), packages (used as a structuring mechanism), and
partial models (used as base-models). This allows correctness to be
verified before building the simulation model.

Modelica was designed to facilitate symbolic transformations of models,
especially by mapping basically every Modelica language construct to
continuous or instantaneous equations in the flat Modelica structure.
Many Modelica models, especially in the associated Modelica Standard
Library, are higher index systems, and can only be reasonably simulated
if symbolic index reduction is performed, i.e., equations are
differentiated and appropriate variables are selected as states, so that
the resulting system of equations can be transformed to state space form
(at least locally numerically), i.e., a hybrid DAE of index zero. The
Modelica specification does not define how to simulate a model. However,
it defines a set of equations that the simulation result should satisfy
as well as possible.

The key issues of the translation (or flattening) are:

-  Expansion of inherited base classes

-  Parameterization of base classes, local classes and components

-  Generation of connection equations from connect-equations

The flat hybrid DAE form consists of:

-  Declarations of variables with the appropriate basic types, prefixes
   and attributes, such as "parameter Real v=5".

-  Equations from equation sections.

-  Function invocations where an invocation is treated as a set of
   equations which involves all input and all result variables (number
   of equations = number of basic result variables).

-  Algorithm sections where every section is treated as a set of
   equations which involves the variables occurring in the algorithm
   section (number of equations = number of different assigned
   variables).

-  When-clauses where every when-clause is treated as a set of
   conditionally evaluated equations, also called instantaneous
   equations, which are functions of the variables occurring in the
   clause (number of equations = number of different assigned
   variables).

Therefore, a flat hybrid DAE is seen as a set of equations where some of
the equations are only conditionally evaluated (e.g. instantaneous
equations are only evaluated when the corresponding when-condition
becomes true). Initial setup of the model is specified using
start-values and instantaneous equations that hold at the initial time
only.

A Modelica class may also contain annotations, i.e. formal comments,
which specify graphical representations of the class (icon and diagram),
documentation text for the class, and version information.

Some Definitions
----------------

The semantic specification should be read together with the Modelica
grammar. Non-normative text, i.e., examples and comments, are enclosed
in [ ]; comments are set in italics. Additional terms are explained in
the glossary in Appendix A. Some important terms are:

Component
~~~~~~~~~

An element defined by the production component\_clause in the Modelica
grammar (basically a variable or an instance of a class).

Element
~~~~~~~
Class definitions, extends-clauses and component-clauses declared in a class
(basically a class reference or a component in a declaration).

Flattening
~~~~~~~~~~
The translation of a model described in Modelica to the corresponding
model described as a hybrid DAE, involving expansion of inherited base
classes, parameterization of base classes, local classes and components,
and generation of connection equations from connect-equations (basically,
mapping the hierarchical structure of a model into a set of differential,
algebraic and discrete equations together with the corresponding variable
declarations and function definitions from the model).

.. todo ::

  Reference the glossary. Create the glossary.

Notation and Grammar
--------------------

The following syntactic meta symbols are used (extended BNF):

[ ] optional

{ } repeat zero or more times

Boldface denotes keywords of the Modelica language. Keywords are
reserved words and may not be used as identifiers, with the exception of
initial which is a keyword in section headings, and der which is a
keyword for declaration functions, but it is also possible to call the
functions initial() and der(...).

See Appendix B for a full lexical specification and grammar.
