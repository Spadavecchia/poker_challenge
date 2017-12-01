defmodule Hand do
  def card_frequencies(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> Stats.frequencies()
    |> Map.values()
  end

  def has_frequency_pattern?(hand, pattern) do
    hand
    |> card_frequencies()
    |> Enum.sort()
    |> Kernel.==(pattern)
  end

  def has_frequency_max?(hand, max) do
    hand
    |> card_frequencies()
    |> Enum.max()
    |> Kernel.==(max)
  end

  @doc """
  A hand is `pair` when 2 of the 5 cards in the hand have the same value
  """
  def pair?(hand), do: has_frequency_max?(hand ,2)

  @doc """
  A hand is `two pair` when contains 2 different pairs
  """
  def two_pairs?(hand), do: has_frequency_pattern?(hand, [1, 2, 2])

  @doc """
  A hand is `three of a kind` when three of the cards in the hand have the same value
  """
  def three_of_a_kind?(hand), do: has_frequency_max?(hand ,3)

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
  def full_house?(hand), do: has_frequency_pattern?(hand, [2, 3])

  @doc """
  A hand is `four of a kind` when contains 4 cards with the same value
  """
  def four_of_a_kind?(hand), do: has_frequency_max?(hand, 4)

  @doc """
  A hand is `straight flush` when contains 5 cards of the same suit
  with consecutive values
  """
  def straight_flush?(hand), do: flush?(hand) && straight?(hand)

  @doc """
  We can establish the hand value to numeric value to compare hands
  """
  def value(hand) do
    cond do
      Hand.straight_flush?(hand)  -> 8
      Hand.four_of_a_kind?(hand)  -> 7
      Hand.full_house?(hand)      -> 6
      Hand.flush?(hand)           -> 5
      Hand.straight?(hand)        -> 4
      Hand.three_of_a_kind?(hand) -> 3
      Hand.two_pairs?(hand)       -> 2
      Hand.pair?(hand)            -> 1
      true                        -> 0
    end
  end
end
