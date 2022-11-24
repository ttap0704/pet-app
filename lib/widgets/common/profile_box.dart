import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileBox extends ConsumerStatefulWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  ProfileBoxState createState() => ProfileBoxState();
}

class ProfileBoxState extends ConsumerState<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Text('ProfileBox'));
  }
}
