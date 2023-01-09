import 'dart:io';

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
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:pet_app/widgets/common/file_button.dart';
import 'package:pet_app/widgets/common/profile_box.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_small.dart';

class UserInfo extends ConsumerStatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends ConsumerState<UserInfo> {
  final MungroadUploadImages _profileImage = MungroadUploadImages([]);
  File? _profileFile;
  final List<MungroadInputFormat> _userInfo = [
    MungroadInputFormat(
      'id',
      '',
      'text',
      'email',
      '',
      0,
    ),
    MungroadInputFormat(
      'nickname',
      '',
      'nickname',
      'nickname',
      '',
      0,
    ),
    MungroadInputFormat(
      'phone',
      '',
      'phone',
      'phone',
      '',
      0,
    ),
  ];

  void setProfilePath() {
    if (_profileImage.imageFiles.isNotEmpty) {
      setState(() {
        _profileFile = _profileImage.imageFiles[0];
      });
    }
  }

  void confirmSave() {
    MungroadDialog.openDialogConfirm('정보를 저장하시겠습니까?', updateUser, ['확인', '취소']);
  }

  void updateUser() async {
    final watchUser = ref.watch(userProvider);
    final readUser = ref.read(userProvider.notifier);

    Map updateData = {
      'nickname': _userInfo[1].value,
    };

    final updateRes =
        await HttpApi.postApi('/users/${watchUser.id}/info', updateData);

    readUser.setNickname(_userInfo[1].value);

    if (_profileFile != null) {
      final deleteRes =
          await HttpApi.postApi('/images/profile/${watchUser.id}/delete', {});

      FormData formData = await _profileImage.uploadImages(0, watchUser.id, -1);
      final createImageRes =
          await HttpApi.postImages('/upload/image', formData);

      readUser.setProfile(createImageRes[0]['file_name']);
    }

    MungroadDialog.openDialogAlert('정보가 저장되었습니다.', null);
  }

  @override
  Widget build(BuildContext context) {
    final watchUser = ref.watch(userProvider);

    return Layout(
      title: '내 정보',
      useBackButton: true,
      useFloatingButton: false,
      useNavBar: false,
      child: LayoutSmall(
        maxWidthValue: 30,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          FileButton(
            multi: false,
            images: _profileImage,
            onUpload: setProfilePath,
            child: Container(
              width: multiplyFree(defaultSize, 8),
              height: multiplyFree(defaultSize, 8),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Stack(
                children: [
                  _profileFile == null
                      ? ProfileBox(
                          profilePath: watchUser.profilePath,
                          size: multiplyFree(defaultSize, 8),
                          userId: watchUser.id,
                        )
                      : Container(
                          width: multiplyFree(defaultSize, 8),
                          height: multiplyFree(defaultSize, 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(multiply05(defaultSize)),
                            ),
                            image: DecorationImage(
                              image: FileImage(_profileFile as File),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: multiplyFree(defaultSize, 8),
                      padding: EdgeInsets.symmetric(
                        vertical: multiply05(defaultSize),
                      ),
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Text(
                        '편집',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: multiplyFree(defaultSize, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: multiplyFree(defaultSize, 3)),
          CommonInput(
            data: _userInfo[0],
            expands: false,
            defaultValue: watchUser.loginId,
            label: '이메일',
            readOnly: true,
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
          CommonInput(
            data: _userInfo[1],
            expands: false,
            defaultValue: watchUser.nickname,
            label: '닉네임',
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
          CommonInput(
            data: _userInfo[2],
            expands: false,
            defaultValue: watchUser.phone,
            label: '휴대폰 번호',
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: confirmSave,
              child: const Text('저장'),
            ),
          ),
        ]),
      ),
    );
  }
}
