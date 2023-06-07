defmodule Notera.Repo do
  use Ecto.Repo,
    otp_app: :notera,
    adapter: Ecto.Adapters.Postgres
end
