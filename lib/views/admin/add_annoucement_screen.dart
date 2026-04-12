import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:matrix/controlllers/admin/add_annoucement_controller.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_drop_down_widget.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';

class AddAnnoucementScreen extends StatefulWidget {
  const AddAnnoucementScreen({super.key});

  @override
  State<AddAnnoucementScreen> createState() => _AddAnnoucementScreenState();
}

class _AddAnnoucementScreenState extends State<AddAnnoucementScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _description = TextEditingController();

  String? selectedAnnoucementType = "Text";

  //controllers
  AddAnnouncementController _controller =
      Get.isRegistered<AddAnnouncementController>()
      ? Get.find()
      : Get.put(AddAnnouncementController());

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _description.dispose();
    _controller.clearImage();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    controller: _titleController,
                    name: "Ttitle",
                    hintText: "Enter a Annoucement Title",
                  ),

                  SizedBox(height: 10.h),
                  CustomDropdownWidgetWithModel<String>(
                    enabled: true,
                    onSelected: (value) {
                      return setState(() {
                        selectedAnnoucementType = value;
                        _controller.clearImage();
                        _controller.clearPdf();
                      });
                    },
                    defaultOption: "Select Annoucement type",
                    width: double.infinity,
                    name: 'Select Annoucement',
                    labelBuilder: (item) =>
                        item, // <-- return the string itself
                    menuItems: ["Text", "Image", "pdf"],
                  ),
                  SizedBox(height: 10.h),
                  selectedAnnoucementType == "Text"
                      ? CustomTextFieldWidget(
                          controller: _description,
                          name: "Description",
                          hintText: "Enter a Annoucement Description",
                          maxlines: 10,
                        )
                      : pickAnnouncementWidget(_controller),

                  SizedBox(height: 20.h),
                  CustomButtonWidget(
                    title: "Add Annoucement",
                    color: primaryColor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: whiteColor),
              ),
              SizedBox(width: 80.w),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(Icons.campaign, color: secondaryColor, size: 30),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Add Annoucements',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Create and share important updates with your ',
            style: TextStyle(
              color: secondaryColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
          Text(
            " school community.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: secondaryColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget pickAnnouncementWidget(AddAnnouncementController controller) {
    return Obx(() {
      return Container(
        width: double.infinity,
        height: 160.h,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: blueColor),
        ),
        child: _buildAnnouncementContent(controller),
      );
    });
  }

  Widget _buildAnnouncementContent(AddAnnouncementController controller) {
    // If an image is selected
    if (controller.selectedAnnoucementImage.value != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.file(
              controller.selectedAnnoucementImage.value!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: controller.clearImage,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      );
    }

    // If a PDF is selected
    if (controller.selectedAnnoucementPdf.value != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.picture_as_pdf, size: 50, color: Colors.red),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              controller.selectedAnnoucmentPdfName.value,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            onPressed: controller.clearPdf,
            child: const Text("Remove PDF"),
          ),
        ],
      );
    }

    // Default upload UI
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (selectedAnnoucementType == "Image") {
                controller.pickAnnoucementImageFromGallery();
              } else {
                controller.pickAnnoucementPdf();
              }
            },
            child: const Icon(Icons.upload_file, size: 40),
          ),
          const SizedBox(height: 8),
          const Text("Upload Announcement"),
        ],
      ),
    );
  }
}
