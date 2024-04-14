ExUnit.start()

defmodule AtualizarMapaAninhado do
  
  @spec run(map(), list(atom()), any()) :: map()
  def run(mapa, [], valor), do: valor

  def run(mapa, [chave | restante], valor) do
    submapa_atualizado =
      case mapa[chave] do
        nil -> run(%{}, restante, valor)
        submapa -> run(submapa, restante, valor)
      end

    Map.put(mapa, chave, submapa_atualizado)
  end
end



defmodule AtualizarMapaAninhadoTest do
  use ExUnit.Case, async: true

  test "atualiza corretamente um valor em um mapa aninhado" do
    mapa = %{a: %{b: %{c: 1}}}
    assert AtualizarMapaAninhado.run(mapa, [:a, :b, :c], 2) == %{a: %{b: %{c: 2}}}
  end

  test "cria uma estrutura de mapa aninhada se ela não existir" do
    assert AtualizarMapaAninhado.run(%{}, [:x, :y], 10) == %{x: %{y: 10}}
  end
end
