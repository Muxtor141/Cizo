import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDialogCubit extends Cubit<double> {
  HomeDialogCubit() : super(0);
  void addBlur() {
    emit(10);
  }
  void removeBlur() {
    emit(0);
  }
}
