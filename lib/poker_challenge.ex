defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """

  @doc """
  Returns a map from distinct items in `col` to the number of times they appear
  """
  def frequencies(col) do
    Enum.reduce(col, Map.new, fn c, acc -> Map.update(acc, c, 1, &(&1+1)) end)
  end

  @doc """
  A hand is `pair` when 2 of the 5 cards in the hand have the same value
  """
  def pair?(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> frequencies()
    |> Map.values
    |> Enum.max
    |> Kernel.== 2
  end

  @doc """
  A hand is `two pair` when contains 2 different pairs
  """
  def two_pairs?(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> frequencies()
    |> Map.values
    |> Enum.sort
    |> Kernel.== [1, 2, 2]
  end

  @doc """
  A hand is `three of a kind` when three of the cards in the hand have the same value
  """
  def three_of_a_kind?(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> frequencies()
    |> Map.values
    |> Enum.max
    |> Kernel.== 3
  end
end
