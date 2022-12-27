import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/util/mungroad_upload_images.dart';

class FileButton extends ConsumerStatefulWidget {
  const FileButton({
    Key? key,
    required this.child,
    required this.images,
  }) : super(key: key);

  final Widget child;
  final MungroadUploadImages images;

  @override
  FileButtonState createState() => FileButtonState();
}

class FileButtonState extends ConsumerState<FileButton> {
  final ImagePicker _picker = ImagePicker();

  void getImages() async {
    final List<XFile> images = await _picker.pickMultiImage();

    if (images.isNotEmpty) {
      widget.images.setImages64(images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImages,
      child: widget.child,
    );
  }
}
