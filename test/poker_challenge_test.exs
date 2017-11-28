defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  @simple_hand ['8C', '5D', '4D', '3S', '2H']
  @pair_hand ['6C', '5D', '5H', '4D', '3S']
  @two_pairs_hand ['6C', '5D', '5H', '4D', '4S']
  @three_of_a_kind_hand ['5C', '5D', '5H', '4D', '3S']
  @straight ['6C', '5D', '4H', '3D', '2S']
  @flush ['8C', '5C', '4C', '3C', '2C']
  @full_house ['5C', '5D', '5H', '4D', '4S']
  @four_of_a_kind ['2H', '2S', '2C', '2D', '7D']
  @straight_flush ['2H', '3H', '6H', '5H', '4H']

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

  test "straight" do
    refute PokerChallenge.straight?(@simple_hand)
    refute PokerChallenge.straight?(@pair_hand)
    assert PokerChallenge.straight?(@straight)
  end

  test "flush" do
    refute PokerChallenge.flush?(@simple_hand)
    refute PokerChallenge.flush?(@pair_hand)
    refute PokerChallenge.flush?(@straight)
    assert PokerChallenge.flush?(@flush)
  end

  test "full house" do
    refute PokerChallenge.full_house?(@simple_hand)
    refute PokerChallenge.full_house?(@pair_hand)
    refute PokerChallenge.full_house?(@straight)
    assert PokerChallenge.full_house?(@full_house)
  end

  test "four of a kind" do
    refute PokerChallenge.four_of_a_kind?(@simple_hand)
    refute PokerChallenge.four_of_a_kind?(@pair_hand)
    refute PokerChallenge.four_of_a_kind?(@full_house)
    assert PokerChallenge.four_of_a_kind?(@four_of_a_kind)
  end

  test "straight flush" do
    refute PokerChallenge.straight_flush?(@simple_hand)
    refute PokerChallenge.straight_flush?(@pair_hand)
    refute PokerChallenge.straight_flush?(@full_house)
    refute PokerChallenge.straight_flush?(@four_of_a_kind)
    assert PokerChallenge.straight_flush?(@straight_flush)
  end

  test "hand value" do
    assert PokerChallenge.hand_value(@pair_hand) < PokerChallenge.hand_value(@two_pairs_hand)
    assert PokerChallenge.hand_value(@two_pairs_hand) < PokerChallenge.hand_value(@three_of_a_kind_hand)
    assert PokerChallenge.hand_value(@three_of_a_kind_hand) < PokerChallenge.hand_value(@straight)
    assert PokerChallenge.hand_value(@straight) < PokerChallenge.hand_value(@flush)
    assert PokerChallenge.hand_value(@flush) < PokerChallenge.hand_value(@full_house)
    assert PokerChallenge.hand_value(@full_house) < PokerChallenge.hand_value(@four_of_a_kind)
    assert PokerChallenge.hand_value(@four_of_a_kind) < PokerChallenge.hand_value(@straight_flush)
  end
end