defmodule Hand do
  @straight_flush_value   8
  @four_of_a_kind_value   7
  @full_house_value       6
  @flush_value            5
  @straight_value         4
  @three_of_a_kind_value  3
  @two_pairs_value        2
  @pair_value             1

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
      Hand.straight_flush?(hand)  -> @straight_flush_value
      Hand.four_of_a_kind?(hand)  -> @four_of_a_kind_value
      Hand.full_house?(hand)      -> @full_house_value
      Hand.flush?(hand)           -> @flush_value
      Hand.straight?(hand)        -> @straight_value
      Hand.three_of_a_kind?(hand) -> @three_of_a_kind_value
      Hand.two_pairs?(hand)       -> @two_pairs_value
      Hand.pair?(hand)            -> @pair_value
      true                        -> 0
    end
  end

  @doc """
  English description of hand value
  """
  def description(hand) do
    cond do
      value(hand) == @straight_flush_value  -> "straight flush"
      value(hand) == @four_of_a_kind_value  -> "four of a kind"
      value(hand) == @full_house_value      -> "full house"
      value(hand) == @flush_value           -> "flush"
      value(hand) == @straight_value        -> "straight"
      value(hand) == @three_of_a_kind_value -> "three of a kind"
      value(hand) == @two_pairs_value       -> "two pairs"
      value(hand) == @pair_value            -> "a pair"
      true                                  -> "a high card"
    end
  end

end
