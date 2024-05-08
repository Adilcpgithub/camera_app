import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'cam.dart';
import 'functions/fns.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  createFolder();
  await Permission.camera.request();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MaterialApp(
      home: TakePictureScreen(
    camera: firstCamera,
  )));
}
