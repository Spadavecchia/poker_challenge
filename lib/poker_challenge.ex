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

  @doc """
  A hand is `straight` when contains 5 cards with consecutive values
  """
  def straight?(hand) do
    vals = hand |> Enum.map(&Card.value/1) |> Enum.sort()
    low = List.first(vals)
    high = List.last(vals)
    vals == Enum.to_list(low..high)
  end

  @doc """
  A hand is `flush` when contains 5 cards of the same suit
  """
  def flush?(hand) do
    hand
    |> Enum.map(&Card.suit/1)
    |> Stats.frequencies()
    |> Map.values()
    |> Enum.max()
    |> Kernel.==(5)
  end

  @doc """
  A hand is `full house` when contains 3 cards of the same value,
  with the remaining 2 cards forming a pair.
  """
  def full_house?(hand) do
    hand
    |> card_frequencies()
    |> Enum.sort()
    |> Kernel.==([2, 3])
  end

  @doc """
  A hand is `four of a kind` when contains 4 cards with the same value
  """
  def four_of_a_kind?(hand) do
    hand
    |> card_frequencies()
    |> Enum.max()
    |> Kernel.==(4)
  end

  @doc """
  A hand is `straight flush` when contains 5 cards of the same suit
  with consecutive values
  """
  def straight_flush?(hand) do
    flush?(hand) && straight?(hand)
  end

end
