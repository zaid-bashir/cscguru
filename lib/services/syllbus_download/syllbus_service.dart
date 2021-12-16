import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class SyllbusService {
  Future openFile({String url, String filename}) async {
    final file = await downloadFile(url, filename);
    if (file == null) {
      return;
    }
    debugPrint('Path : ${file.path}');
    OpenFile.open(file.path);
  }

  Future viewFile({String url, String filename}) async {
    final file = await pickFile();
    if (file == null) {
      return;
    }
    debugPrint('Path : ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File> downloadFile(String url, String fileName) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$fileName');
    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }

  Future<File> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );
    if (result == null) {
      return null;
    }
    return File(result.files.first.path);
  }
}
