defmodule JogoPedraPapelTesoura.Jogo do
  @moduledoc """
  Lógica do jogo Pedra, Papel ou Tesoura.
  """

  @doc """
  Determina o resultado do jogo.
  """
  @spec determinar_resultado(integer(), integer()) :: String.t()
  def determinar_resultado(escolha_jogador, escolha_maquina) do
    case {escolha_jogador, escolha_maquina} do
      {1, 3} -> "Você ganhou! Pedra vence tesoura."
      {2, 1} -> "Você ganhou! Papel vence pedra."
      {3, 2} -> "Você ganhou! Tesoura vence papel."
      {escolha_jogador, escolha_jogador} -> "Empate!"
      _ -> "Você perdeu! #{descricao_escolha(escolha_maquina)} vence #{descricao_escolha(escolha_jogador)}."
    end
  end

  defp descricao_escolha(1), do: "pedra"
  defp descricao_escolha(2), do: "papel"
  defp descricao_escolha(3), do: "tesoura"
end
