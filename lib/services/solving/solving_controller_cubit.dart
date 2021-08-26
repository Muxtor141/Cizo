import 'package:flutter_bloc/flutter_bloc.dart';

class SolvingControllerCubit extends Cubit<bool> {
  SolvingControllerCubit() : super(false);

  void startSolving() {
    emit(true);
  }

  void finishSolving() {
    emit(false);
  }
}
