defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """
  import Hand

  def compare_card_values([], []), do: "Draw!"

  def winner(w, b) do
    cond do
      hand_value(w) > hand_value(b) -> "White wins"
      hand_value(w) < hand_value(b) -> "Black wins"
      true                          -> compare_card_values(w, b)
    end
  end
end


