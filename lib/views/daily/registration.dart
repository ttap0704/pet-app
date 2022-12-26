import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/classes/mungroad_input_format.dart';
import 'package:pet_app/styles.dart';
import 'package:pet_app/widgets/common/common_input.dart';
import 'package:pet_app/widgets/common/file_button.dart';
import 'package:pet_app/widgets/layout/layout.dart';
import 'package:pet_app/widgets/layout/layout_contents.dart';

class DailyRegistration extends ConsumerStatefulWidget {
  const DailyRegistration({Key? key}) : super(key: key);

  @override
  DailyRegistrationState createState() => DailyRegistrationState();
}

class DailyRegistrationState extends ConsumerState<DailyRegistration> {
  final MungroadInputFormat _contents = MungroadInputFormat(
    'contents',
    '',
    'text',
    'daily',
    '일상을 적어주세요.',
    0,
  );

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: '일상 공유하기',
      useBackButton: true,
      useFloatingButton: false,
      useNavBar: false,
      child: LayoutContents(
        child: Container(
          padding: EdgeInsets.all(multiplyFree(defaultSize, 1)),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: multiplyFree(defaultSize, 15),
                child: CommonInput(
                  data: _contents,
                  expands: true,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: FileButton(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: const Text('등록하기'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
