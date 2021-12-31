import 'package:fake_store/data/services/local/storage/storage_services.dart';
import 'package:fake_store/presentation/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await StorageServices.init();
  runApp(
    const App(),
  );
}
