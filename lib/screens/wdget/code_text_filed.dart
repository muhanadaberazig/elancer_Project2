import 'package:flutter/material.dart';
class CodeTextFiled extends StatelessWidget {
  const CodeTextFiled({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChange,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final void Function(String value)onChange;
  /*للتحكم في نقل العنصر*/
  final FocusNode focusNode;



  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      maxLength: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: onChange,
      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
      ),
      decoration: InputDecoration(
          counterText: '',
          enabledBorder: border(),
        focusedBorder: border(borderColor: Colors.blue),
      ),
    );
  }

  OutlineInputBorder border({Color borderColor=Colors.grey}) {
    return OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 1,
                color:borderColor
            )
        );
  }
}