import 'package:pet_app/classes/mungroad_image.dart';

class MungroadProduct {
  List<MungroadImage> images;
  int id;
  String bname;
  String detailAddress;
  String label;
  int type;
  String sido;
  String sigungu;
  String zonecode;
  String roadAddress;
  String introdution;
  String? buildingName;
  String? contact;
  String? site;
  String? kakaoChat;

  MungroadProduct(
    this.images,
    this.id,
    this.bname,
    this.detailAddress,
    this.label,
    this.type,
    this.sido,
    this.sigungu,
    this.zonecode,
    this.roadAddress,
    this.introdution,
  );
}
