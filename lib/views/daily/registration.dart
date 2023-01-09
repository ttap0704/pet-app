import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/http.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_dialog.dart';
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
  late List<Widget> _imageContents = [];
  final MungroadInputFormat _contents = MungroadInputFormat(
    'contents',
    '',
    'text',
    'daily',
    '일상을 적어주세요.',
    0,
  );

  final MungroadUploadImages _images = MungroadUploadImages([]);
  final double _previewSize = multiplyFree(defaultSize, 6);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPreview();
  }

  void setPreview() {
    setState(() {
      _imageContents = [
        ..._images.imageFiles.map((entry) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: _previewSize,
                height: _previewSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(multiply05(defaultSize)),
                  ),
                  image: DecorationImage(
                    image: FileImage(entry),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: multiplyFree(defaultSize, -0.5),
                right: multiplyFree(defaultSize, -0.5),
                child: Container(
                  width: multiplyFree(defaultSize, 1.5),
                  height: multiplyFree(defaultSize, 1.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(_previewSize) / 3 * 2,
                    ),
                    color: Colors.red,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _images.deleteImage(entry);
                      setPreview();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: multiplyFree(defaultSize, 1),
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList()
      ];
    });
  }

  void confirmCreateDaily() {
    if (_contents.value.isEmpty) {
      MungroadDialog.openDialogAlert('한 자 이상의 일상을 적어주세요.', null);
    } else {
      MungroadDialog.openDialogConfirm(
          '일상을 등록하시겠습니까?', createDaily, ['확인', '취소']);
    }
  }

  void createDaily() async {
    final userWatch = ref.watch(userProvider);
    Map createData = {
      'contents': _contents.value,
      'writer_id': userWatch.id,
    };
    final createRes = await HttpApi.postApi('/daily', createData);
    FormData formData = await _images.uploadImages(50, createRes['id'], -1);
    final createImageRes = await HttpApi.postImages('/upload/image', formData);
    MungroadDialog.openDialogAlert('일상이 성공적으로 공유되었습니다!', () {
      Navigator.pop(context);
    });
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                runSpacing: multiplyFree(defaultSize, 0.75),
                spacing: multiply05(defaultSize),
                children: [
                  ..._imageContents,
                  Container(
                    width: _previewSize,
                    height: _previewSize,
                    alignment: Alignment.center,
                    child: FileButton(
                      multi: true,
                      onUpload: setPreview,
                      images: _images,
                      child: Container(
                        width: _previewSize / 3 * 2,
                        height: _previewSize / 3 * 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_previewSize) / 3 * 2,
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: _previewSize / 3 * 2 / 2,
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
                  onPressed: confirmCreateDaily,
                  child: Text(
                    '등록하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: multiplyFree(defaultSize, 1),
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
