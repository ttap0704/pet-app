import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FileButton extends ConsumerStatefulWidget {
  const FileButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  FileButtonState createState() => FileButtonState();
}

class FileButtonState extends ConsumerState<FileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('jhihi');
      },
      child: widget.child,
    );
  }
}
