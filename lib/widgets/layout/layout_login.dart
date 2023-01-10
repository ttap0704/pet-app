import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/http.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_dialog.dart';
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutLogin extends ConsumerStatefulWidget {
  const LayoutLogin({Key? key}) : super(key: key);

  @override
  LayoutLoginState createState() => LayoutLoginState();
}

class LayoutLoginState extends ConsumerState<LayoutLogin> {
  @override
  Widget build(BuildContext context) {
    List<MungroadInputFormat> loginInfo = [
      MungroadInputFormat(
        'id',
        '',
        'text',
        'email',
        '이메일을 입력해주세요.',
        0,
      ),
      MungroadInputFormat(
        'password',
        '',
        'password',
        'password',
        '비밀번호를 입력해주세요.',
        0,
      ),
    ];

    TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: multiplyFree(defaultSize, 1),
    );

    void handleLogin() async {
      Map currentLoginInfo = {
        'login_id': loginInfo[0].value,
        'password': loginInfo[1].value,
      };

      if (currentLoginInfo['login_id'].toString().isEmpty ||
          currentLoginInfo['password'].toString().isEmpty) {
        MungroadDialog.openDialogAlert('모든 정보를 입력해주세요.', null);
      } else {
        final loginResult =
            await HttpApi.postApi('/users/login', currentLoginInfo);

        if (loginResult['pass'] == true) {
          final info = loginResult['user'];
          MungroadDialog.openDialogAlert(
            '${info['nickname']}님 환영합니다!',
            () async {
              final readUser = ref.read(userProvider.notifier);
              final UserState user = UserState(
                info['id'],
                info['login_id'],
                info['nickname'],
                info['type'],
                info['certification'],
                info['profile_path'] ?? '',
                info['phone'] ?? '',
              );
              readUser.setUser(user);

              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString(
                'user',
                jsonEncode(
                  {
                    'id': loginInfo[0].value,
                    'password': loginInfo[1].value,
                  },
                ),
              );
            },
          );
        } else {
          final String message = loginResult['message'];
          if (message == 'Wrong Password' || message == 'Wrong Email') {
            MungroadDialog.openDialogAlert('입력하신 정보를 확인해주세요.', null);
          } else if (message == 'Only Kakao') {
            MungroadDialog.openDialogAlert(
              '해당 이메일은 카카오로 가입한 계정입니다.\r\n카카오 로그인을 이용해주세요.',
              null,
            );
          }
        }
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '로그인',
          style: TextStyle(
            fontSize: multiplyFree(defaultSize, 1.2),
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: multiply12(defaultSize),
        ),
        CommonInput(
          data: loginInfo[0],
          expands: false,
        ),
        SizedBox(
          height: multiply05(defaultSize),
        ),
        CommonInput(
          data: loginInfo[1],
          expands: false,
        ),
        SizedBox(height: multiplyFree(defaultSize, 1)),
        FractionallySizedBox(
          widthFactor: 1,
          child: ElevatedButton(
            onPressed: handleLogin,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: multiplyFree(defaultSize, 1),
              ),
            ),
            child: Text(
              '로그인',
              style: buttonTextStyle,
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 1,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: multiplyFree(defaultSize, 1),
              ),
            ),
            child: Text('회원가입', style: buttonTextStyle),
          ),
        ),
      ],
    );
  }
}
