defmodule Cards do
  @moduledoc """
    Provides methods to deal a deck of cards
  """
  def hello do
    "hi there"
  end

  @doc """
    Returns a list of strings representing a deck
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determimne whether a deck contains a given card

    ## Examples

        iex(2)> deck = Cards.create_deck
        iex(3)> Cards.contains?(deck, "Ace of Spades")
        true

  """

  def contains?(deck, hand) do
    Enum.member?(deck,hand)
  end

  @doc """
      Divides a deck into a hand and the remainder of the deck.
      The `hand_size` argument indicates how many cards should
      be in the hand.
    ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
    """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "this file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end

# {hand, rest_of_deck} = Cards.deal(deck,4)
# [color1] = ["red"]
