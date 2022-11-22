-ifndef(STREAM_HRL).
-define(STREAM_HRL, true).
-include("kvs.hrl").
-include("cursors.hrl").
-define(STREAM, [top/1, top/2, bot/1, bot/2, next/1, next/2, prev/1, prev/2, drop/1, drop/2, take/1, take/2, append/2, append/3, feed/1, feed/2,
                 load_reader/1, load_reader/2, writer/1, writer/2, reader/1, reader/2, save/1, save/2, add/1, add/2, remove/2, remove/3, cut/1, cut/2]).

-spec top(#reader{})  -> #reader{}.
-spec bot(#reader{})  -> #reader{}.
-spec next(#reader{}) -> #reader{}.
-spec prev(#reader{}) -> #reader{}.
-spec drop(#reader{}) -> #reader{}.
-spec take(#reader{}) -> #reader{}.
-spec feed (term())   -> list().
-spec load_reader (term()) -> #reader{}.
-spec writer (term()) -> #writer{}.
-spec reader (term()) -> #reader{}.
-spec save (#reader{} | #writer{}) -> #reader{} | #writer{}.
-spec add(#writer{}) -> #writer{}.
-spec append(tuple(),term()) -> any().
-spec remove(tuple(),term()) -> integer().
-spec cut(term(), list()) -> ok.
-endif.