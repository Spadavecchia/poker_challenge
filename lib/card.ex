defmodule Card do
  @moduledoc """
  Card functions
  """

  @doc """
  Suit of a card
  """
  def suit([_ | s]) do
    to_string s
  end

  @doc """
  Value of a card
  """
  def value([v | _]) do
    nv = v |> to_string() |> String.to_integer()
    case nv do
      x when x in 50..58 -> x - 48
      84 -> 10
      74 -> 11
      81 -> 12
      75 -> 13
      65 -> 14
      _ -> nil
    end
  end
end
