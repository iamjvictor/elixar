defmodule PedraPapelTesoura do
  def play(player_choice) do
    machine_choice = :rand.uniform(3)
    IO.puts("Escolha da maquina: #{machine_choice}")

    case {player_choice, machine_choice} do
      {1, 3} -> "Você ganhou! Pedra vence tesoura."
      {2, 1} -> "Você ganhou! Papel vence pedra."
      {3, 2} -> "Você ganhou! Tesoura vence papel."
      {player_choice, player_choice} -> "Empate!"
      {1, 2} -> "Você perdeu! Papel vence pedra."
      {2, 3} -> "Você perdeu! Tesoura vence papel."
      {3, 1} -> "Você perdeu! Pedra vence tesoura."
      _ -> "Opção Inválida"
    end
  end
end

defmodule Main do
  def run do
    loop()
  end


  defp loop do
    IO.puts("Escolha uma opção (1 para pedra, 2 para papel, 3 para tesoura, ou 0 para sair): ")
    input = IO.gets("")

    case String.trim(input) do
      "0" -> IO.puts("Obrigado por jogar! Até a próxima.")
      "1" -> play_and_loop(1)
      "2" -> play_and_loop(2)
      "3" -> play_and_loop(3)
      _ ->
        IO.puts("Opção Inválida! Por favor, escolha uma opção válida.")
        loop()
    end
  end

  defp play_and_loop(choice) do
    result = PedraPapelTesoura.play(choice)
    IO.puts(result)
    loop()
  end
end

Main.run()
