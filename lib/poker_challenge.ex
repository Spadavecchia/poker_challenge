defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """

  @doc """
  Suit of a card
  """
  def suit([_ | s]) do
    to_string s
  end

  @doc """
  Returns a map from distinct items in `col` to the number of times they appear
  """
  def frequencies(col) do
    Enum.reduce(col, Map.new, fn c, acc -> Map.update(acc, c, 1, &(&1+1)) end)
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

  def pair?(hand) do
    hand
    |> Enum.map(&value/1)
    |> frequencies()
    |> Map.values
    |> Enum.max
    |> Kernel.== 2
  end

  def two_pairs?(hand) do
    hand
    |> Enum.map(&value/1)
    |> frequencies()
    |> Map.values
    |> Enum.sort
    |> Kernel.== [1, 2, 2]
  end

  def three_of_a_kind?(hand) do
    hand
    |> Enum.map(&value/1)
    |> frequencies()
    |> Map.values
    |> Enum.max
    |> Kernel.== 3
  end
end
