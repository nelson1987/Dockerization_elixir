# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :wratchil,
  ecto_repos: [Wratchil.Repo]

# Configures the endpoint
config :wratchil, WratchilWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yK0LJjLvBwiR/fz9JT9gSEf5Ivck5kDoE3ZRRuaG4io+Yi3JWQOygphRrT7HTqJQ",
  render_errors: [view: WratchilWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Wratchil.PubSub,
  live_view: [signing_salt: "kCeXNcH0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Swagger for API documentation in Phoenix
  config :wratchil, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: WratchilWeb.Router,
      endpoint: WratchilWeb.Endpoint
    ]
  }

  config :tesla, adapter: Tesla.Adapter.Hackney

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
