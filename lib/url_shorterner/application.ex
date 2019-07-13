defmodule UrlShorterner.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {UrlShorterner.Cache, []},
      UrlShorterner.Repo,
      UrlShorternerWeb.Endpoint,
      {ConCache, [name: :my_cache, ttl_check_interval: false]}
    ]

    opts = [strategy: :one_for_one, name: UrlShorterner.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    UrlShorternerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
