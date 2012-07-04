-module(dhcp).
-author(lweiyan@gmail.com).
-export([start/0, stop/0]).
start() ->
    io:format("~p  ~p:~n", [?MODULE, ?LINE]),
    application:start(dhcp).
stop() ->
    application:stop(dhcp).
