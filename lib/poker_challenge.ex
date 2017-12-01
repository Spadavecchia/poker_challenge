defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """

  def value_card_sorted_by_frequencies(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> Stats.frequencies()
    # sort frequencies for keys then for values (first freq, then value)
    |> Enum.sort(fn ({k1, v1}, {k2, v2}) -> if v1 == v2, do: k1 > k2, else: v1 > v2 end)
    |> Enum.map(&(elem(&1, 0)))
  end

  def compare_by_card_values(w, b) do
    sw = value_card_sorted_by_frequencies(w)
    sb = value_card_sorted_by_frequencies(b)
    do_compare_card_values(sw, sb)
  end

  def do_compare_card_values([], []), do: "Draw!"
  def do_compare_card_values([wc | _], [bc | _]) when wc > bc, do: "White wins"
  def do_compare_card_values([wc | _], [bc | _]) when wc < bc, do: "Black wins"
  def do_compare_card_values([_ | w], [_ | b]), do: do_compare_card_values(w, b)

  def winner(w, b) do
    cond do
      Hand.hand_value(w) > Hand.hand_value(b) -> "White wins"
      Hand.hand_value(w) < Hand.hand_value(b) -> "Black wins"
      true                                    -> compare_by_card_values(w, b)
    end
  end
end


