ExUnit.start()

defmodule ContagemMaioresQue do
  @doc """
  Conta quantos elementos em uma lista são maiores que um dado número N, utilizando recursão.
  """
  @spec run(list(integer), integer) :: integer
  def run([], _n), do: 0
  def run([head | tail], n) when head > n do
    1 + run(tail, n)
  end
  def run([_head | tail], n), do: run(tail, n)
end

defmodule ContagemMaioresQueTest do
  use ExUnit.Case, async: true

  test "conta elementos maiores que N" do
    assert ContagemMaioresQue.run([1, 2, 3, 4, 5], 3) == 2
  end

  test "retorna 0 se nenhum elemento for maior que N" do
    assert ContagemMaioresQue.run([1, 2, 3], 5) == 0
  end
end
