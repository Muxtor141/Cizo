import 'package:cizo/parts/auth/auth_main.dart';
import 'package:cizo/parts/home/home_main.dart';
import 'package:cizo/parts/onboarding/main.dart';
import 'package:cizo/parts/setup/countries.dart';
import 'package:cizo/parts/setup/main.dart';
import 'package:cizo/parts/splash/splash_screen.dart';
import 'package:cizo/services/auth/auth_bloc.dart';
import 'package:cizo/services/onboarding/onboardin_cubits.dart';
import 'package:cizo/services/setup/selected_country.dart';
import 'package:cizo/services/home/fetchdata_main.dart';
import 'package:cizo/services/home/fetchdata_public.dart';
import 'package:cizo/services/home/public_events.dart';
import 'package:cizo/services/onboarding/onboarding_bloc.dart';
import 'package:cizo/services/public/ui_cubit.dart';
import 'package:cizo/services/setup/select_country.dart';
import 'package:cizo/services/setup/setup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, Widget Function(BuildContext)> routeMap(BuildContext context) {

  return {

      'onboard':(c)=>MultiBlocProvider(providers: [
        BlocProvider(create: (c)=>OnboardCubit()..update())
      ],child: OnboardingMain()),


    'countries': (c) => MultiBlocProvider(providers: [
          BlocProvider(create: (c) {
    
            return SelectCountry()..updateList();
          }),
          BlocProvider.value(
              value: BlocProvider.of<SelectedCountryCubit>(context))
        ], child: CountriesListPage()),
    'auth': (c) => MultiBlocProvider(providers:[
       BlocProvider<AuthBloc>(
                create: (c) => AuthBloc()),
    ],child: AuthMain()),
    "/main": (c) => MultiBlocProvider(
          providers: [
            BlocProvider<OnboardingPagingBloc>(
                create: (c) => OnboardingPagingBloc()),
            BlocProvider<UpdateListCubit>(create: (c) => UpdateListCubit()),
            BlocProvider<FetchPublicBLoc>(
                create: (c) => FetchPublicBLoc()..add(UpdatePublicCardList())),
            BlocProvider<FetchDataBLoc>(create: (c) => FetchDataBLoc()),
          ],
          child: HomeMain(),
        ),
    ProfileSetup.routeName: (c) => MultiBlocProvider(
          providers: [
            BlocProvider<UploadImageCubit>(create: (c) => UploadImageCubit()),
            BlocProvider<SelectedCountryCubit>(
                create: (c) => SelectedCountryCubit()),
            BlocProvider<SelectCountry>(create: (c) => SelectCountry()),
          ],
          child:  ProfileSetup(),
        )
  };
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      routes: routeMap(context),
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
    //              BlocProvider<UpdateListCubit>(
    //             create: (c) => UpdateListCubit()),
    //               BlocProvider<FetchPublicBLoc>(
    //             create: (c) => FetchPublicBLoc()..add(UpdatePublicCardList())),

    //                BlocProvider<OnboardCubit>(
    //             create: (c) => OnboardCubit()..update()),

    //       ],
    //       child: OnboardingMain(),
    //     ),
    //   ),
    //   // This trailing comma makes auto-formatting nicer for build methods.
    // );

    return Container(
      child: Container(
        child: MultiBlocProvider(
          providers: [   BlocProvider<SelectedCountryCubit>(
                create: (c) => SelectedCountryCubit()),
                 BlocProvider<OnboardCubit>(
                create: (c) => OnboardCubit()..update()),
            BlocProvider<UploadImageCubit>(create: (c) => UploadImageCubit()),
            BlocProvider<OnboardingPagingBloc>(
                create: (c) => OnboardingPagingBloc()),
            BlocProvider<UpdateListCubit>(create: (c) => UpdateListCubit()),
            BlocProvider<FetchPublicBLoc>(
                create: (c) => FetchPublicBLoc()..add(UpdatePublicCardList())),
            BlocProvider<FetchDataBLoc>(create: (c) => FetchDataBLoc()),
          ],
          child: SplashScreen(),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
