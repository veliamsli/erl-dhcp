-module(dhcp_app).
-author(lweiyan@gmail.com).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    io:format("~p  ~p:~n", [?MODULE, ?LINE]),
    dhcp_sup:start_link().

stop(_State) ->
    ok.
