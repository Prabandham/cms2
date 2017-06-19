# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cms2,
  ecto_repos: [Cms2.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :cms2, Cms2.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D7RV2q02fdHaj18m8gFWEo1zvSrhN4Cxyk4gPvYsR26s1Zm2RPbZzSxS0mKKj6sg",
  render_errors: [view: Cms2.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cms2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
