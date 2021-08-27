import 'package:bloc/bloc.dart';
import 'package:cizo/services/auth/signup_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthBloc extends Bloc<Authentication, bool> {
  AuthBloc() : super(false);

  @override
  Stream<bool> mapEventToState(Authentication event) async* {
    if (event is SignUp) {
      await event.registrateUser(event.email, event.password);
    }
  }
}
