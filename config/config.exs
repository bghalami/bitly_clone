# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :url_shorterner,
  ecto_repos: [UrlShorterner.Repo]

# Configures the endpoint
config :url_shorterner, UrlShorternerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7W2wHafgCtxEZDO3dgKB/iyFaUzYo9Ta8uLLOjAn9YK2spe0dcOSFnSFf5qPYnXC",
  render_errors: [view: UrlShorternerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: UrlShorterner.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
