
import 'package:cloud_firestore/cloud_firestore.dart';

class Topic{
  final String question, recentAnswer, answerCount;

  Topic({this.question, this.recentAnswer, this.answerCount});

  Topic.fromMap(Map<dynamic, dynamic> map):
    assert(map["question"] != null),
    assert(map["recentAnswer"] != null),
    assert(map["answerCount"] != null),
    this.question = map["question"],
    this.recentAnswer = map["recentAnswer"],
    this.answerCount = map["answerCount"];
}

final fortniteTopic = [
  Topic(
    question: "Should we drop early?",
    recentAnswer: "I don't know.",
    answerCount: "1234"
  ),
  Topic(
    question: "Quitting fortnite because of this?",
    recentAnswer: "I don't know. I don't know. I don't know.I don't know. I don't know. I don't know.",
    answerCount: "3662"
  ),
  Topic(
    question: "Should we drop early?",
    recentAnswer: "I don't know.",
    answerCount: "1234"
  ),
  Topic(
    question: "Quitting fortnite because of this?",
    recentAnswer: "I don't know. I don't know. I don't know.I don't know. I don't know. I don't know.",
    answerCount: "3662"
  ),
  Topic(
    question: "Should we drop early?",
    recentAnswer: "I don't know.",
    answerCount: "1234"
  ),
  Topic(
    question: "Quitting fortnite because of this?",
    recentAnswer: "I don't know. I don't know. I don't know.I don't know. I don't know. I don't know.",
    answerCount: "3662"
  )
];

class Forum{
  final String title, imagePath, rank, threads, subs;
  final List<Topic> topics;

  Forum({this.title, this.imagePath, this.rank, this.topics, this.threads, this.subs});

  Forum.fromSnapshot(DocumentSnapshot snapshot) : this._fromMap(snapshot.data);

  Forum._fromMap(Map<String, dynamic> map):
    assert(map["title"] != null),
    assert(map["imagePath"] != null),
    assert(map["rank"] != null),
    assert(map["threads"] != null),
    assert(map["subs"] != null),
    assert(map["topics"] != null),
    this.title = map["title"],
    this.imagePath = map["imagePath"],
    this.rank = map["rank"],
    this.threads = map["threads"],
    this.subs = map["subs"],
    this.topics = (map["topics"] as List).map((topic) => Topic.fromMap(topic)).toList();
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
  imagePath: "assets/images/pubg2.jpg",
  rank: "60",
  threads: "80",
  topics: fortniteTopic,
  subs: "500M+"
);

final forums = [
  fortnite,
  pubg
];