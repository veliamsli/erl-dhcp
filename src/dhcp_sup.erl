-module(dhcp_sup).
-author(lweiyan@gmail.com).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    io:format("~p  ~p:~n", [?MODULE, ?LINE]),
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    io:format("~p  ~p:~n", [?MODULE, ?LINE]),
    Dhcpd        = ?CHILD(dhcp_server, worker),
    Specs       = [ Dhcpd
                  ],

    {ok, { {one_for_one, 5, 10}, Specs} }.

