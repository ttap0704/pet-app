import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../constant.dart';
import 'package:path/path.dart' as path;

class MungroadUploadImages {
  List<XFile> images;
  late List<File> imageFiles = [];

  void setImages64(List<XFile> currentImegas) async {
    List<File> tmpFiles = [...imageFiles];

    for (int i = 0, leng = currentImegas.length; i < leng; i++) {
      final File file = File(currentImegas[i].path);

      tmpFiles.add(file);
    }

    imageFiles = [...tmpFiles];
    images = [...images, ...currentImegas];
  }

  void deleteImage(File file) {
    final int deleteIdx = imageFiles.indexOf(file);
    imageFiles.removeAt(deleteIdx);
    images.removeAt(deleteIdx);
  }

  void setImageFormData(
    int category,
    int targetId,
    int? parentId,
  ) {
    final String typeString = mungroadTypeEng[category]!;
    if (typeString.isNotEmpty) {
      for (int i = 0, leng = imageFiles.length; i < leng; i++) {
        final File currentFile = imageFiles[i];
        final String extention = path.extension(currentFile.path);
        int nowDateTime = DateTime.now().millisecondsSinceEpoch;
        String fileName = '';
        if (['accommodation', 'restaurant', 'notice', 'daily', 'profile']
            .contains(typeString)) {
          fileName =
              '${typeString}_${targetId}_${i}_${nowDateTime}.${extention}';
        } else if (['rooms', 'exposure_menu'].contains(typeString)) {
          fileName =
              '${typeString}_${parentId}_${targetId}_${i}_${nowDateTime}.${extention}';
        }

        print(fileName);
      }
    }
  }

  MungroadUploadImages(this.images);
}
