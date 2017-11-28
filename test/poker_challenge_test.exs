defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  test "suit of a card" do
    assert PokerChallenge.suit('9C') == "C"
    assert PokerChallenge.suit('9H') == "H"
    assert PokerChallenge.suit('9D') == "D"
    assert PokerChallenge.suit('9S') == "S"
  end

  test "value value of a card" do
    assert PokerChallenge.value('2C') == 2
    assert PokerChallenge.value('3C') == 3
    assert PokerChallenge.value('4H') == 4
    assert PokerChallenge.value('5H') == 5
    assert PokerChallenge.value('6D') == 6
    assert PokerChallenge.value('7D') == 7
    assert PokerChallenge.value('8D') == 8
    assert PokerChallenge.value('9S') == 9
    assert PokerChallenge.value('TC') == 10
    assert PokerChallenge.value('JH') == 11
    assert PokerChallenge.value('QD') == 12
    assert PokerChallenge.value('KS') == 13
    assert PokerChallenge.value('AS') == 14
  end
end
