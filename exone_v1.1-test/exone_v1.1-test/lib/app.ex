defmodule ExOne.App do
  use Application
  use Supervisor

  @port :application.get_env(:n2o, :port, 8080)

  def mime(), do: [{:mimetypes, :cow_mimetypes, :all}]
  def points(), do: :cowboy_router.compile([
    {:_, [
      {'/', :cowboy_static, {:file, "priv/static/index.html", mime()}},
      {'/ws/[...]',  :n2o_cowboy, []},
      {'/n2o/[...]', :cowboy_static, {:dir, "deps/n2o/priv", mime()}},
      {'/nitro/[...]', :cowboy_static, {:dir, "deps/nitro/priv/js", mime()}},
      {'/form/[...]', :cowboy_static, {:dir, "deps/form/priv", mime()}},
      {'/[...]', :cowboy_static, {:dir, "priv/static", mime()}}
    ]}
  ])

  def env(), do:  %{env: %{dispatch: points()}}
  def opts(), do: %{connection_type: :worker,
                    handshake_timeout: 10000,
                    max_connections: 1000,
                    num_acceptors: 100, 
                    shutdown: 5000, 
                    socket_opts: [
                      {:port, @port}
                    ]}
  
  def spec(), do: :ranch.child_spec(:exone, :ranch_tcp, opts(), :cowboy_clear, env())

  @impl true 
  def init([]) do
    Supervisor.init([spec()], strategy: :one_for_one)
  end

  @impl true
  def start(_,args) do
    :kvs.join()
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def stop(_) do 
    :ranch.stop_listener(:exone)
  end

end
