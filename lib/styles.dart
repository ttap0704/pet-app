import 'package:flutter/cupertino.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';

// root context
BuildContext? rootContext;

// multifly Start
int defaultSize = 0;

double multiply20(int size) => size * 2.0;
double multiply19(int size) => size * 1.9;
double multiply18(int size) => size * 1.8;
double multiply17(int size) => size * 1.7;
double multiply16(int size) => size * 1.6;
double multiply15(int size) => size * 1.5;
double multiply14(int size) => size * 1.4;
double multiply13(int size) => size * 1.3;
double multiply12(int size) => size * 1.2;
double multiply11(int size) => size * 1.1;
double multiply09(int size) => size * 0.9;
double multiply08(int size) => size * 0.8;
double multiply07(int size) => size * 0.7;
double multiply06(int size) => size * 0.6;
double multiply05(int size) => size * 0.5;
double multiply04(int size) => size * 0.4;
double multiply03(int size) => size * 0.3;
double multiply02(int size) => size * 0.2;
double multiply01(int size) => size * 0.1;

double multiplyFree(int size, double multiValue) => size * multiValue;
// multifly End

// imageSize Start
MungroadImageSize imageSize = MungroadImageSize(0);
void setImageSize(double width) {
  MungroadImageSize tmpImageSize = MungroadImageSize(width);
  tmpImageSize.init();

  imageSize = tmpImageSize;
}
// imageSize End
