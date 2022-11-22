import Config

config :kvs,
    dba: :kvs_rocks,
    dba_st: :kvs_st,
    schema: [:kvs, :kvs_stream, :exone]

config :n2o, 
    app: :exone,
    port: 8081,
    mq: :n2o_syn,
    pickler: :n2o_secret,
    session: :n2o_session,
    routes: ExOne.Routes,
    tables: [:tcp, :ws, :async, :cookies, :caching],
    protocols: [:nitro_n2o, :n2o_heart]
