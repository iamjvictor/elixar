ExUnit.start()
defmodule ConcatenacaoExclusiva do
  @doc """
  Concatena duas listas, excluindo da primeira lista os elementos já presentes na segunda.
  """
  # ACABAR AINDA
  @spec run(list(any), list(any)) :: list(any)
  def run(lista1, lista2) do
    concatenar_exclusivo(lista1, lista2, [])
  end

  defp concatenar_exclusivo([], _, acc), do: acc
  defp concatenar_exclusivo([head | tail], lista2, acc) do
    if Enum.member?(lista2, head) do
      concatenar_exclusivo(tail, lista2, acc)
    else
      concatenar_exclusivo(tail, lista2, [head | acc])
    end
  end
end



defmodule ConcatenacaoExclusivaTest do
  use ExUnit.Case, async: true

  test "concatena listas excluindo elementos repetidos" do
    assert ConcatenacaoExclusiva.run([1, 2, 3], [3, 4, 5]) == [1, 2, 4, 5]
  end

  test "concatena uma lista vazia com uma lista não vazia" do
    assert ConcatenacaoExclusiva.run([], [1, 2, 3]) == [1, 2, 3]
  end
end
