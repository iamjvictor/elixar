ExUnit.start()

defmodule SomaImpares do
  @doc """
  Soma todos os números ímpares em uma lista de inteiros utilizando recursão.
  """
  @spec run(list(integer)) :: integer
  def run([]), do: 0
  def run([head | tail]) when rem(head, 2) != 0 do
    head + run(tail)
  end
  def run([_head | tail]), do: run(tail)
end


defmodule SomaImparesTest do
  use ExUnit.Case, async: true

  test "soma números ímpares em uma lista" do
    assert SomaImpares.run([1, 2, 3, 4, 5]) == 9
  end

  test "retorna 0 para uma lista vazia" do
    assert SomaImpares.run([]) == 0
  end
end
