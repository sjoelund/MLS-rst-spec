Change Modelica language spec documentation format
==================================================

Abstract
--------

We want a version of the specification that:

* Can be easily modified.
* Supports collaboration.
* Can be converted to different formats easily.

Copyright License
-----------------

This document is placed in public domain.

Revisions
---------

======= ========== ===============
Version Date       Comments
======= ========== ===============
v1      2015-06-08 Initial version
======= ========== ===============

Proposed Changes in Specification
---------------------------------

The specification will need to be updated. The initial conversion
can be done by pandoc with manual changes of the specification to
make sure all formatting has been preserved, indexes updated, source
code using source code blocks, etc.

Required changes in List of Keywords
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Conversion to restructured text.

Required changes in Grammar
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Conversion to restructured text.
Actually write the grammar in EBNF (the old one does not follow the
grammar).

Required changes in Specification Text
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All sections.

Motivation
----------

.. include :: README.rst

Rationale
---------

Design process
~~~~~~~~~~~~~~

Binary documentation formats are horrible.
ModelicaBook uses Sphinx, and OpenModelica documentation will as well
since the system mostly works.

Alternative Designs
~~~~~~~~~~~~~~~~~~~

Investigated pandoc, docbook, ASCIIDoc.

State of the Art
~~~~~~~~~~~~~~~~

It is used to document libraries, for example on http://phpmyadmin.readthedocs.org/en/latest/.
It supports other languages as well, but the sphinx things allows you to
choose version and which version (HTML/PDF/etc) to download.

Backwards Compatibility
-----------------------

Corruption of existing models
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

No actual changes will be made.

Means of mitigation
~~~~~~~~~~~~~~~~~~~

No actual changes will be made.

Implementation Effort
---------------------

No changes will be made that directly affect Modelica tools.

Mandatory Parts
~~~~~~~~~~~~~~~

No changes will be made that directly affect Modelica tools.

Optional Parts
~~~~~~~~~~~~~~

No changes will be made that directly affect Modelica tools.

Way of Implementation
~~~~~~~~~~~~~~~~~~~~~

No changes will be made that directly affect Modelica tools.

Required Patents
~~~~~~~~~~~~~~~~

No changes will be made that affect patents.

References
----------
