import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddAnnouncementController extends GetxController {
  // Reactive variable to store the selected image
  final Rx<File?> selectedAnnoucementImage = Rx<File?>(null);
  final Rx<File?> selectedAnnoucementPdf = Rx<File?>(null);
  final RxString selectedAnnoucmentPdfName = ''.obs;

  //for add datesheat and timetabkle
  final Rx<File?> selectedTimeTabledatesheatImage = Rx<File?>(null);
  final Rx<File?> selectedTimeTabledatesheatPdf = Rx<File?>(null);
  final RxString selectedTimeTabledatesheatPdfName = ''.obs;

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  /// FOR annoucment Pick image from Gallery
  Future<void> pickAnnoucementImageFromGallery() async {
    try {
      if (Get.context == null) return;

      final XFile? selectedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );

      if (selectedFile != null) {
        selectedAnnoucementImage.value = File(selectedFile.path);
      }
    } on PlatformException catch (e) {
      if (e.code == 'channel-error') {
        Get.snackbar(
          "Error",
          "Image picker unavailable. Please restart the app.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? selectedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
      );

      if (selectedFile != null) {
        selectedAnnoucementImage.value = File(selectedFile.path);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to capture image: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> pickAnnoucementPdf() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        selectedAnnoucementPdf.value = File(result.files.single.path!);
        selectedAnnoucmentPdfName.value = result.files.single.name;

        // Clear image if PDF is selected
        clearImage();
      }
    } on PlatformException catch (e) {
      Get.snackbar(
        "Error",
        "PDF picker unavailable: ${e.message}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick PDF: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearImage() {
    selectedAnnoucementImage.value = null;
  }

  void clearPdf() {
    selectedAnnoucementPdf.value = null;
    selectedAnnoucmentPdfName.value = '';
  }

  //for timetable and datesheat

  Future<void> pickTimetableDatesheatImageFromGallery() async {
    try {
      if (Get.context == null) return;

      final XFile? selectedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );

      if (selectedFile != null) {
        selectedTimeTabledatesheatImage.value = File(selectedFile.path);
      }
    } on PlatformException catch (e) {
      if (e.code == 'channel-error') {
        Get.snackbar(
          "Error",
          "Image picker unavailable. Please restart the app.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> pickTimetableDatesheatPdf() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        selectedTimeTabledatesheatPdf.value = File(result.files.single.path!);
        selectedTimeTabledatesheatPdfName.value = result.files.single.name;

        // Clear image if PDF is selected
        clearTimeTableDatesheatImage();
      }
    } on PlatformException catch (e) {
      Get.snackbar(
        "Error",
        "PDF picker unavailable: ${e.message}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick PDF: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearTimeTableDatesheatImage() {
    selectedTimeTabledatesheatImage.value = null;
  }

  void clearTimeTableDatesheatPdf() {
    selectedTimeTabledatesheatPdf.value = null;
    selectedTimeTabledatesheatPdfName.value = '';
  }
}
