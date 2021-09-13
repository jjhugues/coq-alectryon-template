# coq-alectryon-template

The goal of this project is to provide a minimal working example for
the following requirements:

- a set of Coq files (in `theories`) annotated with reST elements that
  comes frmo the alectryon examples
  (e.g. https://github.com/cpitclaudel/alectryon/blob/master/recipes/literate_coq.v
  )

- a configured Sphinx project (in `docs`) with minimal
  configuration. `conf.py` has been adjusted to accept alectryon
  annotations.

Then
- `make generate_doc` copies Coq files to `docs`  (*TO BE RENAMED*)
- `make -C docs html` generates HTML files using Sphinx, the result is in `docs/_build/html`
- `make -C docs latexpdf` generates a PDF using Sphinx, the result is in `docs/_build/latex/coq-alectryon-template.pdf`
