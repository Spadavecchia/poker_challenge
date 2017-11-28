defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  @simple_hand ['6C', '5D', '4D', '3S', '2H']
  @pair_hand ['6C', '5D', '5H', '4D', '3S']
  @two_pairs_hand ['6C', '5D', '5H', '4D', '4S']

  test "suit of a card" do
    assert PokerChallenge.suit('9C') == "C"
    assert PokerChallenge.suit('9H') == "H"
    assert PokerChallenge.suit('9D') == "D"
    assert PokerChallenge.suit('9S') == "S"
  end

  test "value of a card" do
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

  test "frequencies in a collection" do
    assert PokerChallenge.frequencies([1, 2, 3, 3, 3, 4]) == %{1 => 1, 2 => 1, 3 => 3, 4 => 1}
  end

  test "pair hand" do
    refute PokerChallenge.pair?(@simple_hand)
    assert PokerChallenge.pair?(@pair_hand)
  end

  test "two pairs hand" do
    refute PokerChallenge.two_pairs?(@simple_hand)
    refute PokerChallenge.two_pairs?(@pair_hand)
    assert PokerChallenge.two_pairs?(@two_pairs_hand)
  end
end
