import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrix/controlllers/teacher/create_teacher_controller.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_drop_down_widget.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key});

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _teacherEmail = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? selectedGender;
  String? selctedClass;
  String? selectedSubject;
  String? selectedRole;
  String? selectedSection;
  List<PlatformFile> pickedFiles = [];

  /// PICK FILES
  Future<void> pickFiles() async {
    final result = await FilePicker.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        pickedFiles = result.files;
      });
    }
  }
  //controller
  CreateTeacherController _createTeacherController =
      Get.isRegistered<CreateTeacherController>()
      ? Get.find()
      : Get.put(CreateTeacherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    controller: _titleController,
                    name: "Title",
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldWidget(
                    controller: _descriptionController,
                    name: "Description",
                    maxlines: 
                    4,
                  ),
                  SizedBox(height: 10),
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selectedGender = value;
                      });
                    },
                    defaultOption: "Select class",
                    width: double.infinity,
                    name: 'Select Class',
                    labelBuilder: (item) =>
                        item, // <-- return the string itself
                    menuItems: ["9th", "10th", "1 year", "2 year"],
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selectedSection = value;
                      });
                    },
                    defaultOption: "Select section",
                    width: double.infinity,
                    name: 'Select Section',
                    labelBuilder: (item) =>
                        item, // <-- return the string itself
                    menuItems: ["Iris", "Daisy", "Jasmine", "Aster"],
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selectedSubject = value;
                      });
                    },
                    defaultOption: "Select subject",
                    width: double.infinity,
                    name: 'Select Subject',
                    labelBuilder: (item) =>
                        item, // <-- return the string itself
                    menuItems: _createTeacherController.subjects,
                  ),
                                    SizedBox(height: 10.h),

              _buildFileUploadSection(),
                                SizedBox(height: 20.h),

                  CustomButtonWidget(
                    color: primaryColor,
                    title: "Create Notes",
                    onTap: () {},
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// ─────────────────────────────────────────────────────

Widget _buildFileUploadSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10.h),

      // ── Drop zone / upload button ──
      GestureDetector(
        onTap: pickFiles,
        child: DottedBorder(  
        options: const RectDottedBorderOptions(
      dashPattern: [6, 4],
      color: Colors.grey,
      strokeWidth: 1.5,
     
    ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F1FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.cloud_upload_outlined,
                    color: primaryColor, size: 28),
                ),
                const SizedBox(height: 12),
                const Text('Drop PDF files here',
                  style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('or tap the button below to browse',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                const SizedBox(height: 14),
                OutlinedButton.icon(
                  onPressed: pickFiles,
                  icon: const Icon(Icons.upload_file_outlined, size: 18),
                  label: const Text('Choose Files'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    side: const BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ── File list ──
      if (pickedFiles.isNotEmpty) ...[
        const SizedBox(height: 14),
        ...pickedFiles.asMap().entries.map((entry) {
          final i    = entry.key;
          final file = entry.value;
          final kb   = file.size / 1024;
          final size = kb >= 1024
              ? '${(kb / 1024).toStringAsFixed(1)} MB'
              : '${kb.toStringAsFixed(1)} KB';

          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(
              horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                // PDF icon box
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F1FB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.picture_as_pdf_outlined,
                    color: primaryColor, size: 20),
                ),
                const SizedBox(width: 12),

                // Name + size
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(file.name,
                        style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Text(size,
                        style: TextStyle(
                          fontSize: 11, color: Colors.grey.shade500)),
                    ],
                  ),
                ),

                // Remove button
                GestureDetector(
                  onTap: () => removeFile(i),       // implement below
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.close_rounded,
                      size: 16, color: Colors.red.shade400),
                  ),
                ),
              ],
            ),
          );
        }),

        // ── Footer: count + clear all ──
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.attach_file_rounded,
              size: 14, color: Colors.grey.shade400),
            const SizedBox(width: 4),
            Text(
              '${pickedFiles.length} file${pickedFiles.length == 1 ? '' : 's'} selected',
              style: TextStyle(
                fontSize: 12, color: Colors.grey.shade500)),
            const Spacer(),
            TextButton.icon(
              onPressed: clearAllFiles,             // implement below
              icon: Icon(Icons.delete_sweep_outlined,
                size: 16, color: Colors.red.shade400),
              label: Text('Clear all',
                style: TextStyle(
                  fontSize: 12, color: Colors.red.shade400)),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ],

      const SizedBox(height: 12),
    ],
  );
}


void removeFile(int index) {
  setState(() => pickedFiles.removeAt(index));
}

void clearAllFiles() {
  setState(() => pickedFiles.clear());
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
                child: Icon(Icons.menu_book, color: secondaryColor, size: 30),
              ),
            ],
          ),
          // LOAD
            
          const SizedBox(height: 12),
          const Text(
            'Create Notes',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              'Organized notes today, successful students\n tomorrow',
              style: TextStyle(
                color: secondaryColor.withOpacity(0.7),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
