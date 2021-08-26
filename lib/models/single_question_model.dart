class SingleQuestionModel {
  final String question, rightAnswer;
  final List wrongAnswers;

  SingleQuestionModel(
      {required this.question,
      required this.rightAnswer,
      required this.wrongAnswers,
   });
}
