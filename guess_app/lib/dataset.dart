// separate variables
const countriesList = ["Sweden", "Norway", "China"];
const sportsList = ["Skiing", "Soccer", "Basketball"];
const musicList = ["My heart will go on"];

/// available topics
enum GameTopic { countries, sports, music }

extension GameTopicExtension on GameTopic {
  static const List<String> _names = ['Countries', 'Sports', 'Music'];

  String get displayName => _names[index];
}


// TODO enhanced Enum???