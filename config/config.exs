# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :reactin,
  ecto_repos: [Reactin.Repo]

# Configures the endpoint
config :reactin, ReactinWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4BIJk73vkF8K30MR86ZH2lLDHAnz7NhQvddoJ16EqS2rPo6mw4apCgQ4wpi3c+bw",
  render_errors: [view: ReactinWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Reactin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
