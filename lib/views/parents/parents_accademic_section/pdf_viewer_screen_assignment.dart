import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import 'package:matrix/core/constants/colors.dart';

class PdfViewerScreenAssignment extends StatefulWidget {
  final String title;
  final String pdfPath;

  const PdfViewerScreenAssignment({
    super.key,
    required this.title,
    required this.pdfPath,
  });

  @override
  State<PdfViewerScreenAssignment> createState() => _PdfViewerScreenAssignmentState();
}

class _PdfViewerScreenAssignmentState extends State<PdfViewerScreenAssignment> {
  String? localPdfPath;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPdfFromAssets();
  }

  Future<void> loadPdfFromAssets() async {
    try {
      final data = await rootBundle.load(widget.pdfPath);

      final dir = await getTemporaryDirectory();

      final file = File('${dir.path}/${widget.pdfPath.split('/').last}');

      await file.writeAsBytes(data.buffer.asUint8List(), flush: true);

      setState(() {
        localPdfPath = file.path;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("PDF Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),

          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: lightGreyColor),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : localPdfPath == null
                    ? const Center(child: Text("Unable to load PDF"))
                    : PDFView(
                        filePath: localPdfPath!,
                        enableSwipe: true,
                        swipeHorizontal: false,
                        autoSpacing: true,
                        pageFling: true,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 20,
        right: 20,
        bottom: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back, color: whiteColor),
              ),

              Text(
                "Assignments",
                style: GoogleFonts.poppins(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFD166), Color(0xFFFF6B6B)],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PIPS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
