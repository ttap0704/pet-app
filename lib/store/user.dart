import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserState {
  int id;
  String loginId;
  String nickname;
  int type;
  int certification;
  String profilePath;
  String phone;

  UserState setUser({
    required UserState user,
  }) {
    return UserState(
      user.id,
      user.loginId,
      user.nickname,
      user.type,
      user.certification,
      user.profilePath,
      user.phone,
    );
  }

  UserState(
    this.id,
    this.loginId,
    this.nickname,
    this.type,
    this.certification,
    this.profilePath,
    this.phone,
  );
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState(0, '', '', 0, 0, '', ''));

  void setUser(UserState user) {
    state = state.setUser(user: user);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
