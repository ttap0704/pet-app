import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pet_app/styles.dart';

class TableInfo extends ConsumerStatefulWidget {
  const TableInfo({
    Key? key,
    required this.keys,
    required this.contents,
  }) : super(key: key);

  final List<String> keys;
  final List<List<String>> contents;

  @override
  TableInfoState createState() => TableInfoState();
}

class TableInfoState extends ConsumerState<TableInfo> {
  late Map<int, TableColumnWidth> _tableColumnWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Map<int, TableColumnWidth> tmpWidthMap = {};
      for (int i = 0, leng = widget.keys.length; i < leng; i++) {
        tmpWidthMap[i] = const FlexColumnWidth();
      }

      setState(() {
        _tableColumnWidth = tmpWidthMap;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cellPadding = EdgeInsets.symmetric(
      vertical: multiply12(defaultSize),
    );

    return Table(
      border: TableBorder.all(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(
          multiply05(defaultSize),
        ),
      ),
      columnWidths: _tableColumnWidth,
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                multiply05(defaultSize),
              ),
            ),
          ),
          children: <Widget>[
            ...widget.keys.map((entry) {
              return TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  padding: cellPadding,
                  child: Text(
                    entry,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: multiply09(defaultSize),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList()
          ],
        ),
        ...widget.contents.map((root) {
          return TableRow(
            decoration: const BoxDecoration(),
            children: <Widget>[
              ...root.map((entry) {
                return TableCell(
                  child: Container(
                    padding: cellPadding,
                    child: Text(
                      entry,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: multiply09(defaultSize),
                      ),
                    ),
                  ),
                );
              }).toList()
            ],
          );
        }).toList()
      ],
    );
  }
}
