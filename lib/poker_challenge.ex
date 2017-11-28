defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """

  def card_frequencies(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> Stats.frequencies()
    |> Map.values()
  end

  @doc """
  A hand is `pair` when 2 of the 5 cards in the hand have the same value
  """
  def pair?(hand) do
    hand
    |> card_frequencies()
    |> Enum.max()
    |> Kernel.==(2)
  end

  @doc """
  A hand is `two pair` when contains 2 different pairs
  """
  def two_pairs?(hand) do
    hand
    |> card_frequencies()
    |> Enum.sort()
    |> Kernel.==([1, 2, 2])
  end

  @doc """
  A hand is `three of a kind` when three of the cards in the hand have the same value
  """
  def three_of_a_kind?(hand) do
    hand
    |> card_frequencies()
    |> Enum.max()
    |> Kernel.==(3)
  end
end
