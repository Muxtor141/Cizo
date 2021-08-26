import 'dart:convert';

import 'package:cizo/models/leader_model.dart';
import 'package:cizo/services/mock_data.dart';

class LeaderBoardEvents {
  Future<List<LeaderModel>> getLeaders() async {
    final db = MockDataQuizzes();

    var response = await db.getLeaders();
    List<dynamic> responseList = jsonDecode(response);

    List<LeaderModel> leaders = [];
    for (var element in responseList) {
      var item = LeaderModel(
          leaderName: element['name'], leaderScore: element['score']);
      leaders.add(item);
    }

    return leaders;
  }
}

class UpdateLeaderBoard extends LeaderBoardEvents {}

class AddLeader extends LeaderBoardEvents {
  final LeaderModel model;
  AddLeader(this.model);
}
