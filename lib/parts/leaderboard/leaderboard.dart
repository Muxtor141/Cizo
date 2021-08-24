import 'package:cizo/parts/leaderboard/low_ranked.dart';
import 'package:cizo/parts/leaderboard/top_ranked.dart';
import 'package:flutter/material.dart';

class LeaderBoardMain extends StatelessWidget {
  const LeaderBoardMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    
    return Scaffold(backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [
        LeaderboardTop(),
        LeaderboardLow(),
      ],),
    );
  }
}