defmodule TftExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # load the viewport configuration from config
    main_viewport = Application.get_env(:tft_example, :viewport)

    children =
      [
        {Scenic, [main_viewport]},
        TftExample.Basic
        # Children for all targets
        # Starts a worker by calling: TftExample.Worker.start_link(arg)
        # {TftExample.Worker, arg},
      ] ++ children(target())

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      # Children that only run on the host
      # Starts a worker by calling: TftExample.Worker.start_link(arg)
      # {TftExample.Worker, arg},
    ]
  end

  def children(_target) do
    [
      # Children for all targets except host
      # Starts a worker by calling: TftExample.Worker.start_link(arg)
      # {TftExample.Worker, arg},
    ]
  end

  def target() do
    Application.get_env(:tft_example, :target)
  end
end
