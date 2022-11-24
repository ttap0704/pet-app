import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/classes/mungroad_colors.dart';

class CustomAppBar extends ConsumerStatefulWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.useBackButton,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;
  final bool useBackButton;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final commonWatch = ref.watch(commonProvider);

    final bool isHome = commonWatch.tabNumber == 0 ? true : false;
    final Color homeTitleColor = isHome ? Colors.white : Colors.black;

    return AppBar(
      leading: widget.useBackButton ? const BackButton() : null,
      centerTitle: true,
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.black,
          fontSize: multiply20(defaultSize),
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: isHome ? MungroadColors.orange : Colors.white,
      bottomOpacity: 1,
      elevation: 1,
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
