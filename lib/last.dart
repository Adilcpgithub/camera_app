import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Gallary extends StatefulWidget {
  const Gallary({super.key});

  @override
  State<Gallary> createState() => _GallaryState();
}

class _GallaryState extends State<Gallary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<File>>(
          future: load(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Image.file(
                      snap.data![index],
                      fit: BoxFit.fitWidth,
                    );
                  },
                  itemCount: snap.data!.length,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<File>> load() async {
    Directory path = Directory('storage/emulated/0/MyCam');
    final List<FileSystemEntity> files = Directory(path.path).listSync();
    List<File> imageFiles = files.whereType<File>().toList();
    return imageFiles;
  }
}
