#!/usr/bin/env escript
%% -*- erlang -*-
%%! -pa erlydtl/ebin

-define(OPTS, [{out_dir, "."}]).

main(_Args) ->
    from_binary(),
    from_file(),
    from_dir().

from_binary() ->
    erlydtl:compile(<<"{{ x|escape }}">>, test_from_binary, ?OPTS),
    Rendered = test_from_binary:render([]),
    io:format("From binary: ~p~n", [Rendered]).

from_file() ->
    erlydtl:compile("./templates/test.html", test_from_file, ?OPTS),
    Rendered = test_from_binary:render([]),
    io:format("From file:   ~p~n", [Rendered]).

from_dir() ->
    erlydtl:compile_dir("./templates", test_from_dir, ?OPTS),
    Rendered = test_from_dir:test([]),
    io:format("From dir:    ~p~n", [Rendered]).
