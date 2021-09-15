defmodule GridCss.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GridCssWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GridCss.PubSub},
      # Start the Endpoint (http/https)
      GridCssWeb.Endpoint
      # Start a worker by calling: GridCss.Worker.start_link(arg)
      # {GridCss.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GridCss.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GridCssWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
