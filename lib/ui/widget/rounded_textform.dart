import 'package:flutter/material.dart';
import 'package:flutter_shared/mixins/constant/color.dart';
import 'package:flutter_shared/mixins/constant/constant.dart';
import 'package:flutter_shared/mixins/constant/text.dart';

class RoundedTextForm extends StatelessWidget {
  const RoundedTextForm({Key? key, required this.textEditingController, required this.hint, required this.onChanged}) : super(key: key);
  final TextEditingController textEditingController;
  final String hint;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding/5),
      decoration: BoxDecoration(
        color: kColorWhiteSmoke,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kColorWhite),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: textEditingController,
        decoration:  InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          isDense: true,
          hintStyle: kTextAveRom12,
          hintText: hint,
        ),
      ),
    );
  }
}
