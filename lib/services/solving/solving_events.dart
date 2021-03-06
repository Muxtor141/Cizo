import 'dart:convert';

import 'package:cizo/models/question_model.dart';
import 'package:cizo/models/single_question_model.dart';

import '../mock_data.dart';

class SolvingEvents {
  Future<List<SingleQuestionModel>> getSingleQuiz(
      String code, bool type) async {
    final db = MockDataQuizzes();

    // final response = await http.get(Uri.parse("someUrl"));
    // if (response.statusCode == 200) {

    // } else {
    //   throw SocketException('No internet');
    // }
    var response;
    if (type == false) {
      response = await db.getQuestionsList();
    } else {
       response = await db.getPublicQuestionsList();
    }

    List responseList = jsonDecode(response);

    var question =
        responseList.firstWhere((element) => element['quizCode'] == code);

    List<SingleQuestionModel> newList = [];
    for (var singlequestion in question['questions']) {
      var wrongAnswers = singlequestion['answers'];
      var item = SingleQuestionModel(
          question: singlequestion['question'],
          rightAnswer: singlequestion['answers'][0],
          wrongAnswers: wrongAnswers.getRange(1, 4).toList());
      newList.add(item);
    }

    return newList;
  }
}

class UpdateIndex extends SolvingEvents {
  final String model;
  final bool type;
  UpdateIndex(this.model, this.type);
}

class NextQuestion extends SolvingEvents {}
