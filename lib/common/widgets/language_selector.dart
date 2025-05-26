import 'package:chat_app/utils/colors.dart';
import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    String dropDownValue = "English";
    List items = ['English'];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: DropdownButton(
          underline: null,
          alignment: Alignment.center,
          value: dropDownValue,
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
          ),
          onChanged: (val) => {
            setState(() {
              dropDownValue = val!;
            })
          },
          items: items.map<DropdownMenuItem<String>>((items) {
            return DropdownMenuItem(value: items, child: Text(items));
          }).toList(),
        ),
      ),
    );
  }
}
