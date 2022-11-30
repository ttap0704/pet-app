import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';
import 'package:pet_app/widgets/layout/layout_login.dart';

class UserIndex extends ConsumerStatefulWidget {
  const UserIndex({Key? key}) : super(key: key);

  @override
  UserIndexState createState() => UserIndexState();
}

class UserIndexState extends ConsumerState<UserIndex> {
  @override
  Widget build(BuildContext context) {
    final watchUser = ref.watch(userProvider);

    if (watchUser.id == 0) {
      return const LayoutLogin(child: NotLoginLayout());
    } else {
      return Column(
        children: [
          ProfileBox(),
        ],
      );
    }
  }
}

class NotLoginLayout extends StatelessWidget {
  const NotLoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: multiplyFree(defaultSize, 1),
    );
    double maxWidth = multiplyFree(defaultSize, 10);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '로그인',
          style: TextStyle(
            fontSize: multiplyFree(defaultSize, 1.05),
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: multiply20(defaultSize),
        ),
        CommonInput(),
        SizedBox(
          height: multiply20(defaultSize),
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

class ProfileBox extends StatelessWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
