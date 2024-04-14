ExUnit.start()
defmodule InversaoString do
  @doc """
  Inverte uma string fornecida utilizando recursão.
  """
  @spec run(String.t()) :: String.t()
  def run(""), do: ""
  def run(s) do
    run(String.slice(s, 1..-1)) <> String.at(s, 0)
  end
end

defmodule InversaoStringTest do
  use ExUnit.Case, async: true

  test "inverte uma string não vazia" do
    assert InversaoString.run("elixir") == "rixile"
  end

  test "retorna uma string vazia quando a entrada também for uma string vazia" do
    assert InversaoString.run("") == ""
  end
end
