
class Topic{
  final String question, recentAnswer, answerCount;

  Topic({this.question, this.recentAnswer, this.answerCount});
}

final fortniteTopic = [
  Topic(
    question: "Should we drop early",
    recentAnswer: "I don't know.",
    answerCount: "1234"
  ),
  Topic(
    question: "Quitting fortnite because of this",
    recentAnswer: "I don't know. I don't know. I don't know.",
    answerCount: "3662"
  )
];

class GameCard{
  final String title, imagePath, rank, threads, subs;
  final List<Topic> topics;

  GameCard({this.title, this.imagePath, this.rank, this.topics, this.threads, this.subs});
}

final fortnite = new GameCard(
  title: "Fornite",
  imagePath: "assets/images/fortnite.jpg",
  rank: "32",
  threads: "80",
  topics: fortniteTopic
);

final pubg = new GameCard(
    title: "Player unknow battle ground",
    imagePath: "assets/images/pubg.jpg",
    rank: "60",
    threads: "80",
    topics: fortniteTopic
);

final gameCards = [
  fortnite,
  pubg
];