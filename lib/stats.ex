defmodule Stats do
  @moduledoc """
  Generic statistical functions
  """

  @doc """
  Returns a map from distinct items in `col` to the number of times they appear
  """
  def frequencies(col) do
    Enum.reduce(col, Map.new, fn c, acc -> Map.update(acc, c, 1, &(&1+1)) end)
  end
end
