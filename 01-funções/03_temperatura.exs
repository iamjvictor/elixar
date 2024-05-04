ExUnit.start()

defmodule Temperatura do
  @doc """
  A função de conversão de ˚C para ˚F e K deve
  receber um número inteiro que representa a medida
  celsius como *32˚C* e devolver a temperatura na
  medida informada pelo segundo parâmetro.

  Para converter de ˚C para ˚F, a fórmula se dá por:
  `˚C / 5 = (˚F - 32) / 9`

  Já para converter de ˚C para K, a fórmul se dá por:
  `K = ˚C + 273.15`

  ## Dicas
  - [`Kernel.//2`](https://hexdocs.pm/elixir/Kernel.html#//2)
  - [`Kernel.*/2`](https://hexdocs.pm/elixir/Kernel.html#*/2)
  """
  @spec run(integer, :fahrenheit | :kelvin) :: float | :error
  def run(celsius, :fahrenheit) when is_integer(celsius) do
    Float.round((celsius / 5) * 9 + 32, 1)
  end

  def run(celsius, :kelvin) when is_integer(celsius) do
    celsius + 273.15
  end

  def run(_, _), do: :error
end

defmodule TemperaturaTest do
  use ExUnit.Case, async: true

  describe "quando recebe um valor de temperatura e uma medida para conversão" do
    test "a função não deve aceitar valores nulos" do
      assert :error == Temperatura.run(nil, :kelvin)
    end

    test "a função deve apenas aceitar valores inteiros" do
      assert :error == Temperatura.run(12.1, :kelvin)
      assert :error == Temperatura.run("string", :fahrenheit)
    end

    test "a função deve retornar o valor em Fahrenheit, respeitando a medida" do
      assert 98.6 == Temperatura.run(37, :fahrenheit)
    end

    test "a função deve retornar o valor em Kelvin, respeitando a medida" do
      assert 298.15 == Temperatura.run(25, :kelvin)
    end
  end
end
