import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';

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
      return LayoutContents(child: NotLoginLayout());
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('로그인 후 더 많은 서비스를 이용하세요!'),
        ElevatedButton(
          onPressed: () {},
          child: Text('로그인'),
          style: ElevatedButton.styleFrom(
            backgroundColor: MungroadColors.orange,
          ),
        )
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
