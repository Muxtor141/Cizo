import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateListCubit extends Cubit<bool> {
  UpdateListCubit() : super(false);

  void makeAll() => emit(true);
  void makeRecent()=>emit(false);


  
}
