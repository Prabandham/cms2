defmodule Cms2.Application do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Cms2.Repo, []),
      # Start the endpoint when the application starts
      supervisor(Cms2.Web.Endpoint, []),
      # Start your own worker by calling: Cms2.Worker.start_link(arg1, arg2, arg3)
      # worker(Cms2.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cms2.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
