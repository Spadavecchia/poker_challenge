defmodule StatsTest do
  use ExUnit.Case
  doctest Stats

  test "frequencies in a collection" do
    assert Stats.frequencies([1, 2, 3, 3, 3, 4]) == %{1 => 1, 2 => 1, 3 => 3, 4 => 1}
  end
end
