
import 'package:flutter/material.dart';
import 'package:flutter_shared/mixins/constant/color.dart';
import 'package:flutter_shared/mixins/constant/constant.dart';
import 'package:flutter_shared/mixins/constant/text.dart';
import 'package:flutter_shared/model/character.dart';

class RowCharacter extends StatelessWidget {
  const RowCharacter({Key? key, required this.character}) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding/2),
      child: InkWell(
        onTap: (){
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.network(character.image!,width: 80,height: 120,fit: BoxFit.cover,),
            ),
            const SizedBox(width: kDefaultPadding/2,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.name!,style: kTextAveHev14.copyWith(
                    color: kColorBlack
                  ),),
                  const SizedBox(height: kDefaultPadding/4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height:8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: character.status=="Alive"?kColorGreen:kColorRed,
                          shape: BoxShape.circle
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding/4,),
                      Text(character.status!,style: kTextAveHev14.copyWith(
                          color: kColorBlack,
                          fontSize: 12
                      ),),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding/4,),
                  Text(character.species!,style: kTextAveRom12.copyWith(
                    color: kColorBlack
                  ),),
                  const SizedBox(height: kDefaultPadding/2,),
                  Text("Origin",style: kTextAveRom12.copyWith(
                    color: kColorMuted
                  ),),
                  const SizedBox(height: kDefaultPadding/5,),
                  Text(character.origin!.name!,style: kTextAveHev14.copyWith(
                      color: kColorBlack,
                      fontSize: 12
                  ),),
                  const SizedBox(height: kDefaultPadding/2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Gender :",style: kTextAveRom12.copyWith(
                          color: kColorMuted
                      ),),
                      const SizedBox(width: kDefaultPadding/4,),
                      Text(character.gender!,style: kTextAveRom12.copyWith(
                          color: kColorBlack
                      ),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
