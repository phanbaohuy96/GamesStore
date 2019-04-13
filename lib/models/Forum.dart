
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

class Forum{
  final String title, imagePath, rank, threads, subs;
  final List<Topic> topics;

  Forum({this.title, this.imagePath, this.rank, this.topics, this.threads, this.subs});
}

final fortnite = new Forum(
  title: "Fornite",
  imagePath: "assets/images/fortnite.jpg",
  rank: "32",
  threads: "80",
  topics: fortniteTopic,
  subs: "1M+"
);

final pubg = new Forum(
  title: "PUBG",
  imagePath: "assets/images/pubg.jpg",
  rank: "60",
  threads: "80",
  topics: fortniteTopic,
  subs: "500M+"
);

final forums = [
  fortnite,
  pubg
];