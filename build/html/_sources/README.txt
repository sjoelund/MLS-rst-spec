Benefits of using restructured text (Sphinx)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is a text-based representation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Equations are converted to nice vector graphics:

.. math ::

  {\partial x \over \partial t} = 0.0

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
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Easier to reference particular subsections or items (a static, named,
link instead of an ever-changing section number).
That is, how to reference the specification from for example an e-mail
or forum discussion.

Automatic syntax highlighting for Modelica code snippets (no more
trying to remember which words to boldface):

.. code-block :: modelica
  :emphasize-lines: 4,14

  model BouncingBall
    parameter Real e=0.7 "coefficient of restitution";
    parameter Real g=9.81 "gravity acceleration";
    Real h(start=1) "height of ball";
    Real v "velocity of ball";
    Boolean flying(start=true) "true, if ball is flying";
    Boolean impact;
    Real v_new;
    Integer foo;
  equation
    impact = h <= 0.0;
    foo = if impact then 1 else 2;
    der(v) = if flying then -g else 0;
    der(h) = v;

    when {h <= 0.0 and v <= 0.0,impact} then
      v_new = if edge(impact) then -e*pre(v) else 0;
      flying = v_new > 0;
      reinit(v, v_new);
    end when;
  end BouncingBall;

Good search functionality (the JavaScript is able to search the html
even when the HTML is generated locally - no server required).

Google indexes the generated HTML easily.

It is also possible to host different versions of the documentation
on https://readthedocs.org.

http://sphinx-doc.org/ has good documentation on how to use
restructured text.

There are many useful features available:

.. index ::
  single: keyword; when
  single: keyword; if
  single: when

* Abbreviations like using \:abbr\: :abbr:`MSL (Modelica Standard Library)` or as a short-hand name \|MLS\| |MLS|
* Citations like :cite:`something` (working with bibtex) is available as plugins.
* Easy generation of an index, like :index:`if <single: if>` and when.
* Easy to theme the generated HTML.

Generation of the text into multiple formats:

* HTML (the primary format, web searchable and linkable)
* PDF (via LaTeX)
* epub (e-book readers)
* qthelp (minor benefit; tools can use the built-in help and load the spec in it)

Benefits of using git
^^^^^^^^^^^^^^^^^^^^^

Easier to propose changes, for example by writing an MCP in restructured
text or creating a github pull request for fixing typo's.

Possible to work on the specification during meetings even when the
Wi-Fi is failing.

.. |MLS| replace:: :abbr:`MLS (Modelica Language Specification)`
