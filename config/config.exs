# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :transformer,
  ecto_repos: [Transformer.Repo]

# Configures the endpoint
config :transformer, Transformer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Gqw9lSedXFElgQbvHQCLrXu3JCPxe7BWBh7gPetMietmOWaOsO2wFuE3F0l7/yB8",
  render_errors: [view: Transformer.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Transformer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
