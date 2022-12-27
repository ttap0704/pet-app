import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class MungroadUploadImages {
  List<XFile> images;
  late List<String> images64 = [];

  void setImages64(List<XFile> currentImegas) async {
    List<String> tmpImages64 = [...images64];

    for (int i = 0, leng = currentImegas.length; i < leng; i++) {
      final List<int> bytes = await currentImegas[i].readAsBytes();
      String img64 = base64Encode(bytes);
      tmpImages64.add(
        img64,
      );
    }

    images64 = [...tmpImages64];
    images = [...images, ...currentImegas];
  }

  MungroadUploadImages(this.images);
}
