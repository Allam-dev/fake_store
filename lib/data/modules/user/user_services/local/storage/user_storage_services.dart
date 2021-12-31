import 'package:fake_store/data/services/local/storage/storage_boxes.dart';
import 'package:fake_store/data/services/local/storage/storage_keys.dart';
import 'package:fake_store/data/services/local/storage/storage_services.dart';

class UserStorageServices{
  Future<void> saveId(int id) async {
    await StorageServices.write(boxName: StorageBoxes.user, key: StorageKeys.userId,value: id);
  }

  Future<int> getId() async {
    int? id = await StorageServices.read(boxName: StorageBoxes.user, key: StorageKeys.userId);
    return id??0;
  }
}