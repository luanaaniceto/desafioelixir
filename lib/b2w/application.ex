defmodule B2w.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      B2wWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: B2w.PubSub},
      # Start the Endpoint (http/https)
      B2wWeb.Endpoint,
      # Start a worker by calling: B2w.Worker.start_link(arg)
      # {B2w.Worker, arg}
      supervisor(B2w.Repo, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: B2w.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    B2wWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
