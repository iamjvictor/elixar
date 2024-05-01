ExUnit.start()

defmodule NumeroPorExtenso do
  @spec run(integer()) :: String.t()
  def run(num) when num >= 0 and num < 20, do: unidades(num)
  def run(num) when num >= 20 and num < 100, do: dezenas(num)
  def run(num) when num >= 100 and num < 1000, do: centenas(num)
  def run(num) when num >= 1000 and num < 10000, do: milhares(num)

  defp unidades(0), do: "zero"
  defp unidades(1), do: "um"
  defp unidades(2), do: "dois"
  defp unidades(3), do: "três"
  defp unidades(4), do: "quatro"
  defp unidades(5), do: "cinco"
  defp unidades(6), do: "seis"
  defp unidades(7), do: "sete"
  defp unidades(8), do: "oito"
  defp unidades(9), do: "nove"
  defp unidades(10), do: "dez"
  defp unidades(11), do: "onze"
  defp unidades(12), do: "doze"
  defp unidades(13), do: "treze"
  defp unidades(14), do: "quatorze"
  defp unidades(15), do: "quinze"
  defp unidades(16), do: "dezesseis"
  defp unidades(17), do: "dezessete"
  defp unidades(18), do: "dezoito"
  defp unidades(19), do: "dezenove"

  defp dezenas(num) do
    dezena = div(num, 10)
    resto = rem(num, 10)
    case dezena do
      2 -> "vinte" <> concatena_resto(resto)
      3 -> "trinta" <> concatena_resto(resto)
      4 -> "quarenta" <> concatena_resto(resto)
      5 -> "cinquenta" <> concatena_resto(resto)
      6 -> "sessenta" <> concatena_resto(resto)
      7 -> "setenta" <> concatena_resto(resto)
      8 -> "oitenta" <> concatena_resto(resto)
      9 -> "noventa" <> concatena_resto(resto)
      _ -> unidades(resto)
    end
  end

  defp concatena_resto(0), do: ""
  defp concatena_resto(resto), do: " e " <> unidades(resto)

  defp centenas(num) do
    centena = div(num, 100)
    resto = rem(num, 100)
    case centena do
      1 -> "cento" <> concatena_dezena(resto)
      2 -> "duzentos" <> concatena_dezena(resto)
      3 -> "trezentos" <> concatena_dezena(resto)
      4 -> "quatrocentos" <> concatena_dezena(resto)
      5 -> "quinhentos" <> concatena_dezena(resto)
      6 -> "seiscentos" <> concatena_dezena(resto)
      7 -> "setecentos" <> concatena_dezena(resto)
      8 -> "oitocentos" <> concatena_dezena(resto)
      9 -> "novecentos" <> concatena_dezena(resto)
      _ -> dezenas(resto)
    end
  end

  defp concatena_dezena(0), do: ""
  defp concatena_dezena(resto), do: " e " <> dezenas(resto)

  defp milhares(num) do
    milhar = div(num, 1000)
    resto = rem(num, 1000)
    case milhar do
      1 -> "mil" <> concatena_centena(resto)
      _ -> if resto == 0, do: "mil", else: "dois mil" <> concatena_centena(resto)
    end
  end

  defp concatena_centena(0), do: ""
  defp concatena_centena(resto), do: " e " <> centenas(resto)
end

defmodule NumeroPorExtensoTest do
  use ExUnit.Case, async: true

  test "converte números pequenos por extenso" do
    assert NumeroPorExtenso.run(5) == "cinco"
    assert NumeroPorExtenso.run(13) == "treze"
  end

  test "converte números com dezenas por extenso" do
    assert NumeroPorExtenso.run(21) == "vinte e um"
    assert NumeroPorExtenso.run(99) == "noventa e nove"
  end

  test "converte centenas por extenso" do
    assert NumeroPorExtenso.run(101) == "cento e um"
    assert NumeroPorExtenso.run(200) == "duzentos"
  end

  test "converte milhares por extenso" do
    assert NumeroPorExtenso.run(1001) == "mil e um"
    assert NumeroPorExtenso.run(2020) == "dois mil e vinte"
  end
end
