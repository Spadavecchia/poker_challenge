defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """
  @white_win_msg "White wins"
  @black_win_msg "Black wins"
  @draw_msg "Draw!"

  def relative_value_of_hand(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> Stats.frequencies()
    # sort frequencies for keys then for values (first freq, then value)
    |> Enum.sort(fn ({k1, v1}, {k2, v2}) -> if v1 == v2, do: k1 > k2, else: v1 > v2 end)
    |> Enum.map(&(elem(&1, 0)))
  end

  def winner_by_card_values(w, b) do
    sw = relative_value_of_hand(w)
    sb = relative_value_of_hand(b)
    compare_relative_value(sw, sb)
  end

  def compare_relative_value([], []), do: @draw_msg
  def compare_relative_value([wc | _], [bc | _]) when wc > bc, do: @white_win_msg
  def compare_relative_value([wc | _], [bc | _]) when wc < bc, do: @black_win_msg
  def compare_relative_value([_ | w], [_ | b]), do: compare_relative_value(w, b)

  @doc """
  English text showing the winner hand between two hands
  """
  def winner(w, b) do
    cond do
      Hand.value(w) > Hand.value(b) -> "#{@white_win_msg} with #{Hand.description(w)}"
      Hand.value(w) < Hand.value(b) -> @black_win_msg
      true                          -> winner_by_card_values(w, b)
    end
  end
end


