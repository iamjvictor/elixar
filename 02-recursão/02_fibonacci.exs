ExUnit.start()

defmodule Fibonnacci do
  @doc """
  A função de fibonnaci deve receber um inteiro
  e retornar a sequência de fibonnaci como uma lista,
   com o tamanho representado pelo primeiro parâmetro.

  Exemplo: Fibonacci.run(2) # 1 1
  Exemplo: Fibonacci.run(5) # 1 1 2 3 5
  Exemplo: Fibonacci.run(8) # 1 1 2 3 5 8 13 21

  Lembre que a sequência de fibonnacci se dá pela soma
  de um número da sequência somado ao seu antecessor.
  """
  @spec run(integer) :: list(integer)
  def run(n) when n >= 0 do
    gerar_fibonnacci(n, [], 1, 1)
  end

  defp gerar_fibonnacci(n, resultado, a, b) when n > 0 do
    if length(resultado) == n do
      Enum.reverse(resultado)
    else
      gerar_fibonnacci(n, [a | resultado], b, a + b)
    end
  end

  defp gerar_fibonnacci(0, resultado, _, _) do
    Enum.reverse(resultado)
  end
end

defmodule FibonnacciTest do
  use ExUnit.Case, async: true

  test "deve retornar a sequência de fibonnacci com seus valores corretos" do
    assert Fibonnacci.run(2) == [1, 1]
    assert Fibonnacci.run(5) == [1, 1, 2, 3, 5]
    assert Fibonnacci.run(8) == [1, 1, 2, 3, 5, 8, 13, 21]
  end
end
