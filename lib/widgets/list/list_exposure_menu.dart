import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_exposure_menu.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/container/container_image_slider.dart';

class ListExposureMenu extends ConsumerStatefulWidget {
  const ListExposureMenu({Key? key, required this.exposureMenu})
      : super(key: key);

  final List<MungroadExposureMenu> exposureMenu;

  @override
  ListExposureMenuState createState() => ListExposureMenuState();
}

class ListExposureMenuState extends ConsumerState<ListExposureMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...widget.exposureMenu.map((entry) {
              int idx = widget.exposureMenu.indexOf(entry);
              double marginLeft =
                  idx != 0 ? multiplyFree(defaultSize, 0.25) : 0;
              return Container(
                margin: EdgeInsets.only(
                  left: marginLeft,
                ),
                width: multiplyFree(defaultSize, 15),
                height: multiplyFree(defaultSize, 15),
                child: Stack(
                  children: [
                    ContainerImageSlider(
                      targetId: entry.id,
                      images: entry.images,
                      category: exposureMenuTypeNumber,
                      useFullScreen: false,
                    ),
                    Positioned(
                      bottom: multiplyFree(defaultSize, 1),
                      right: multiplyFree(defaultSize, 1),
                      child: Text(
                        entry.comment,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
