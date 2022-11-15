import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/store/size.dart';
import 'package:pet_app/store/styles.dart';
import 'package:pet_app/util/colors.dart';

class CustomAppBar extends ConsumerStatefulWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.appBar,
      required this.title,
      required this.useBackButton,
      e})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  final AppBar appBar;
  final String title;
  final bool useBackButton;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final commonWatch = ref.watch(commonProvider);
    final sizeWatch = ref.watch(sizeProvider);
    final styles = Styles(sizeWatch.width, sizeWatch.height);

    final bool isHome = commonWatch.tabNumber == 0 ? true : false;
    final Color homeTitleColor = isHome ? Colors.white : Colors.black;

    return AppBar(
      leading: widget.useBackButton ? const BackButton() : null,
      centerTitle: true,
      title: Text(
        widget.title,
        style: styles.textTextStyle,
      ),
      backgroundColor: isHome ? CustomColors.orange : Colors.white,
      bottomOpacity: 1,
      elevation: 0.5,
      shadowColor: Colors.black,
    );
  }

  // @override
  // Size get preferredSize => Size.fromHeight(widget.appBar.preferredSize.height);
}

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.chevron_left),
      onPressed: () => {
        Navigator.of(context).pop(),
      },
    );
  }
}
