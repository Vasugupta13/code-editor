import 'package:code_editor_ui/src/feature/coding-screen/res/strings.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final void Function(String?)? langOnChanged;
  final void Function(String?)? themeOnChanged;
  const DropDownWidget({super.key, this.langOnChanged, this.themeOnChanged,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                alignment: Alignment.centerLeft,
                isExpanded: true,
                items: languageMap.keys.map((String language) => DropdownMenuItem<String>(
                    value: language,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            language,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      ],
                    ))).toList(),
                value: selectedLanguage,
                onChanged: langOnChanged,
                //     (value) {
                //   if (value != null) {
                //     setState(() {
                //       selectedLanguage = value;
                //       widget.codeController.language = languageMap[value];
                //     });
                //   }
                // },
                buttonStyleData: ButtonStyleData(
                  padding: const EdgeInsets.only(
                      left: 5,
                      right: 14,
                      top: 0,
                      bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  elevation: 0,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  iconSize: 20,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  elevation: 0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  offset: const Offset(0, 15),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(0),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 10, right: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 40,),
          Expanded(
            flex: 3,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                alignment: Alignment.centerLeft,
                isExpanded: true,
                items: themes.keys.map((String key) => DropdownMenuItem<String>(
                    value: key,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            key,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      ],
                    ))).toList(),
                value: selectedTheme,
                onChanged: themeOnChanged,
                //     (value) {
                //   if (value != null) {
                //     setState(() {
                //       selectedTheme = value;
                //       currentTheme = themes[value]!;
                //     });
                //   }
                // },
                buttonStyleData: ButtonStyleData(
                  padding: const EdgeInsets.only(
                      left: 10,
                      right: 14,
                      top: 0,
                      bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  elevation: 0,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  iconSize: 20,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  elevation: 0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  offset: const Offset(0, 15),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(0),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 10, right: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
