import 'dart:convert';

class MockDataQuizzes {
  var cardList = [
    {
      'owner': "Tom Cruise",
      "quizCode": "THU73R",
      "quizName": "Astronomy Quiz V",
      "quizAmount": 5,
      "quizTime": 50,
    },
    {
      'owner': "Brad Pitt",
      "quizCode": "THU73R",
      "quizName": "Astronomy Quiz V",
      "quizAmount": 2,
      "quizTime": 30,
    },
    {
      'owner': "Anjelina Jolie",
      "quizCode": "THU73R",
      "quizName": "Astronomy Quiz V",
      "quizAmount": 4,
   "quizTime": 40,
    },
    {
      'owner': "Jim Carry",
      "quizCode": "THU73R",
      "quizName": "Astronomy Quiz V",
      "quizAmount": 8,
     "quizTime": 35,
    },
    {
      'owner': "Olga Kurylenko",
      "quizCode": "THU73R",
      "quizName": "Astronomy Quiz V",
      "quizAmount": 5,
      "quizTime": 20,
    },
  ];

  var publicCardList = [
    {
      'owner': "Public",
      "quizCode": "KJI23P",
      "quizName": "Geography Quiz V",
      "quizAmount": 5,
      "date": DateTime.now().toString(),
      "quizTime": 40,
    },
    {
      'owner': "Public",
      "quizCode": "KJI23P",
      "quizName": "Geography Quiz V",
      "quizAmount": 2,
      "date": DateTime.now().toString(),
     "quizTime": 40,
    },
    {
      'owner': "Public",
      "quizCode": "KJI23P",
      "quizName": "Geography Quiz V",
      "quizAmount": 4,
      "date": DateTime.now().toString(),
     "quizTime": 40,
    },
    {
      'owner': "Public",
      "quizCode": "KJI23P",
      "quizName": "Geography Quiz V",
      "quizAmount": 8,
      "date": DateTime.now().toString(),
     "quizTime": 40,
    },
    {
      'owner': "Public",
      "quizCode": "KJI23P",
      "quizName": "Geography Quiz V",
      "quizAmount": 5,
      "date": DateTime.now().toString(),
      "quizTime": 40,
    },
  ];
// first answer in answerslist in questions list is always right for our logic,
// for example in THU73R ,right answer is Jupiter

  var list = [
    {
      "solvingTime": 40,
      "quizName": "Astronomy Quiz V",
      "quizCode": "THU73R",
      "questions": [
        {
          "question": "What is the biggest planet in solar system?1",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?2",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?3",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?4",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?5",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?6",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?7",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?8",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?9",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        },
        {
          "question": "What is the biggest planet in solar system?10",
          "answers": ["Jupiter", "Uranus", "Mercury", "Venera"]
        }
      ]
    },
  ];

  List<Map<String,dynamic>> leaderList = [
    {"name":"Stive Rogers",
    "score":900,
    "image":"good",

    },
     {"name":"Jerry Niktons",
    "score":1000,
    "image":"good",

    },
     {"name":"Aurora Kimberman",
    "score":600,
    "image":"good",

    },
     {"name":"Archer Stafford",
    "score":200,
    "image":"good",

    },
     {"name":"Mike Wilson",
    "score":500,
    "image":"good",

    },
     {"name":"Mariam Nicolson",
    "score":1200,
    "image":"good",

    },
  ];


  var publicQuestions = [
    {
      "solvingTime": 40,
      "quizName": "Geography Quiz V",
      "quizCode": "KJI23P",
      "questions": [
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
        {
          "question": "What is the biggest mountain in the Earth?1",
          "answers": ["Himolay", "Mauna-Kea", "Alphs", "Tyan-Shan"]
        },
      ]
    },
  ];

  Future<dynamic> getCardsList() async {
    var quizCard = json.encode(cardList);

    return quizCard;
  }

  Future<dynamic> getQuestionsList() async {
    var questions = json.encode(list);

    return questions;
  }

  Future<dynamic> getPublicCardsList() async {
    var quizCard = json.encode(publicCardList);

    return quizCard;
  }

  Future<dynamic> getPublicQuestionsList() async {
    var questions = json.encode(publicQuestions);

    return questions;
  }
   Future<dynamic> getLeaders() async {
    var questions = json.encode(leaderList);

    return questions;
  }
}
