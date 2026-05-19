import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

part 'history.g.dart';

@collection
class CodeEntry {
  Id id = Isar.autoIncrement;

  late bool isQrCode;
  late String barcodeData;
  late DateTime timestamp;
}


class HistoryList extends StatelessWidget {
  final List<CodeEntry> history;

  const HistoryList({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        final entry = history[index];

        return ListTile(
          leading: Icon(
            entry.isQrCode
                ? Icons.qr_code
                : Icons.view_stream,
          ),
          title: Text(entry.barcodeData),
          subtitle: Text(entry.timestamp.toString()),
        );
      },
    );
  }
}