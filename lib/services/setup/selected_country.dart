import 'package:bloc/bloc.dart';

class SelectedCountryCubit extends Cubit<String> {
  SelectedCountryCubit() : super("");

  void updateCountry(String country) {
    emit(country);
  }
}
