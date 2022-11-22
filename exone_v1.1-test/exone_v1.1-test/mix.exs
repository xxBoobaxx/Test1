defmodule ExOne.MixProject do
  use Mix.Project

  def project() do
    [
      app: :exone,
      version: "0.0.1",
      elixir: "~> 1.9",
      deps: deps(),
    ]
  end

  def application() do 
    [
      mod: {ExOne.App, []},
      applications: [:ranch, :cowlib, :cowboy, :syn, :n2o, :nitro, :rocksdb, :kvs, :form]
    ]
  end

  defp deps() do
    [
      {:cowboy, "~> 2.9"},
      {:n2o, "~> 8.4.0"},
      {:nitro, "~> 7.10"},
      {:syn, "~> 2.1.1", override: true},
      {:rocksdb, "~> 1.6.0"},
      {:kvs, "~> 9.9"},
      {:form, "~> 7.10"}
    ]
  end
end
