import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

void createFolder() async {
  Directory path = Directory("storage/emulated/0/MyCam");
  var status = await Permission.manageExternalStorage.status;
  print(status);
  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
  }

  if ((await path.exists())) {
    return;
  } else {
    path.create();
  }
}
