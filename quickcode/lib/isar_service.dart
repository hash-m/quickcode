import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickcode/widgets/history.dart';

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [CodeEntrySchema],
      directory: dir.path,
    );
  }

  static Future<void> addCodeEntryAndTrim(CodeEntry entry) async {
    await isar.writeTxn(() async {
      final collection = isar.codeEntrys;

      await collection.put(entry);

      final all = await collection
          .where()
          .sortByTimestamp()
          .findAll();

      // if more than 10, delete oldest extras
      if (all.length > 10) {
        final toDelete = all.sublist(0, all.length - 10);

        await collection.deleteAll(
          toDelete.map((e) => e.id).toList(),
        );
      }
    });
  }

  static Future<List<CodeEntry>> getTop10History() {
  return isar.codeEntrys
      .where()
      .sortByTimestampDesc()
      .limit(10)
      .findAll();
}
}