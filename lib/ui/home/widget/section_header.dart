
import 'package:flutter/material.dart';
import 'package:flutter_shared/mixins/constant/color.dart';
import 'package:flutter_shared/mixins/constant/constant.dart';

class SectionHeader extends StatelessWidget implements PreferredSizeWidget {
  const SectionHeader({Key? key, required this.searchController, required this.onSubmit, required this.onFilter}) : super(key: key);
  final TextEditingController searchController;
  final Function(String terms) onSubmit;
  final Function() onFilter;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2,vertical: kDefaultPadding/3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding/5),
                decoration: BoxDecoration(
                  color: kColorWhiteSmoke,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kColorWhite),
                ),
                child: TextFormField(
                  controller: searchController,
                  onFieldSubmitted: onSubmit,
                  decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      isDense: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search ",
                  ),

                ),
              ),
            ),
            const SizedBox(width: kDefaultPadding/4,),
            InkWell(
              onTap: onFilter,
              child: Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: kColorGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                    child: Icon(
                      Icons.tune,
                      color: kColorWhite,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(76);}