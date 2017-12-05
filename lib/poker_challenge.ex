defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """
  @white_win_msg "White wins"
  @black_win_msg "Black wins"
  @draw_msg "Draw!"

  def show_message(msg, hand) do
    "#{msg} with #{Hand.description(hand)}"
  end

  def relative_value_of_hand(hand) do
    hand
    |> Enum.map(&Card.value/1)
    |> Stats.frequencies()
    # sort frequencies for keys then for values (first freq, then value)
    |> Enum.sort(fn ({k1, v1}, {k2, v2}) -> if v1 == v2, do: k1 > k2, else: v1 > v2 end)
    |> Enum.map(&(elem(&1, 0)))
  end

  def winner_by_card_values(w, b) do
    rvw = relative_value_of_hand(w)
    rvb = relative_value_of_hand(b)
    case compare_relative_value(rvw, rvb) do
      {:white, wc, bc} -> "#{show_message(@white_win_msg, w)} - #{wc} over #{bc}"
      {:black, wc, bc} -> "#{show_message(@black_win_msg, b)} - #{bc} over #{wc}"
      {:draw, _, _} -> @draw_msg
    end
  end

  def compare_relative_value([], []), do: {:draw, nil, nil}
  def compare_relative_value([wc | _], [bc | _]) when wc > bc, do: {:white, wc, bc}
  def compare_relative_value([wc | _], [bc | _]) when wc < bc, do: {:black, wc, bc}
  def compare_relative_value([_ | w], [_ | b]), do: compare_relative_value(w, b)

  @doc """
  English text showing the winner hand between two hands
  """
  def winner(w, b) do
    cond do
      Hand.value(w) > Hand.value(b) -> show_message(@white_win_msg, w)
      Hand.value(w) < Hand.value(b) -> show_message(@black_win_msg, b)
      true                          -> winner_by_card_values(w, b)
    end
  end
end


