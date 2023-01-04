import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/profile_box.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_small.dart';

class UserInfo extends ConsumerStatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends ConsumerState<UserInfo> {
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
          GestureDetector(
            child: Container(
              width: multiplyFree(defaultSize, 8),
              height: multiplyFree(defaultSize, 8),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Stack(
                children: [
                  ProfileBox(
                    profilePath: watchUser.profilePath,
                    size: multiplyFree(defaultSize, 8),
                    userId: watchUser.id,
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
        ]),
      ),
    );
  }
}
