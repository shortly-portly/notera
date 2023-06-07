defmodule Notera.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NoteraWeb.Telemetry,
      # Start the Ecto repository
      Notera.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Notera.PubSub},
      # Start Finch
      {Finch, name: Notera.Finch},
      # Start the Endpoint (http/https)
      NoteraWeb.Endpoint
      # Start a worker by calling: Notera.Worker.start_link(arg)
      # {Notera.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Notera.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NoteraWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
