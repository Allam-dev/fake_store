import 'package:fake_store/data/services/local/storage/storage_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class StorageServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openLazyBox(StorageBoxes.user);
  }

  static Future<void> write({required String boxName, required String key, dynamic value}) async {
    LazyBox box = Hive.lazyBox(boxName);
    box.put(key, value);
  }

  static dynamic read({required String boxName, required String key}) {
    LazyBox box = Hive.lazyBox(boxName);
    return box.get(key);
  }

  static void delete({required String boxName, required String key}) {
    LazyBox box = Hive.lazyBox(boxName);
    box.delete(key);
  }

  static void deleteAll({required String boxName}) {
    LazyBox box = Hive.lazyBox(boxName);
    box.clear();
  }

  static Future<void> close() async {
    await Hive.close();
  }
}
