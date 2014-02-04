all: libs test

libs: erlydtl

erlydtl:
	git clone https://github.com/erlydtl/erlydtl.git
	cd erlydtl; make

test: refresh_erlydtl
	./test.escript

refresh_erlydtl:
	cd erlydtl; make

clean:
	rm *.beam
	rm -rf erlydtl
