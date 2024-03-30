import 'package:code_editor_ui/src/feature/homepage/controller/home_controller.dart';
import 'package:code_editor_ui/src/feature/problem-description/view/problem_description_view.dart';
import 'package:code_editor_ui/src/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProblemController controller = Get.put(ProblemController());
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
                  )
                ]
            ),child: Padding(
              padding:  const EdgeInsets.only(left: 20,top: 45,bottom: 5),
              child: Row(
                children: [
                   Text('Code Editor',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 35),),
                ],
              ),
            ),
          ),

          Expanded(
            child: Obx(()=>
             controller.loading?
                 const Center(child: CircularProgressIndicator(color: AppColors.kPrimaryOrangeColor,),):
              ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.problemList.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: GestureDetector(
                            onTap:(){
                              Get.to(()=> ProblemDescription(index: index));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        color: Colors.grey.shade300,
                                        offset: const Offset(0,0)
                                    )
                                  ]
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.problemList[index].title,style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500
                                        ),),
                                        const SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            const Text("Level : ",style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500
                                            ),),
                                            Text(controller.problemList[index].level,style: TextStyle(
                                                fontSize: 12,
                                                color:controller.problemList[index].level == 'Easy' ? Colors.green : AppColors.kPrimaryOrangeColor,
                                                fontWeight: FontWeight.w500
                                            ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(CupertinoIcons.forward),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
