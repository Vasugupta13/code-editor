import 'package:code_editor_ui/src/feature/coding-screen/view/coding_screen_view.dart';
import 'package:code_editor_ui/src/feature/homepage/controller/home_controller.dart';
import 'package:code_editor_ui/src/global/components/ps_example_text.dart';
import 'package:code_editor_ui/src/global/components/ps_text_component.dart';
import 'package:code_editor_ui/src/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProblemDescription extends StatelessWidget {

  final int index;
  const ProblemDescription({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ProblemController problemController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.kPrimaryOrangeColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey.shade300,
                      offset: const Offset(0,1)
                  ),
                ]
            ),child: Padding(
            padding:  const EdgeInsets.only(left: 20,top: 45,bottom: 5,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: Get.back,
                    child: const Icon(Icons.arrow_back,color: Colors.black,)),
                Row(
                  children: [
                    Expanded(child: Text(problemController.problemList[index].title,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:30),maxLines: 2,)),
                  ],
                ),
              ],
            ),
          ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PsTextComponent("Level",problemController.problemList[index].level),
                      PsTextComponent("Problem Statement",problemController.problemList[index].problemStatement),
                      PsTextComponent("Input",problemController.problemList[index].input),
                      PsTextComponent("Output",problemController.problemList[index].output),
                      const Text('Examples',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PsExampleTextComponent("Example 1 - ","${problemController.problemList[index].example1.input}","${problemController.problemList[index].example1.output}"),
                            const SizedBox(height: 10,),
                            PsExampleTextComponent("Example 2 - ","${problemController.problemList[index].example2.input}","${problemController.problemList[index].example2.output}"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      PsTextComponent("Time Complexity",problemController.problemList[index].timeComplexity),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=> CodingView(index: index));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.kPrimaryOrangeColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                          child: Text("Solve",style: GoogleFonts.poppins(fontSize:16,color:Colors.black,fontWeight:FontWeight.w500),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
