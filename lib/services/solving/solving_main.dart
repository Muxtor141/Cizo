import 'package:cizo/models/question_model.dart';
import 'package:cizo/models/single_question_model.dart';
import 'package:cizo/services/solving/solving_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SolvingBloc extends Bloc<SolvingEvents, SingleQuestionModel> {
  SolvingBloc()
      : super(SingleQuestionModel(
            question: "", rightAnswer: "", wrongAnswers: [],));

  List<SingleQuestionModel> list = [];
  int currentIndex = 0;


  @override
  Stream<SingleQuestionModel> mapEventToState(SolvingEvents event) async* {
    if (event is UpdateIndex) {
      list = await event.getSingleQuiz(event.model,event.type);
      yield list[currentIndex];
    }
    if (event is NextQuestion) {
      if (currentIndex != list.length - 1) {
        currentIndex++;
        yield list[currentIndex];
        print("QUESTION CHANGED TO $currentIndex");
      } else {
        print('QUIZ END');
      }
    }
  }
}
