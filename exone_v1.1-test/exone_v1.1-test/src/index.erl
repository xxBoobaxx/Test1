-module(index).
-include_lib("nitro/include/nitro.hrl").
-include_lib("form/include/meta.hrl").
-include("exone.hrl").
-export([event/1]).

event(init) ->
    n2o:reg(n2o:sid()),
    Rec = #ex{},
    Doc = exone:doc(Rec),
    Form = form:new(Doc, Rec),
    nitro:update(app, #panel{id=app, class=["view"], body=[
        #panel{id=status},
        Form
    ]});
event({post, Id}) ->
    Ex = #ex{id=Id},
    Sources = form:sources(Ex, []),
    Ex1 = lists:foldl(fun (S, Ei) ->
        S1 = nitro:to_list(S),
        case nitro:q(S1) of
            [] -> Ei;
            <<>> -> Ei;
            V ->
                [Fid,_,_] = string:split(S1, "_", all),
                form:evoke(Ei, nitro:to_atom(Fid), V)
        end end, Ex, Sources),
    Eid = kvs:append(Ex1, "/exone/ex"),
    clear(Id);
event({cancel, Id}) -> clear(Id);
event(E) ->
    io:format("event: ~p~n", [E]),
    ok.

clear(Id) -> 
    Rec = #ex{},
    Doc = exone:doc(Rec),
    nitro:update(form:atom([form, Id]), form:new(Doc, Rec)),
    FormId = form:atom([form, Rec#ex.id]),
    Jq = #jq{target={qs, iolist_to_binary(["#", FormId, " .box:first-child input"])}, 
        method=["focus"], args=[""]},
    nitro:wire(Jq).
