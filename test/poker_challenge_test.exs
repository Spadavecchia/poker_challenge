defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  @simple_hand ['6C', '5D', '4D', '3S', '2H']
  @pair_hand ['6C', '5D', '5H', '4D', '3S']
  @two_pairs_hand ['6C', '5D', '5H', '4D', '4S']
  @three_of_a_kind_hand ['5C', '5D', '5H', '4D', '3S']

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

  test "three of a kind" do
    refute PokerChallenge.two_pairs?(@simple_hand)
    refute PokerChallenge.two_pairs?(@pair_hand)
    assert PokerChallenge.three_of_a_kind?(@three_of_a_kind_hand)
  end
end
