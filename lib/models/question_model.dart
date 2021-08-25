class QuestionModel {
  final String code, name;
  final int questionTime;
  final List<dynamic> questionList;
  QuestionModel(
      {required this.code,
      required this.questionList,
      required this.name,
      required this.questionTime});

  QuestionModel.fromjson(Map<String, dynamic> json)
      : code = json['quizCode'],
        name = json['quizName'],
        questionList = json['questions'],//list of ,maps with 1 list of answers
        questionTime = json['solvingTime'];

  Map<String, dynamic> toJson() =>
      {'quizName': name, 'quizCode': code, 'questions': questionList, 'solvingTime': questionTime};
}
