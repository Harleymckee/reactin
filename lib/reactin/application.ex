defmodule Reactin.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    render_service_path = "assets/js/server.js"

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Reactin.Repo, []),
      # Start the endpoint when the application starts
      supervisor(ReactinWeb.Endpoint, []),
      # Start your own worker by calling: Reactin.Worker.start_link(arg1, arg2, arg3)
      # worker(Reactin.Worker, [arg1, arg2, arg3]),
      worker(ReactRender, [render_service_path])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Reactin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ReactinWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
