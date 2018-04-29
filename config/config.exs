# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :may_second,
  ecto_repos: [MaySecond.Repo]

# Configures the endpoint
config :may_second, MaySecondWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "23aYLfCQz459B1ntbt4PTrHr/aUmqiwfHDeRaCdgEwn6QPygU8nognuIkbtAo624",
  render_errors: [view: MaySecondWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MaySecond.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Phauxth authentication configuration
config :phauxth,
  token_salt: "mGtgNLeC",
  endpoint: MaySecondWeb.Endpoint

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
