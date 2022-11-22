-module(exone).
-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("form/include/meta.hrl").
-include("exone.hrl").

-export([doc/1]).
-export([metainfo/0, tables/0]).

metainfo() -> #schema{name=index, tables=tables()}.
tables() -> [#table{name=ex, fields=record_info(fields, ex)}].

doc(#ex{}=E) ->
    Name = iolist_to_binary([E#ex.id]),
    #document{name = Name,
    fields = [
        #field{id=name, type=string, pos=3, title= <<"name:"/utf8>>}
    ],
    buttons = [
        #but{id=create,
            class=["btn"],
            title= <<"OK">>,
            validation=[],
            postback={post, Name},
            sources=[name]},
        #but{id=cancel,
            class=["btn"],
            title= <<"Clear">>,
            postback={cancel, Name}}
    ]}.
