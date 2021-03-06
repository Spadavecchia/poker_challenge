defmodule PokerChallengeTest do
  use ExUnit.Case
  doctest PokerChallenge

  @high_card_low        Enum.shuffle(['8C', '5D', '4D', '3S', '2H'])
  @high_card            Enum.shuffle(['8C', '7C', '4D', '3S', '2H'])
  @pair_low             Enum.shuffle(['6C', '5D', '5H', '4D', '2S'])
  @pair                 Enum.shuffle(['6C', '5D', '5H', '4D', '3S'])
  @pair_high            Enum.shuffle(['7C', '5D', '5H', '4D', '3S'])
  @three_of_a_kind_low  Enum.shuffle(['5C', '5D', '5H', '4D', '3S'])
  @three_of_a_kind      Enum.shuffle(['6C', '6D', '6H', '4D', '2S'])
  @three_of_a_kind_high Enum.shuffle(['6C', '6D', '6H', '4D', '3S'])
  @full_house           Enum.shuffle(['5C', '5D', '5H', '4D', '4S'])
  @full_house_low       Enum.shuffle(['5C', '5D', '5H', '3D', '3S'])

  test "check the hand winner" do
    assert PokerChallenge.winner(@pair_low, @high_card)                   == "White wins with a pair"
    assert PokerChallenge.winner(@high_card, @pair_low)                   == "Black wins with a pair"
    assert PokerChallenge.winner(@high_card, Enum.shuffle(@high_card))    == "Draw!"
    assert PokerChallenge.winner(@high_card, @high_card_low)              == "White wins with a high card - 7 over 5"
    assert PokerChallenge.winner(@pair_low, @pair)                        == "Black wins with a pair - 3 over 2"
    assert PokerChallenge.winner(@pair, @pair_high)                       == "Black wins with a pair - 7 over 6"
    assert PokerChallenge.winner(@three_of_a_kind_high, @three_of_a_kind) == "White wins with three of a kind - 3 over 2"
    assert PokerChallenge.winner(@three_of_a_kind, @three_of_a_kind_low)  == "White wins with three of a kind - 6 over 5"
    assert PokerChallenge.winner(@full_house, @full_house_low)            == "White wins with full house - 4 over 3"
  end
end
