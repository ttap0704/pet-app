import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_image.dart';
import 'package:pet_app/classes/mungroad_image_size.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/util/mungroad_dialog.dart';
import 'package:pet_app/util/mungroad_tools.dart';

class ContainerImageSlider extends ConsumerStatefulWidget {
  const ContainerImageSlider(
      {Key? key,
      required this.targetId,
      required this.images,
      required this.category,
      required this.useFullScreen})
      : super(key: key);

  final int targetId;
  final List<MungroadImage> images;
  final int category;
  final bool useFullScreen;
  @override
  ContainerImageSliderState createState() => ContainerImageSliderState();
}

class ContainerImageSliderState extends ConsumerState<ContainerImageSlider> {
  int _currentImageNumber = 1;

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    int size = 0;
    if (widget.category == accommodationTypeNumber) {
      size = imageSize.accommodationSize;
    } else if (widget.category == restaurantTypeNumber) {
      size = imageSize.accommodationSize;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(multiply05(defaultSize)),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      height: multiplyFree(defaultSize, MungroadImageSize.multiplyValue),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height:
                  multiplyFree(defaultSize, MungroadImageSize.multiplyValue),
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                setState(() {
                  _currentImageNumber = index + 1;
                });
              },
            ),
            items: widget.images.map((entry) {
              String imagePath = MungroadTools.getImageName(
                widget.targetId,
                widget.category,
                entry.fileName,
                size,
              );

              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imagePath),
                      ),
                    ),
                  ); //  <- 반복문을 이용한 contents를 만들어주었음 내용은 생략
                },
              );
            }).toList(),
          ),
          Positioned(
            top: multiplyFree(defaultSize, 1),
            right: multiplyFree(defaultSize, 1),
            child: Text(
              '$_currentImageNumber / ${widget.images.length + 1}',
              style: TextStyle(
                color: Colors.white,
                fontSize: multiplyFree(defaultSize, 1),
              ),
            ),
          ),
          widget.useFullScreen
              ? Positioned(
                  bottom: multiplyFree(defaultSize, 1),
                  right: multiplyFree(defaultSize, 1),
                  child: TextButton(
                    child: const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      MungroadDailog.openDialogSlider(
                        ContainerImageSlider(
                          targetId: widget.targetId,
                          images: widget.images,
                          category: widget.category,
                          useFullScreen: false,
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
