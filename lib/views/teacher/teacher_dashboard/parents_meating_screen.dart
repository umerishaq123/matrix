import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_drop_down_widget.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';

class ParentsMeetingScreen extends StatefulWidget {
  const ParentsMeetingScreen({super.key});

  @override
  State<ParentsMeetingScreen> createState() => _ParentsMeetingScreenState();
}

class _ParentsMeetingScreenState extends State<ParentsMeetingScreen> {
  /// Controllers
  final TextEditingController _meetingTitleController = TextEditingController();

  final TextEditingController _venueController = TextEditingController();

  final TextEditingController _agendaController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();

  /// Dropdown values
  String? selectedParent;
  String? selectedClass;
  String? selectedSection;
  String? selectedMeetingType;
  String? selectedPriority;

  /// Date & Time
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  /// Dummy Parent List
  final List<String> parentsList = [
    "Ishaq",
    "Istiaq",
    "M. Ishfaq",
    "M. Ahsan",
    "M. Sher Khan",
  ];

  /// Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  /// Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            _buildHeader(),

            SizedBox(height: 18.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),

              child: Column(
                children: [
                  /// Meeting Title
                  CustomTextFieldWidget(
                    controller: _meetingTitleController,
                    name: "Meeting Title",
                    hintText: "Enter meeting title",
                  ),

                  SizedBox(height: 12.h),

         

                  /// Class Dropdown
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      setState(() {
                        selectedClass = value;
                      });
                    },
                    width: double.infinity,
                    name: 'Select Class',
                    hintText: "Select Class",
                    initialSelection: selectedClass,
                    labelBuilder: (item) => item,
                    menuItems: ["9th", "10th", "1st Year", "2nd Year"],
                  ),

                  SizedBox(height: 12.h),

                  /// Section Dropdown
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      setState(() {
                        selectedSection = value;
                      });
                    },
                    width: double.infinity,
                    name: 'Select Section',
                    hintText: "Select Section",
                    initialSelection: selectedSection,
                    labelBuilder: (item) => item,
                    menuItems: ["A", "B", "C", "D", "E"],
                  ),

                  SizedBox(height: 12.h),

                  /// Meeting Type
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      setState(() {
                        selectedMeetingType = value;
                      });
                    },
                    width: double.infinity,
                    name: 'Meeting Type',
                    hintText: "Select Meeting Type",
                    initialSelection: selectedMeetingType,
                    labelBuilder: (item) => item,
                    menuItems: [
                      "Academic Discussion",
                      "Performance Review",
                      "Behavior Discussion",
                      "Attendance Issue",
                      "General Meeting",
                    ],
                  ),

                  SizedBox(height: 12.h),

                  /// Priority
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      setState(() {
                        selectedPriority = value;
                      });
                    },
                    width: double.infinity,
                    name: 'Priority',
                    hintText: "Select Priority",
                    initialSelection: selectedPriority,
                    labelBuilder: (item) => item,
                    menuItems: ["Low", "Medium", "High"],
                  ),

                  SizedBox(height: 12.h),

                  /// DATE PICKER
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Meeting Date",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),

                  SizedBox(height: 5.h),

                  GestureDetector(
                    onTap: () => _selectDate(context),

                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 16.h,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade300),
                        color: secondaryColor.withOpacity(0.08),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            selectedDate == null
                                ? "Select Meeting Date"
                                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          ),

                          const Icon(Icons.calendar_month),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// TIME PICKER
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Meeting Time",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),

                  SizedBox(height: 5.h),

                  GestureDetector(
                    onTap: () => _selectTime(context),

                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 16.h,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade300),
                        color: secondaryColor.withOpacity(0.08),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            selectedTime == null
                                ? "Select Meeting Time"
                                : selectedTime!.format(context),
                          ),

                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// Venue
                  CustomTextFieldWidget(
                    controller: _venueController,
                    name: "Venue",
                    hintText: "Enter meeting venue",
                  ),

                  SizedBox(height: 12.h),

                  /// Agenda
                  CustomTextFieldWidget(
                    controller: _agendaController,
                    name: "Meeting Agenda",
                    hintText: "Enter meeting agenda",
                  ),

                  SizedBox(height: 12.h),

                  /// Notes
                  CustomTextFieldWidget(
                    controller: _notesController,
                    name: "Additional Notes",
                    hintText: "Enter additional notes",
                  ),

                  SizedBox(height: 25.h),

                  /// BUTTON
                  CustomButtonWidget(
                    color: primaryColor,
                    title: "Schedule Parent Meeting",
                    onTap: () {
                      /// API CALL HERE

                      Get.snackbar(
                        "Success",
                        "Parent meeting scheduled successfully",
                        backgroundColor: Colors.green,
                        colorText: whiteColor,
                      );
                    },
                  ),

                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// HEADER
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
          /// TOP ROW
          Row(
            children: [
              /// BACK BUTTON
              IconButton(
                onPressed: () {
                  Get.back();
                },

                icon: const Icon(Icons.arrow_back, color: whiteColor),
              ),

              SizedBox(width: 65.w),

              /// ICON
              Container(
                width: 60,
                height: 60,

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18),
                ),

                child: const Icon(
                  Icons.groups,
                  color: secondaryColor,
                  size: 30,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// TITLE
          const Text(
            'Parents Meeting',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 5),

          /// SUBTITLE
          Text(
            'Build stronger communication between\nparents and teachers.',
            textAlign: TextAlign.center,

            style: TextStyle(
              color: secondaryColor.withOpacity(0.75),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
