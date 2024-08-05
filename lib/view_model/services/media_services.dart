import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaServices {
  MediaServices();

  final ImagePicker _imagePicker = ImagePicker();

  // Allowed extensions for different file types
  final List<String> _allowedImageExtensions = ['jpg', 'jpeg', 'png'];
  final List<String> _allowedDocumentExtensions = ['pdf', 'doc', 'docx'];
  final List<String> _allowedAllExtensions = [
    'jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx', 'txt', 'xls', 'xlsx'
  ];

  Future<File?> getSingleImageFromGallery() async {
    final XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null && _isAllowedExtension(file.path, _allowedImageExtensions)) {
      debugPrint("---------printing the path of the file: ${file.path.toString()}");
      return File(file.path);
    } else {
      // Handle unsupported file type
      debugPrint("----------No image selected or unsupported file type");
      return null;
    }
  }

  Future<File?> getSingleFileFromPicker({List<String>? allowedExtensions}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions ?? _allowedAllExtensions,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        String filePath = result.files.single.path!;
        if (_isAllowedExtension(filePath, allowedExtensions ?? _allowedAllExtensions)) {
          debugPrint("---------printing the path of the file: ${filePath}");
          return File(filePath);
        } else {
          // Handle unsupported file type
          debugPrint("----------Unsupported file type");
          return null;
        }
      } else {
        // Handle no file selected
        debugPrint("----------No file selected");
        return null;
      }
    } catch (e) {
      // Handle file picker error
      debugPrint("----------Error picking file: $e");
      return null;
    }
  }

  Future<List<File>?> getMultipleFilesFromPicker({List<String>? allowedExtensions}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions ?? _allowedAllExtensions,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        List<File> files = [];
        for (var file in result.files) {
          String filePath = file.path!;
          if (_isAllowedExtension(filePath, allowedExtensions ?? _allowedAllExtensions)) {
            debugPrint("---------printing the path of the file: ${filePath}");
            files.add(File(filePath));
          } else {
            // Handle unsupported file type
            debugPrint("----------Unsupported file type");
          }
        }
        return files;
      } else {
        // Handle no file selected
        debugPrint("----------No file selected");
        return null;
      }
    } catch (e) {
      // Handle file picker error
      debugPrint("----------Error picking file: $e");
      return null;
    }
  }

  bool _isAllowedExtension(String filePath, List<String> allowedExtensions) {
    final String extension = filePath.split('.').last.toLowerCase();
    return allowedExtensions.contains(extension);
  }
}
