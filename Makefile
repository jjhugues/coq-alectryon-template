all:
	coq_makefile -f _CoqProject -o coq_makefile
	make -f coq_makefile

generate_doc:
	cp theories/*.v docs
	make -C docs html

distclean:
	-rm -rf coq_makefile*
	-make -C docs clean
	-rm -f docs/*.v.rst
