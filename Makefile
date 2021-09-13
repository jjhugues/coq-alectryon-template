all:
	coq_makefile -f _CoqProject -o coq_makefile
	make -f coq_makefile

generate_doc:
	alectryon  --no-header --frontend coq+rst --backend rst  \
		-Q theories dummy theories/hello.v \
		--copy-assets copy --output-dir docs

distclean:
	-rm -rf coq_makefile*
	-make -C docs clean
	-rm -f docs/*.v.rst
