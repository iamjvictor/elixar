defmodule JogoPedraPapelTesoura.Servidor do
  @moduledoc """
  Servidor TCP para o jogo Pedra, Papel ou Tesoura.
  """

  @doc """
  Inicia o servidor TCP.
  """
  @spec start_link(integer()) :: :ok | {:error, term()}
  def start_link(port) do
    {:ok, _} = :gen_tcp.listen(port, [:binary, active: false, {:reuseaddr, true}])
    :ok
  end

  @doc """
  Implementa a especificação do supervisor para o módulo Servidor.
  """
  def child_spec(arg) do
    %{
      id: JogoPedraPapelTesoura.Servidor,
      start: {JogoPedraPapelTesoura.Servidor, :start_link, [arg]},
      type: :worker,
      restart: :permanent
    }
  end

  @doc """
  Inicia o loop de aceitação de conexões.
  """
  def loop(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    spawn(fn -> handle_client(client) end)
    loop(socket)
  end

  defp handle_client(socket) do
    case :gen_tcp.recv(socket, 0) do
      <<opcao::integer-size(8)>> ->
        IO.puts("Recebida opção do cliente: #{opcao}")
        escolha_maquina = :rand.uniform(3) + 1
        IO.puts("Escolha da máquina: #{escolha_maquina}")
        resultado = JogoPedraPapelTesoura.Jogo.determinar_resultado(opcao, escolha_maquina)
        IO.puts("Resultado enviado para o cliente: #{resultado}")
        :gen_tcp.send(socket, resultado)
      _ ->
        IO.puts("Opção inválida recebida do cliente")
        :gen_tcp.send(socket, "Opção inválida.")
    end
    :gen_tcp.close(socket)
  end
end
