import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingSection extends StatelessWidget {
  const LoadingSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
