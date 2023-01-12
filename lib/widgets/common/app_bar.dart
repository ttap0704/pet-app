import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/store/common.dart';
import 'package:pet_app/classes/mungroad_colors.dart';
import 'package:pet_app/util/mungroad_dialog.dart';
import 'package:pet_app/util/mungroad_radio_contents.dart';

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
  void onSubmitRadioDialog(String value) {
    final commonWatch = ref.watch(commonProvider);
    final commonRead = ref.read(commonProvider.notifier);
    if (commonWatch.tabNumber == 1) {
      commonRead.setLocation('accommodation', value);
    } else {
      commonRead.setLocation('restaurant', value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final commonWatch = ref.watch(commonProvider);

    final bool isHome = commonWatch.tabNumber == 0 ? true : false;
    final double width = MediaQuery.of(context).size.width;
    final bool useDialog = [1, 2].contains(commonWatch.tabNumber);

    double paddingValue = 0;
    if (width > 1000) {
      paddingValue = (width - 1000) / 2;
    }

    TextStyle titleStyle = TextStyle(
      color: Colors.black,
      fontSize: multiply20(defaultSize),
      fontWeight: FontWeight.w700,
    );
    Widget titleWidget = Text(
      widget.title,
      style: titleStyle,
    );

    if (useDialog) {
      String defalutValue = commonWatch.tabNumber == 1
          ? commonWatch.accommodationLocation
          : commonWatch.restaurantLocation;
      titleWidget = GestureDetector(
        onTap: () {
          MungroadDialog.openDialogRadio(
            MungroadRadioContents.location,
            onSubmitRadioDialog,
            defalutValue,
          );
        },
        child: Text(
          '${widget.title} ($defalutValue)',
          style: titleStyle,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingValue,
      ),
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
        color: isHome ? MungroadColors.orange : Colors.white,
      ),
      child: AppBar(
        leading: widget.useBackButton ? const BackButton() : null,
        centerTitle: true,
        title: titleWidget,
        backgroundColor: isHome ? MungroadColors.orange : Colors.white,
        bottomOpacity: 1,
        elevation: 0,
        shadowColor: Colors.black,
      ),
    );
  }

  // @override
  // Size get preferredSize => Size.fromHeight(widget.appBar.preferredSize.height);
}

class BackButton extends StatefulWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  State<BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.chevron_left,
        color: Colors.black,
      ),
      onPressed: () => {
        Navigator.pop(context, true),
      },
    );
  }
}
