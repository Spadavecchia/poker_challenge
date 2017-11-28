defmodule PokerChallenge do
  @moduledoc """
  A Poker Game
  """

  @doc """
  Suit of a card
  """
  def suit([_ | s]) do
    to_string s
  end
end
