
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared/mixins/constant/color.dart';
import 'package:flutter_shared/mixins/constant/constant.dart';
import 'package:flutter_shared/mixins/constant/text.dart';

class RoundedDropdown extends StatelessWidget {
  const RoundedDropdown({Key? key, required this.initialValue, required this.option, required this.label, required this.onSelected}) : super(key: key);

  final String initialValue;
  final List<String> option;
  final String label;
  final Function(String? value) onSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding/5),
      decoration: BoxDecoration(
        color: kColorWhiteSmoke,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kColorWhite),
      ),
      child: DropdownSearch<String>(
        mode: Mode.MENU,
        selectedItem: initialValue==""?label:initialValue,
        items: option,
        onChanged: onSelected,
        showSelectedItems: true,
        dropdownBuilder: (context,String? initialValue){
          return Text(
            initialValue ?? label,
            style: kTextAveRom14.copyWith(color: kColorBlack, height: 1.5),
          );
        },
        popupItemBuilder: (context,String item,bool isSelected){
          return Padding(
            padding: const EdgeInsets.all(kDefaultPadding/2),
            child: Text(item,style: kTextAveRom14.copyWith(
              color:isSelected==true?kColorGreen:kColorBlack
            ),),
          );
        },
        dropdownSearchBaseStyle: kTextAveRom12,
        dropdownSearchDecoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: label,
          helperStyle: kTextAveRom12
        ),
      ),
    );
  }
}
