ExUnit.start()

defmodule SomaLista do
  @doc """
  Desenvolver uma função recursiva para somar
  todos os elementos de uma lista.
  """
  @spec run(list(integer)) :: integer
  def run(xs) when is_list(xs) do
    soma_recursiva(xs)
  end

  defp soma_recursiva([], acc \\ 0), do: acc
  defp soma_recursiva([x | xs], acc) do
    soma_recursiva(xs, acc + x)
  end
end

defmodule SomaListaTest do
  use ExUnit.Case, async: true

  test "deve retornar o somatório de todos os elementos da lista" do
    assert SomaLista.run([1, 2, 3]) == 6
    assert SomaLista.run([3, 2, 1]) == 6
    assert SomaLista.run([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) == 55
  end
end
