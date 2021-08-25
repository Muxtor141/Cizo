import 'package:cizo/parts/02.Onboarding/main.dart';
import 'package:cizo/parts/03-05.Auth/login_part.dart';
import 'package:cizo/parts/03-05.Auth/auth_main.dart';
import 'package:cizo/parts/03-05.Auth/signup_part.dart';
import 'package:cizo/parts/04.setup/main.dart';
import 'package:cizo/parts/08.home/home_main.dart';
import 'package:cizo/parts/08.home/quiz_found.dart';
import 'package:cizo/parts/08.home/quiz_not_found.dart';
import 'package:cizo/parts/leaderboard/leaderboard.dart';
import 'package:cizo/parts/profile/dialog.dart';
import 'package:cizo/parts/profile/profile_main.dart';
import 'package:cizo/parts/public-quiz/publics_main.dart';
import 'package:cizo/parts/quiz/quiz_main.dart';
import 'package:cizo/parts/quiz/result_screen.dart';
import 'package:cizo/services/home/fetchdata_main.dart';
import 'package:cizo/services/home/fetchdata_public.dart';
import 'package:cizo/services/home/main_events.dart';
import 'package:cizo/services/home/public_events.dart';
import 'package:cizo/services/onboarding/onboarding_bloc.dart';
import 'package:cizo/services/public/ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xffFAFAFA),
        scaffoldBackgroundColor: Color(0xffFAFAFA),
        primaryColorDark: Color(0xff323438),
        primaryColor: Color(0xff14C1FA),
        errorColor: Color(0xffF31629),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        'auth': (c) => AuthMain(),
        
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     child: MultiBlocProvider(
    //       providers: [
    //         BlocProvider<OnboardingPagingBloc>(
    //             create: (c) => OnboardingPagingBloc()),
    //         BlocProvider<FetchDataBLoc>(create: (c) => FetchDataBLoc()),
    //       ],
    //       child: HomeMain(),
    //     ),
    //   ),
    //   // This trailing comma makes auto-formatting nicer for build methods.
    // );


      return Container(
     child: Container(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<OnboardingPagingBloc>(
                create: (c) => OnboardingPagingBloc()),
                 BlocProvider<UpdateListCubit>(
                create: (c) => UpdateListCubit()),
                  BlocProvider<FetchPublicBLoc>(
                create: (c) => FetchPublicBLoc()..add(UpdatePublicCardList())),
            BlocProvider<FetchDataBLoc>(create: (c) => FetchDataBLoc()),
          ],
          child: HomeMain(),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
