import 'package:flutter/material.dart';
import 'package:test_app/services/storage_service.dart';

import 'app.dart';
import 'core/init/_init.dart';

Future main() async {
  await init();
  runApp(TestApp(await checkToken()));
}

Future<bool> checkToken() async {
  String? refreshToken =
      await StorageService().read(StorageService.refreshToken);
  return refreshToken != null;
}
