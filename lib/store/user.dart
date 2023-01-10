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

  UserState setNickname({required String currentNickname}) {
    return UserState(
      id,
      loginId,
      currentNickname,
      type,
      certification,
      profilePath,
      phone,
    );
  }

  UserState setProfile({required String currentProfile}) {
    return UserState(
      id,
      loginId,
      nickname,
      type,
      certification,
      currentProfile,
      phone,
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

  void clearUser() {
    state = UserState(0, '', '', 0, 0, '', '');
  }

  void setUser(UserState user) {
    state = state.setUser(user: user);
  }

  void setNickname(String nickname) {
    state = state.setNickname(currentNickname: nickname);
  }

  void setProfile(String nickName) {
    state = state.setProfile(currentProfile: nickName);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = state.id;
  //   data['loginId'] = state.loginId;
  //   data['nickname'] = state.nickname;
  //   data['type'] = state.type;
  //   data['certification'] = certification;
  //   data['profilePath'] = profilePath;
  //   data['phone'] = phone;
  //   return data;
  // }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
