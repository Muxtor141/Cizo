import 'package:bloc/bloc.dart';
import 'package:cizo/services/onboarding/onboarding_events.dart';

class OnboardingPagingBloc extends Bloc<OnboardingPagingEvent, Map> {
  OnboardingPagingBloc()
      : super({
          "firstText": "Thank you for downloading our app! Enjoy all ",
          "secondText": "of Cizo features directly in your hands!",
          "thirdText": "Welcome to Cizo!",
          "currentPage": 0,
        });

  Map<String, dynamic> mainList = {
    "firstText": "Thank you for downloading our app! Enjoy all ",
    "secondText": "of Cizo features directly in your hands!",
    "thirdText": "Welcome to Cizo!",
    "currentPage": 0,
  };

  Map<String, dynamic> introMap = {
    "1.1": "Thank you for downloading our app! Enjoy all ",
    "1.2": "of Cizo features directly in your hands!",
    "1.3": "Welcome to Cizo!",
    "2.1": "Cizo is trusted by the teachers worldwide to ",
    "2.2": "maintain the student learning progress.",
    "2.3": "Trusted by Teachers",
    "3.1": "Gather all the poins as much as you can, be a ",
    "3.2": "superstar in your class with Cizo!",
    "3.3": "Get Ready, be a Superstar!",
  };

  void setText(int currentPageIndex) {}

  @override
  Stream<Map> mapEventToState(OnboardingPagingEvent event) async* {
    if (event is OnboardingUpdateText) {
      switch (mainList['currentPage']) {
        case 0:
          mainList['firstText'] = introMap['1.1'];
          mainList['secondText'] = introMap['1.2'];
          mainList['thirdText'] = introMap['1.3'];

          break;
        case 1:
          mainList['firstText'] = introMap['2.1'];
          mainList['secondText'] = introMap['2.2'];
          mainList['thirdText'] = introMap['2.3'];
          break;
        case 2:
          mainList['firstText'] = introMap['3.1'];
          mainList['secondText'] = introMap['3.2'];
          mainList['thirdText'] = introMap['3.3'];

          break;
      }

      yield mainList;
    }
    if (event is OnboardingUpdateIndex) {
      mainList.update('currentPage', (value) => value = event.index);
      if (event.index == 0) {
        mainList['firstText'] = introMap['1.1'];
        mainList['secondText'] = introMap['1.2'];
        mainList['thirdText'] = introMap['1.3'];
        yield mainList;
      }
      if (event.index == 1) {
        mainList['firstText'] = introMap['2.1'];
        mainList['secondText'] = introMap['2.2'];
        mainList['thirdText'] = introMap['2.3'];
        yield mainList;
      }
      if (event.index == 2) {
        mainList['firstText'] = introMap['3.1'];
        mainList['secondText'] = introMap['3.2'];
        mainList['thirdText'] = introMap['3.3'];
        yield mainList;
      }
      yield mainList;
    }
  }
}
