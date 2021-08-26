import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageCubit extends Cubit<String> {
  UploadImageCubit() : super("");

  late File _imageCard;
  final picker = ImagePicker();

  Future<XFile?> imageCamera() async {
    XFile? pickedFile =
        await picker.pickImage(imageQuality: 100, source: ImageSource.camera);

    return pickedFile;
  }

  Future<XFile?> imageGallery() async {
    XFile? pickedFile =
        await picker.pickImage(imageQuality: 100, source: ImageSource.gallery);

    return pickedFile;
  }

  void updateImage(int index) {
    if (index == 1) {
      imageCamera().then((value) => emit(value!.path));
    } else if (index == 2) {
      imageGallery().then((value) => emit(value!.path));
    }
  }
}
