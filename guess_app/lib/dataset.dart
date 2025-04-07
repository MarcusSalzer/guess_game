// separate variables
const countriesList = ["Sweden", "Norway", "China"];
const sportsList = [
  "Skiing",
  "Soccer",
  "Basketball",
  "Skateboard",
  "Golf",
  "Swimming"
];
const musicList = ["My heart will go on"];

/// available topics
// enum GameTopic { countries, sports, music }

// extension GameTopicExtension on GameTopic {
//   static const List<String> _names = ['Countries', 'Sports', 'Music'];

//   String get displayName => _names[index];
// }

/// available topics, with data
enum GameTopic {
  countries("Countries", countriesList),
  sports("Sports", sportsList),
  music("Music", musicList);

  const GameTopic(
    this.displayName,
    this.items,
  );

  final String displayName;
  final List<String> items;

  int get length => items.length;
}

// TODO enhanced Enum???
