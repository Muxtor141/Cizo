import 'package:flutter_bloc/flutter_bloc.dart';

class IsLoginCubit extends Cubit<bool> {
  IsLoginCubit() : super(true);

  


  void loginTrue()=>emit(true);
   void loginFalse()=>emit(false);
}
