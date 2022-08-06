
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shared/mixins/constant/constant.dart';
import 'package:flutter_shared/mixins/constant/text.dart';
import 'package:flutter_shared/ui/widget/rounded_drop_down.dart';
import 'package:flutter_shared/ui/widget/rounded_textform.dart';
import '../../../bloc/filter_dialog_cubit/filter_dialog_cubit.dart';
import '../../../bloc/filter_dialog_cubit/filter_dialog_state.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../bloc/home_bloc/home_event.dart';
import '../../../mixins/constant/color.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key, required this.nameController, required this.speciesController}) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController speciesController;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWhite,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding),
      child:Wrap(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BlocBuilder<FilterDialogCubit,FilterDialogState>(
              builder: (context,state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text("Filter Character",style: kTextAveHev16,),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.close,color: kColorGreen,)
                        )
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding/2,),
                    const Divider(),
                    const SizedBox(height: kDefaultPadding,),
                    const Text("Species",style: kTextAveHev14,),
                    const SizedBox(height: kDefaultPadding/5,),
                    RoundedTextForm(
                        onChanged: (String? value){

                        },
                        textEditingController:  speciesController,
                        hint: "Species"
                    ),
                    const SizedBox(height: kDefaultPadding/2,),
                    const Text("Name",style: kTextAveHev14,),
                    const SizedBox(height: kDefaultPadding/5,),
                    RoundedTextForm(
                        onChanged: (String? value){
                          context.read<FilterDialogCubit>().changeInitialName(value ?? "");
                        },
                        textEditingController: nameController,
                        hint: "Character Name"
                    ),
                    const SizedBox(height: kDefaultPadding/2,),
                    const Text("Status",style: kTextAveHev14,),
                    const SizedBox(height: kDefaultPadding/5,),
                    RoundedDropdown(
                              initialValue: state.initialStatus,
                              option: const ["alive","dead","unknown"],
                              label: "Select Status",
                              onSelected: (String? val){
                                context.read<FilterDialogCubit>().changeInitialStatus(val ?? "");
                              },
                     ),
                    const SizedBox(height: kDefaultPadding/2,),
                    const Text("Gender",style: kTextAveHev14,),
                    const SizedBox(height: kDefaultPadding/5,),
                     RoundedDropdown(
                              onSelected: (String? val){
                                context.read<FilterDialogCubit>().changeInitialGender(val ?? "");
                              },
                              initialValue: state.initialGender, option:
                              const ["male","female","genderless","unknown"],
                              label: "Select Gender"
                     ),
                    const SizedBox(height: kDefaultPadding/2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                )),
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(kColorBlack)
                            ),
                            onPressed: (){
                              context.read<FilterDialogCubit>().refreshValue();
                              context.read<HomeBloc>()..add(LoadDataEvent());
                              nameController.clear();
                              speciesController.clear();
                              Navigator.of(context).pop();
                            },
                            child: Text("Reset",style: kTextAveHev14.copyWith(
                                color: kColorWhite
                            ),)
                        ),
                        const SizedBox(width: kDefaultPadding,),
                        ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                )),
                                backgroundColor: MaterialStateProperty.all(kColorGreen)
                            ),
                            onPressed: (){
                              context.read<FilterDialogCubit>().changeInitialName(nameController.text);
                              BlocProvider.of<HomeBloc>(context)..add(LoadDataEvent(
                                name: nameController.text,
                                status: state.initialStatus,
                                gender: state.initialGender,
                                species: state.initialSpecies
                              ));
                              Navigator.of(context).pop();
                            },
                            child: Text("Filter",style: kTextAveHev14.copyWith(
                                color: kColorWhite
                            ),)
                        )
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding,)
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
