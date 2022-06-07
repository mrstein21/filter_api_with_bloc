import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared/mixins/constant/text.dart';

class NoDataSection extends StatelessWidget {
  const NoDataSection({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
   return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Center(child: Text(message,style: kTextAveHev18,)),
        )
      ],
   );
  }
}
