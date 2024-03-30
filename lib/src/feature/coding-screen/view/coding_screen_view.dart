import 'package:code_editor_ui/src/feature/coding-screen/controller/test_bottom_sheet_controller.dart';
import 'package:code_editor_ui/src/feature/coding-screen/res/strings.dart';
import 'package:code_editor_ui/src/feature/coding-screen/view/widgets/alert_box_widget.dart';
import 'package:code_editor_ui/src/feature/coding-screen/view/widgets/coding_screen_drawer_widget.dart';
import 'package:code_editor_ui/src/feature/coding-screen/view/widgets/dropdown_widget.dart';
import 'package:code_editor_ui/src/feature/coding-screen/view/widgets/test_bottom_sheet.dart';
import 'package:code_editor_ui/src/feature/homepage/controller/home_controller.dart';
import 'package:code_editor_ui/src/global/components/custom_button.dart';
import 'package:code_editor_ui/src/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/java.dart';

class CodingView extends StatefulWidget {
  final int index;
  const CodingView({super.key, required this.index});

  @override
  State<CodingView> createState() => _CodingViewState();
}

class _CodingViewState extends State<CodingView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TestBottomSheetController testBottomSheetController = Get.put(TestBottomSheetController());

  CodeController codeController = CodeController(
    text: '//...'
        'Code goes here .... \n//.. \n//.. \n//.. \n..//'
    , // Initial code
    language: java,
  );

  @override
  Widget build(BuildContext context) {
    ProblemController problemController = Get.find();
    return Scaffold(
      drawerEdgeDragWidth: 0,
      key: _scaffoldKey,
      body: Column(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(problemController.problemList[widget.index].title,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:30),maxLines: 2,),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap:(){
                            _scaffoldKey.currentState?.openDrawer();
          } ,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,shape: BoxShape.circle
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.code),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40,),
                        DropDownWidget(
                          langOnChanged:(value) {
                              if (value != null) {
                                setState(() {
                                  selectedLanguage = value;
                                  codeController.language = languageMap[value];
                                });
                              }
                            },
                          themeOnChanged:  (value) {
                            if (value != null) {
                              setState(() {
                                selectedTheme = value;
                                currentTheme = themes[value]!;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ),
          CodeTheme(
            data: CodeThemeData(styles: currentTheme),
            child: Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CodeField(
                    padding: EdgeInsets.zero,
                    controller: codeController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.kPrimaryOrangeColor,
        surfaceTintColor: Colors.white,
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: CustomButton(
                title: 'Test',  onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      testBottomSheetController.loadingTestCase();
                      return const TestBottomModalSheet();
                    }
                );
              },),
            ),
            const SizedBox(width: 40,),
            Expanded(
              child: CustomButton(title: 'Submit',onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                   return const AlertBoxWidget();
                  },
                );
              },),
            ),

          ],
        ),
      ),
      drawer: CodingScreenDrawer(index: widget.index)
    );
  }
}
