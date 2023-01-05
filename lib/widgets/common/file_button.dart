import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/util/mungroad_upload_images.dart';

class FileButton extends ConsumerStatefulWidget {
  const FileButton({
    Key? key,
    required this.child,
    required this.images,
    required this.onUpload,
    required this.multi,
  }) : super(key: key);

  final Widget child;
  final MungroadUploadImages images;
  final Function onUpload;
  final bool multi;

  @override
  FileButtonState createState() => FileButtonState();
}

class FileButtonState extends ConsumerState<FileButton> {
  final ImagePicker _picker = ImagePicker();

  void getImages() async {
    List<XFile> images = [];
    if (widget.multi) {
      images = await _picker.pickMultiImage();
    } else {
      widget.images.clearImages();

      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        images.add(image);
      }
    }

    if (images.isNotEmpty) {
      widget.images.setImages64(images);
      widget.onUpload();
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
