defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """

  def compare_card_values([], []), do: "Draw!"
  def compare_card_values([wc | w], [bc | b]) do
    cond do
      Card.value(wc) > Card.value(bc) -> "White wins"
      Card.value(wc) < Card.value(bc) -> "Black wins"
      true                            -> compare_card_values(w, b)
    end
  end

  def winner(w, b) do
    cond do
      Hand.hand_value(w) > Hand.hand_value(b) -> "White wins"
      Hand.hand_value(w) < Hand.hand_value(b) -> "Black wins"
      true                                    -> compare_card_values(w, b)
    end
  end
end


