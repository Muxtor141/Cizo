import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUICubit extends Cubit<List<bool>> {
  SearchUICubit() : super([false, false]);
  List<bool> list = [false, false];
  void makExtended(bool value) {
    list[0] = value;
    return 
    emit(list);
  }
  void makWriting(bool value) {
    list[1] = value;
    return 
    emit(list);
  }
}
