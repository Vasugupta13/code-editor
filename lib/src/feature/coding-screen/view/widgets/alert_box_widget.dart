import 'package:code_editor_ui/src/feature/homepage/view/home_page_view.dart';
import 'package:code_editor_ui/src/global/components/custom_button.dart';
import 'package:code_editor_ui/src/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertBoxWidget extends StatelessWidget {
  const AlertBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: const Text('Warning'),
      titleTextStyle: GoogleFonts.poppins(fontSize:22,fontWeight:FontWeight.w500,color:AppColors.kPrimaryOrangeColor),
      content: Text('No score will be given if plagiarism found in code.',style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w400,color:Colors.black),),
      actions: <Widget>[
        CustomButton(
          title: 'Recheck',  onPressed: () {
          Get.back();
        },
          backgroundColor: AppColors.kPrimaryOrangeColor,
          foregroundColor: Colors.white,
        ),
        CustomButton(
          title: 'Submit',  onPressed: () {
          Get.offAll(()=> const HomePage());
          Get.snackbar(
            "Code Submitted",
            "Code Submitted Successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ],
    );
  }
}
