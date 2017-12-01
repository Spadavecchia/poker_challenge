defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  @simple          Enum.shuffle(['8C', '5D', '4D', '3S', '2H'])
  @pair            Enum.shuffle(['6C', '5D', '5H', '4D', '3S'])
  @two_pairs       Enum.shuffle(['6C', '5D', '5H', '4D', '4S'])
  @three_of_a_kind Enum.shuffle(['5C', '5D', '5H', '4D', '3S'])
  @straight        Enum.shuffle(['6C', '5D', '4H', '3D', '2S'])
  @straight_high   Enum.shuffle(['AC', 'KD', 'QH', 'JD', 'TS'])
  @flush           Enum.shuffle(['8C', '5C', '4C', '3C', '2C'])
  @full_house      Enum.shuffle(['5C', '5D', '5H', '4D', '4S'])
  @four_of_a_kind  Enum.shuffle(['2H', '2S', '2C', '2D', '7D'])
  @straight_flush  Enum.shuffle(['2H', '3H', '6H', '5H', '4H'])

  test "pair hand" do
    refute Hand.pair?(@simple)
    assert Hand.pair?(@pair)
  end

  test "two pairs hand" do
    refute Hand.two_pairs?(@simple)
    refute Hand.two_pairs?(@pair)
    assert Hand.two_pairs?(@two_pairs)
  end

  test "three of a kind" do
    refute Hand.two_pairs?(@simple)
    refute Hand.two_pairs?(@pair)
    assert Hand.three_of_a_kind?(@three_of_a_kind)
  end

  test "straight" do
    refute Hand.straight?(@simple)
    refute Hand.straight?(@pair)
    assert Hand.straight?(@straight)
    assert Hand.straight?(@straight_high)
  end

  test "flush" do
    refute Hand.flush?(@simple)
    refute Hand.flush?(@pair)
    refute Hand.flush?(@straight)
    assert Hand.flush?(@flush)
  end

  test "full house" do
    refute Hand.full_house?(@simple)
    refute Hand.full_house?(@pair)
    refute Hand.full_house?(@straight)
    assert Hand.full_house?(@full_house)
  end

  test "four of a kind" do
    refute Hand.four_of_a_kind?(@simple)
    refute Hand.four_of_a_kind?(@pair)
    refute Hand.four_of_a_kind?(@full_house)
    assert Hand.four_of_a_kind?(@four_of_a_kind)
  end

  test "straight flush" do
    refute Hand.straight_flush?(@simple)
    refute Hand.straight_flush?(@pair)
    refute Hand.straight_flush?(@full_house)
    refute Hand.straight_flush?(@four_of_a_kind)
    assert Hand.straight_flush?(@straight_flush)
  end

  test "hand value" do
    assert Hand.value(@pair)            < Hand.value(@two_pairs)
    assert Hand.value(@two_pairs)       < Hand.value(@three_of_a_kind)
    assert Hand.value(@three_of_a_kind) < Hand.value(@straight)
    assert Hand.value(@straight)        < Hand.value(@flush)
    assert Hand.value(@flush)           < Hand.value(@full_house)
    assert Hand.value(@full_house)      < Hand.value(@four_of_a_kind)
    assert Hand.value(@four_of_a_kind)  < Hand.value(@straight_flush)
  end
end
