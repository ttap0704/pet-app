import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/common_input.dart';

class LayoutLogin extends ConsumerStatefulWidget {
  const LayoutLogin({Key? key}) : super(key: key);

  @override
  LayoutLoginState createState() => LayoutLoginState();
}

class LayoutLoginState extends ConsumerState<LayoutLogin> {
  @override
  Widget build(BuildContext context) {
    Map _loginInfo = {
      'id': 'ttap0704@naver.com',
      'password': 'ttap0704@naver',
    };

    TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: multiplyFree(defaultSize, 1),
    );

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
          hint: '이메일을 입력해주세요.',
          value: _loginInfo['id'],
        ),
        SizedBox(
          height: multiply05(defaultSize),
        ),
        CommonInput(
          hint: '비밀번호를 입력해주세요.',
          value: _loginInfo['password'],
        ),
        SizedBox(
          height: multiplyFree(defaultSize, 1.5),
        ),
        FractionallySizedBox(
          widthFactor: 1,
          child: ElevatedButton(
            onPressed: () {},
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
