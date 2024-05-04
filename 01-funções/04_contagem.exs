ExUnit.start()

defmodule Contagem do
  @doc """
  A função de contagem de palavras recebe uma
  string S1 como primeiro parâmetro e uma
  segunda string S2 que representa uma palavra como
  segundo parâmetro.

  A função deve retornar o número de ocorrência de S2
  dentro de S1. É permitido usar funções auxiliares criadas
  no momento da execução. Caso saiba usar recursão, também é permitido.

  ## Dicas
  - [`String.split/2`](https://hexdocs.pm/elixir/String.html#split/2)
  - [`Enum.count/2`](https://hexdocs.pm/elixir/Enum.html#count/2)
  """
  @spec run(String.t(), String.t()) :: integer
  def run(frase, palavra) do
    palavras = frase |> String.downcase() |> String.split(~r/\W+/)
    Enum.count(palavras, fn(word) -> word == palavra end)
  end
end


defmodule ContagemTest do
  use ExUnit.Case, async: true

  describe "quando recebe uma frase e uma palavra a função deve retornar o número de ocorrências de uma dada palavra" do
    test "quando for uma string vazia" do
      assert Contagem.run("", "teste") == 0
    end

    test "quando for apenas uma única ocorrência" do
      assert Contagem.run("O gato e o rato.", "gato") == 1
      assert Contagem.run("O gato e o rato.", "rato") == 1
    end

    test "quando for múltiplas ocorrências" do
      assert Contagem.run("sol sol sol lua lua estrela", "sol") == 3
      assert Contagem.run("sol sol sol lua lua estrela", "lua") == 2
      assert Contagem.run("sol sol sol lua lua estrela", "estrela") == 1
    end
  end
end
