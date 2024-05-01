defmodule JogoPedraPapelTesoura do
  use Application

  def start(_type, _args) do


    children = [
      JogoPedraPapelTesoura.Servidor
    ]

    opts = [strategy: :one_for_one, name: JogoPedraPapelTesoura.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
