import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserState {
  int id;
  String loginId;
  String nickname;
  String profilePath;
  int type;
  int certification;

  UserState setUser({
    required UserState user,
  }) {
    return UserState(
      user.id,
      user.loginId,
      user.nickname,
      user.profilePath,
      user.type,
      user.certification,
    );
  }

  UserState(
    this.id,
    this.loginId,
    this.nickname,
    this.profilePath,
    this.type,
    this.certification,
  );
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState(0, '', '', '', 0, 0));

  void setUser(UserState user) {
    state = state.setUser(user: user);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
