defmodule JogoPedraPapelTesoura.JogoTest do
  use ExUnit.Case

  test "testa resultado do jogo" do
    assert JogoPedraPapelTesoura.Jogo.determinar_resultado(1, 3) == "Você ganhou! Pedra vence tesoura."
    assert JogoPedraPapelTesoura.Jogo.determinar_resultado(2, 1) == "Você ganhou! Papel vence pedra."
    assert JogoPedraPapelTesoura.Jogo.determinar_resultado(3, 2) == "Você ganhou! Tesoura vence papel."
    assert JogoPedraPapelTesoura.Jogo.determinar_resultado(1, 1) == "Empate!"
    assert JogoPedraPapelTesoura.Jogo.determinar_resultado(1, 2) == "Você perdeu! Papel vence pedra."
  end
end
