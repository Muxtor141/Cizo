class QuizCardModel {
  final String creator, quizCode, quizName;
  final int quizAmount;
  QuizCardModel(
      {required this.creator,
      required this.quizAmount,
      required this.quizCode,
      required this.quizName});

  QuizCardModel.fromJson(Map<String, dynamic> json)
      : creator = json['owner'],
        quizCode = json['quizCode'],
        quizName = json['quizName'],
        quizAmount = json['quizAmount'];

  Map<String, dynamic> toJson() => {
        'owner': creator,
        'quizCode': quizCode,
        'quizName': quizName,
        'quizAmount': quizAmount
      };
}
