import 'package:cizo/models/leader_model.dart';
import 'package:cizo/services/leaderboard/leaderboard_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderBoardBloc extends Bloc<LeaderBoardEvents, List> {
  LeaderBoardBloc() : super([]);

  List<LeaderModel> leaderList = [];

  String getPlace(int score) {
    var count = 0;
    var item = count.toString();
    var resultString = '';
    leaderList.forEach((element) {
      if (element.leaderScore > score) {
        count++;
      } else {}
    });

    switch (item[item.length - 1]) {
      case '1':
        resultString = "${count}st";
        break;
      case '2':
        resultString = "${count}nd";
        break;
      case '3':
        resultString = "${count}rd";
        break;
      default:
        {
          resultString = "${count}th";
        }
    }

    return resultString;
  }

  LeaderModel getSpecificLeader(int place) {
    List list = leaderList;
   list.sort((a, b) {
      return b.leaderScore.compareTo(a.leaderScore);
    });
    
    return list[place];
  }
   List<LeaderModel> getSortedLeaders() {
     //this function retrives list of leaders lower than 3 place 
    List<LeaderModel> list = leaderList;
   list.sort((a, b) {
      return b.leaderScore.compareTo(a.leaderScore);
    });
    
    return list.getRange(3, list.length-1).toList();
  }


  @override
  Stream<List> mapEventToState(LeaderBoardEvents event) async* {
    if (event is UpdateLeaderBoard) {
      leaderList = await event.getLeaders();
      yield leaderList;
    }

    if (event is AddLeader) {
      leaderList.add(event.model);
      yield leaderList;
    }
  }
}
