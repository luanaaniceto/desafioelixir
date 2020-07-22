# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :b2w, B2w.Repo,
  database: "b2w_repo",
  hostname: "localhost"


# Configures the endpoint
config :b2w, B2wWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vqIQw+Iwar1BBL02u6RJo/x/aXukOKN21Qg9sXWg/AtPXr3ML+8rDhh6zrWf8d1N",
  render_errors: [view: B2wWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: B2w.PubSub,
  live_view: [signing_salt: "rC/uxheX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :b2w, B2wWeb.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "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"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
