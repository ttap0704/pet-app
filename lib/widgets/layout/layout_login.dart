import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_dialog.dart';
import 'package:pet_app/util/mungroad_input_controller.dart';
import 'package:pet_app/widgets/common/common_input.dart';

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

    void handleLogin() {
      Map currentLoginInfo = {
        'login_id': loginInfo[0].value,
        'password': loginInfo[1].value,
      };

      if (currentLoginInfo['login_id'].toString().isEmpty ||
          currentLoginInfo['password'].toString().isEmpty) {
        MungroadDailog.openDialogAlert('에러', 'ㅗㅈ');
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
        ),
        SizedBox(
          height: multiply05(defaultSize),
        ),
        CommonInput(
          data: loginInfo[1],
        ),
        SizedBox(
          height: multiplyFree(defaultSize, 1.5),
        ),
        FractionallySizedBox(
          widthFactor: 1,
          child: ElevatedButton(
            onPressed: handleLogin,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: multiply15(defaultSize),
              ),
            ),
            child: Text(
              '로그인',
              style: buttonTextStyle,
            ),
          ),
        ),
        SizedBox(
          height: multiply05(defaultSize),
        ),
        FractionallySizedBox(
          widthFactor: 1,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: multiply15(defaultSize),
              ),
            ),
            child: Text('회원가입', style: buttonTextStyle),
          ),
        ),
      ],
    );
  }
}
