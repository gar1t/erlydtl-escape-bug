# Erlydtl bug when using compile_dir and escape

This project shows there's a problem with erlydtl:compile_dir and the use of
escape (there may be other issues as well related to this).

When an undefined value is escaped, the result, when rendered using a
module from erlydtl:compile_dir, is the atom `undefined` rather than the the
binary `<<"undefined">>`.

Clone this repo and run `make` in a shell:

    $ make
	...
	./test.escript
	From binary: {ok,[<<"undefined">>]}
	From file:   {ok,[<<"undefined">>]}
	From dir:    [undefined,<<"\n">>]

`test.escript` performs the test. The template used for the file and dir tests
is `templates/test.html`.
