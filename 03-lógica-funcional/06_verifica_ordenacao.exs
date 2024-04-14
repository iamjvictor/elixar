ExUnit.start()

defmodule ListaOrdenada do
  @doc """
  Verifica se uma lista de números inteiros está ordenada em ordem crescente.
  """
  @spec run(list(integer)) :: boolean
  def run([]), do: true
  def run([_]), do: true  
  def run([head | tail]) when head <= hd(tail) do
    run(tail)
  end
  def run(_), do: false  # Se não correspondeu aos padrões anteriores, a lista não está ordenada
end


defmodule ListaOrdenadaTest do
  use ExUnit.Case, async: true

  test "verifica lista ordenada corretamente" do
    assert ListaOrdenada.run([1, 2, 3, 4, 5]) == true
  end

  test "retorna false para lista não ordenada" do
    assert ListaOrdenada.run([1, 3, 2]) == false
  end
end
