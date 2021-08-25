class PublicCardModel {
  final String creator, quizCode, quizName;
  final int quizAmount;
  final String date;
  PublicCardModel(
      {required this.creator,
      required this.date,
      required this.quizAmount,
      required this.quizCode,
      required this.quizName});

  PublicCardModel.fromJson(Map<String, dynamic> json)
      : creator = json['owner'],
      date=json['date'],
        quizCode = json['quizCode'],
        quizName = json['quizName'],
        quizAmount = json['quizAmount'];

  Map<String, dynamic> toJson() => {
        'owner': creator,
        'quizCode': quizCode,
        'quizName': quizName,
        'quizAmount': quizAmount,
        'date':date
      };
}
