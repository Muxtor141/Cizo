class PublicCardModel {
  final String creator, quizCode, quizName;
  final int quizAmount;
  final String date;
  final int quizTime;
  PublicCardModel(
      {required this.creator,
      required this.quizTime,
      required this.date,
      required this.quizAmount,
      required this.quizCode,
      required this.quizName});

  PublicCardModel.fromJson(Map<String, dynamic> json)
      : creator = json['owner'],
      quizTime=json['quizTime'],
        date = json['date'],
        quizCode = json['quizCode'],
        quizName = json['quizName'],
        quizAmount = json['quizAmount'];

  Map<String, dynamic> toJson() => {
        'owner': creator,
        'quizTime':quizTime,
        'quizCode': quizCode,
        'quizName': quizName,
        'quizAmount': quizAmount,
        'date': date
      };
}
