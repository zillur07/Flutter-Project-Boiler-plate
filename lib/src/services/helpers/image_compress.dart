import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:my_project/src/services/helpers/log.dart';

void compressWithImageCompress(
    {required String path, required double quality}) async {
  final response = await FlutterImageCompress.compressWithFile(
    path,
    minWidth: 320,
    minHeight: 240,
    quality: quality.truncate(),
  );

  kLog(response);
}

/* ---------------------------------------------------------------------------- */
// ***************** Compress image from camera **********************
/* ---------------------------------------------------------------------------- */

Future<File> compressFile({required File? file}) async {
  final filePath = file!.path;

  // Create output file path
  // eg:- "Volume/VM/abcd_out.jpeg"
  final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
  final splitted = filePath.substring(0, (lastIndex));
  final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
  var result = await FlutterImageCompress.compressAndGetFile(
    file.path,
    outPath,
    quality: 80,
  );

  // print(file.lengthSync());
  // print(result!.lengthSync());

  return result!;
}
/* ---------------------------------------------------------------------------- */