defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  @high_card ['8C', '5D', '4D', '3S', '2H']
  @pair_low_value ['6C', '5D', '5H', '4D', '3S']
  @hand_03 ['6C', '5D', '5H', '4D', '4S']
  @hand_04 ['5C', '5D', '5H', '4D', '3S']
  @hand_05 ['6C', '5D', '4H', '3D', '2S']
  @hand_06 ['AC', 'KD', 'QH', 'JD', 'TS']
  @hand_07 ['8C', '5C', '4C', '3C', '2C']
  @hand_08 ['5C', '5D', '5H', '4D', '4S']
  @hand_09 ['2H', '2S', '2C', '2D', '7D']
  @hand_10 ['2H', '3H', '6H', '5H', '4H']

  test "check the hand winner" do
    assert PokerChallenge.winner(@pair_low_value, @high_card) == "White wins"
    assert PokerChallenge.winner(@high_card, @pair_low_value) == "Black wins"
  end
end
