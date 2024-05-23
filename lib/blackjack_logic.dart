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

class BlackjackGame {
  Deck _deck = Deck();
  List<Card> _playerHand = [];
  List<Card> _dealerHand = [];

  void startGame() {
    _playerHand = [_deck.drawCard(), _deck.drawCard()];
    _dealerHand = [_deck.drawCard(), _deck.drawCard()];
  }

  void playerHit() {
    _playerHand.add(_deck.drawCard());
  }

  void dealerHit() {
    while (_calculateHandValue(_dealerHand) < 17) {
      _dealerHand.add(_deck.drawCard());
    }
  }

  int _calculateHandValue(List<Card> hand) {
    int value = hand.fold(0, (sum, card) => sum + card.value);
    int aces = hand.where((card) => card.rank == 'A').length;

    while (value > 21 && aces > 0) {
      value -= 10;
      aces--;
    }

    return value;
  }

  String checkOutcome() {
    int playerValue = _calculateHandValue(_playerHand);
    int dealerValue = _calculateHandValue(_dealerHand);

    if (playerValue > 21) return 'Player Busts!';
    if (dealerValue > 21) return 'Dealer Busts! Player Wins!';
    if (playerValue == dealerValue) return 'Tie!';
    if (playerValue > dealerValue) return 'Player Wins!';
    return 'Dealer Wins!';
  }

  List<Card> get playerHand => _playerHand;
  List<Card> get dealerHand => _dealerHand;
}