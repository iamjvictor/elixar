ExUnit.start()

defmodule DuplicacaoLista do
  @doc """
  Duplica cada elemento de uma lista fornecida.
  """
  @spec run(list(any)) :: list(any)
  def run([]), do: []
  def run([head | tail]) do
    [head, head] ++ run(tail)
  end
end


defmodule DuplicacaoListaTest do
  use ExUnit.Case, async: true

  test "duplica os elementos de uma lista" do
    assert DuplicacaoLista.run([1, 2, 3]) == [1, 1, 2, 2, 3, 3]
  end

  test "retorna uma lista vazia se a entrada for uma lista vazia" do
    assert DuplicacaoLista.run([]) == []
  end
end
