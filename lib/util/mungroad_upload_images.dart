import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../constant.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';

class MungroadUploadImages {
  List<XFile> images;
  late List<File> imageFiles = [];

  void clearImages() async {
    imageFiles = [];
    images = [];
  }

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

  Future<FormData> uploadImages(
    int category,
    int targetId,
    int? parentId,
  ) async {
    final String typeString = mungroadTypeEng[category]!;

    List<MultipartFile> uploadList = [];
    if (typeString.isNotEmpty) {
      for (int i = 0, leng = imageFiles.length; i < leng; i++) {
        final File currentFile = imageFiles[i];
        final XFile currentXFile = images[i];
        final String extention = path.extension(currentFile.path);
        int nowDateTime = DateTime.now().millisecondsSinceEpoch;
        String fileName = '';
        if (['accommodation', 'restaurant', 'notice', 'daily', 'profile']
            .contains(typeString)) {
          fileName = '${typeString}_${targetId}_${i}_$nowDateTime$extention';
        } else if (['rooms', 'exposure_menu'].contains(typeString)) {
          fileName =
              '${typeString}_${parentId}_${targetId}_${i}_$nowDateTime$extention';
        }

        uploadList.add(
          await MultipartFile.fromFile(
            currentXFile.path,
            filename: fileName,
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      }
    }
    return FormData.fromMap({
      'category': category.toString(),
      'length': uploadList.length.toString(),
      'files': uploadList,
    });
  }

  MungroadUploadImages(this.images);
}
