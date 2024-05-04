ExUnit.start()

defmodule EnumMap do

  @spec run(list(integer)) :: list(integer)
  def run(nums) do
    Enum.map(nums, &(&1 * 2))
  end
end


defmodule EnumMapTest do
  use ExUnit.Case, async: true

  test "duplica os valores de uma lista de inteiros" do
    assert EnumMap.run([1, 2, 3]) == [2, 4, 6]
  end
end
