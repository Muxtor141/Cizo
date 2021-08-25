import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAnswerCubit extends Cubit<int> {
  SelectAnswerCubit() : super(0);

  void update(int index) => emit(index);
}
