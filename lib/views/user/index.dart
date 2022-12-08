import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/profile_box.dart';
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
      return const LayoutSmall(
        maxWidthValue: 22,
        child: LayoutLogin(),
      );
    } else {
      return UserMenu(
        user: watchUser,
      );
    }
  }
}

class UserMenu extends StatelessWidget {
  const UserMenu({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserState user;

  @override
  Widget build(BuildContext context) {
    double iconSize = multiplyFree(defaultSize, 3);
    double smallIconSize = multiplyFree(defaultSize, 2.2);
    List<Map> exposureMenu = [
      Map.unmodifiable({
        'label': '최근본게시물',
        'color': MungroadColors.blue,
      }),
      Map.unmodifiable({
        'label': '찜',
        'color': MungroadColors.orange,
      }),
    ];

    List<String> menu = ['내 정보', '공지사항 및 이벤트', '로그아웃'];

    return LayoutSmall(
      maxWidthValue: 30,
      child: Column(
        children: [
          Row(
            children: [
              ProfileBox(
                profilePath: user.profilePath,
                size: multiplyFree(defaultSize, 4),
                userId: user.id,
              ),
              SizedBox(width: multiplyFree(defaultSize, 1)),
              Text(
                // user.nickname,
                '쪼이엉아',
                style: TextStyle(
                  fontSize: multiply12(defaultSize),
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
          SizedBox(
            height: multiplyFree(defaultSize, 7.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...exposureMenu.map((entry) {
                  IconData currentIcon =
                      entry['label'] == '찜' ? Icons.heart_broken : Icons.watch;
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentIcon,
                          size: iconSize,
                          color: entry['color'],
                        ),
                        SizedBox(height: multiply05(defaultSize)),
                        Text(
                          entry['label'],
                          style: TextStyle(
                            fontSize: multiplyFree(defaultSize, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ].toList(),
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
          SizedBox(
            width: double.infinity,
            height: multiplyFree(defaultSize, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...menu.map((entry) {
                  IconData currentIcon;
                  int idx = menu.indexOf(entry);
                  BoxDecoration currentDecoration = const BoxDecoration();

                  if (idx == 0) {
                    currentIcon = Icons.verified_user_outlined;
                  } else if (idx == 1) {
                    currentIcon = Icons.note;
                  } else {
                    currentIcon = Icons.logout;
                  }

                  if (idx != menu.length - 1) {
                    currentDecoration = const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: Container(
                      decoration: currentDecoration,
                      child: Row(
                        children: [
                          Icon(
                            currentIcon,
                            size: smallIconSize,
                            color: Colors.black54,
                          ),
                          SizedBox(width: multiply05(defaultSize)),
                          Text(
                            entry,
                            style: TextStyle(
                              fontSize: multiplyFree(defaultSize, 1),
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          )
                        ].toList(),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: multiplyFree(defaultSize, 1)),
          Container(
            width: double.infinity,
            height: multiplyFree(defaultSize, 3),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                multiply09(defaultSize),
              ),
            ),
            child: const Text('카카오톡 1:1 문의'),
          )
        ],
      ),
    );
  }
}
