class QuizCardModel {
  final String creator, quizCode, quizName;
  final int quizAmount;
  final int quizTime;
  QuizCardModel(
      {required this.creator,
      required this.quizAmount,
      required this.quizCode,
      required this.quizName,
      required this.quizTime});

  QuizCardModel.fromJson(Map<String, dynamic> json)
      : creator = json['owner'],
        quizTime = json['quizTime'],
        quizCode = json['quizCode'],
        quizName = json['quizName'],
        quizAmount = json['quizAmount'];

  Map<String, dynamic> toJson() => {
        'owner': creator,
        'quizTime': quizTime,
        'quizCode': quizCode,
        'quizName': quizName,
        'quizAmount': quizAmount
      };
}
