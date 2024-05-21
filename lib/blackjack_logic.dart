class Card {
  final String suit;
  final String rank;
  final int value;

  Card(this.suit, this.rank, this.value);
}

class Deck {
  List<Card> _cards = [];

  Deck() {
    _generateDeck();
    _shuffle();
  }

  void _generateDeck() {
    const suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades'];
    const ranks = [
      '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'
    ];
    const values = {
      '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '10': 10,
      'J': 10, 'Q': 10, 'K': 10, 'A': 11
    };

    for (var suit in suits) {
      for (var rank in ranks) {
        _cards.add(Card(suit, rank, values[rank]!)); //! oznacava null safety, tj. siguran sam da values[rank] nece biti null
      }
    }
  }

  void _shuffle() {
    _cards.shuffle();
  }

  Card drawCard() {
    return _cards.removeLast();
  }
}