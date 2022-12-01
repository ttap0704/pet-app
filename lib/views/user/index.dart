import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/widgets/layout/layout_login.dart';
import 'package:pet_app/widgets/layout/layout_small.dart';

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
      return const LayoutSmall(child: LayoutLogin());
    } else {
      return Column(
        children: [
          const ProfileBox(),
        ],
      );
    }
  }
}

class ProfileBox extends StatelessWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
