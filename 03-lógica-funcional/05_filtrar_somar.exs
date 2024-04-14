ExUnit.start()

defmodule FiltrarSomar do
  @doc """
  Filtra números maiores que N em uma lista e retorna a soma dos números filtrados.
  """
  @spec run(list(integer), integer) :: integer
  def run([], _), do: 0
  def run([head | tail], n) when head > n do
    head + run(tail, n)
  end
  def run([_head | tail], n), do: run(tail, n)
end


defmodule FiltrarSomarTest do
  use ExUnit.Case, async: true

  test "filtra e soma números maiores que N" do
    assert FiltrarSomar.run([1, 2, 3, 4, 5], 3) == 9
  end

  test "retorna 0 se nenhum número for maior que N" do
    assert FiltrarSomar.run([1, 2, 3], 5) == 0
  end
end
