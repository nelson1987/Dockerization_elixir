defmodule Wratchil.Repo do
  use Ecto.Repo,
    otp_app: :wratchil,
    adapter: Ecto.Adapters.Postgres
end
