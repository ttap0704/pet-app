import 'package:pet_app/classes/mungroad_image.dart';

class MungroadDaily {
  List<MungroadImage> imageList;
  int id;
  int commentCount;
  String contents;
  int imageCount;
  int likesCount;
  String nickname;
  String profilePath;
  String writerId;

  MungroadDaily(
    this.imageList,
    this.id,
    this.commentCount,
    this.contents,
    this.imageCount,
    this.likesCount,
    this.nickname,
    this.profilePath,
    this.writerId,
  );
}
