# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo_aph,
  namespace: DemoAph

# Configures the endpoint
config :demo_aph, DemoAphWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oPpqS/xx7M3T7TUDjngHPugqrPf3taE9st7QFH0N2kOSBonySFzdO6F5LfGTWKU9",
  render_errors: [view: DemoAphWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DemoAph.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
