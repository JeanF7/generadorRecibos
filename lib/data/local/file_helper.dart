import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FileHelper {
  static Future<String> getImagesDirectory() async {
    final dir = File(Platform.resolvedExecutable).parent;
    final imagesDir = Directory(p.join(dir.path, 'profile_images'));
    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }
    return imagesDir.path;
  }

  static Future<String?> copyImageToLocal(String? sourcePath) async {
    if (sourcePath == null || sourcePath.isEmpty) return null;
    
    final file = File(sourcePath);
    if (!await file.exists()) return sourcePath; // Retain original if doesn't exist to avoid crashes

    final imagesDirPath = await getImagesDirectory();
    final fileName = '${DateTime.now().millisecondsSinceEpoch}_${p.basename(sourcePath)}';
    final destPath = p.join(imagesDirPath, fileName);

    // If source is already in our directory, don't copy
    if (p.dirname(sourcePath) == imagesDirPath) {
      return sourcePath;
    }

    final newFile = await file.copy(destPath);
    return newFile.path;
  }

  static Future<void> deleteLocalImage(String? path) async {
    if (path == null || path.isEmpty) return;
    
    try {
      final imagesDirPath = await getImagesDirectory();
      // Only delete if it's inside our managed directory
      if (p.dirname(path) == imagesDirPath) {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      }
    } catch (e) {
      print("Warning: Failed to delete image $path - $e");
    }
  }

  static Future<void> wipeImagesDirectory() async {
     try {
       final imagesDirPath = await getImagesDirectory();
       final dir = Directory(imagesDirPath);
       if (await dir.exists()) {
         await dir.delete(recursive: true);
       }
     } catch (e) {
       print("Warning: Failed to wipe images directory - $e");
     }
  }
}
