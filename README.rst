Benefits of using restructured text (Sphinx)
============================================

It is a text-based representation
---------------------------------

Equations are converted to nice vector graphics.

Easy to get diff's for equations as they are also written in textual
markup (latex).

Easier to merge changes using a textual format than a binary one.
This makes collaboration much simpler, in particular when working
on making sure MCP's are up-to-date.

Easy to track individual changes (each commit is textual and easy to
see).

We could work on the specification directly during the design or web
meetings.

Restructured text specifics
---------------------------

Easier to reference particular subsections or items (a static, named,
link instead of an ever-changing section number).
That is, how to reference the specification from for example an e-mail
or forum discussion.

Automatic syntax highlighting for Modelica code snippets (no more
trying to remember which words to boldface).

Good search functionality (the JavaScript is able to search the html
even when the HTML is generated locally - no server required).

Google indexes the generated HTML easily.

It is also possible to host different versions of the documentation
on https://readthedocs.org.

http://sphinx-doc.org/ has good documentation on how to use
restructured text.

There are many useful features available:

* Abbreviations like :abbr:`MSL (Modelica Standard Library)`  or |MSL|
* Citations like :cite:`something` (working with bibtex) is available as plugins.

Generation of the text into multiple formats:

* HTML (the primary format, web searchable and linkable)
* PDF (via LaTeX)
* epub (e-book readers)
* qthelp (minor benefit; tools can use the built-in help and load the spec in it)

Benefits of using git
---------------------

Easier to propose changes, for example by writing an MCP in restructured
text or creating a github pull request for fixing typo's.

.. |MSL| replace:: :abbr:`MSL (Modelica Standard Library)`
