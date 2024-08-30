enum GameType { numbers, nine, ninetyNine }

class GameModel {
  final int rounds;
  final int attempts;
  final GameType? gameType;

  GameModel({
    this.rounds = 10,
    this.attempts = 3,
    this.gameType,
  });
}
