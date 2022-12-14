import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/constant.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/classes/mungroad_colors.dart';

class LayoutButtonBar extends ConsumerStatefulWidget {
  const LayoutButtonBar({
    Key? key,
    required this.child,
    required this.buttonBarContents,
    required this.onClickButton,
  }) : super(key: key);

  final Widget child;
  final List<String> buttonBarContents;
  final void Function(int) onClickButton;

  @override
  LayoutButtonBarState createState() => LayoutButtonBarState();
}

class LayoutButtonBarState extends ConsumerState<LayoutButtonBar> {
  int _selectedButtonIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double paddingValue = 0;
    if (width > 1000) {
      paddingValue = (width - 1000) / 2;
    }
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: paddingValue,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ButtonBar(
                  buttonHeight: multiply20(defaultSize),
                  buttonPadding: EdgeInsets.symmetric(
                    vertical: multiply09(defaultSize),
                    horizontal: 0,
                  ),
                  alignment: MainAxisAlignment.start,
                  children: [
                    ...widget.buttonBarContents.map((entry) {
                      int idx = widget.buttonBarContents.indexOf(entry);
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedButtonIndex = idx;
                          });
                          widget.onClickButton(idx);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: MungroadColors.orange,
                        ),
                        child: Text(
                          entry,
                          style: TextStyle(
                            color: _selectedButtonIndex == idx
                                ? MungroadColors.orange
                                : Colors.black54,
                          ),
                        ),
                      );
                    }).toList()
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            padding: EdgeInsets.symmetric(
              horizontal: paddingValue,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: multiply14(defaultSize),
                horizontal: multiply12(defaultSize),
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
