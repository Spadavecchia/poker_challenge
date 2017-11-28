defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  test "suit of a card" do
    assert PokerChallenge.suit('9C') == "C"
    assert PokerChallenge.suit('9H') == "H"
    assert PokerChallenge.suit('9D') == "D"
    assert PokerChallenge.suit('9S') == "S"
  end
end
