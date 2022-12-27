import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_upload_images.dart';
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:pet_app/widgets/common/file_button.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';

class DailyRegistration extends ConsumerStatefulWidget {
  const DailyRegistration({Key? key}) : super(key: key);

  @override
  DailyRegistrationState createState() => DailyRegistrationState();
}

class DailyRegistrationState extends ConsumerState<DailyRegistration> {
  final List<Widget> _imageContents = [];
  final MungroadInputFormat _contents = MungroadInputFormat(
    'contents',
    '',
    'text',
    'daily',
    '일상을 적어주세요.',
    0,
  );

  final MungroadUploadImages _images = MungroadUploadImages([]);

  @override
  void didUpdateWidget(covariant DailyRegistration oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print(_images.images.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: '일상 공유하기',
      useBackButton: true,
      useFloatingButton: false,
      useNavBar: false,
      child: LayoutContents(
        child: Container(
          padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: multiplyFree(defaultSize, 15),
                child: CommonInput(
                  data: _contents,
                  expands: true,
                ),
              ),
              SizedBox(height: multiplyFree(defaultSize, 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ..._imageContents,
                  Container(
                    alignment: Alignment.center,
                    child: FileButton(
                      images: _images,
                      child: Container(
                        width: multiplyFree(defaultSize, 3),
                        height: multiplyFree(defaultSize, 3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(multiplyFree(defaultSize, 1.5)),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: multiplyFree(defaultSize, 2),
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: multiplyFree(defaultSize, 1)),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '등록하기',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
