ExUnit.start()

defmodule Subconjuntos do
  @doc """
  Retorna todos os subconjuntos possíveis de uma lista.
  """
  @spec run(list(any)) :: list(list(any))
  def run([]), do: [[]]

  def run([head | tail]) do
    subconjuntos_sem_head = run(tail)
    subconjuntos_com_head = for subset <- subconjuntos_sem_head, do: [head | subset]
    subconjuntos_sem_head ++ subconjuntos_com_head
  end
end


defmodule SubconjuntosTest do
  use ExUnit.Case, async: true

  test "retorna todos os subconjuntos de uma lista" do
    assert Enum.sort(Subconjuntos.run([1, 2])) == Enum.sort([[], [1], [2], [1, 2]])
  end

  test "inclui o conjunto vazio como subconjunto" do
    assert Subconjuntos.run([]) == [[]]
  end
end
