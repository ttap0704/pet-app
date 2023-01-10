import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/http.dart';
import 'package:pet_app/store/user.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/dialog/dialog_alert.dart';
import 'package:pet_app/widgets/layout/layout_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'NanumSquareRound',
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: MungroadColors.orange,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: MungroadColors.orange,
              side: const BorderSide(
                color: MungroadColors.orange,
              ),
            ),
          ),
        ),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  void checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('user');
    if (userString != null) {
      Map userJson = jsonDecode(userString);
      Map currentLoginInfo = {
        'login_id': userJson['id'],
        'password': userJson['password'],
      };

      final loginResult =
          await HttpApi.postApi('/users/login', currentLoginInfo);

      if (loginResult['pass'] == true) {
        final info = loginResult['user'];

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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    rootContext = context;
    return const LayoutDefault();
  }
}
