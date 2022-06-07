import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shared/bloc/filter_dialog_cubit/filter_dialog_state.dart';

class FilterDialogCubit extends Cubit<FilterDialogState>{
  FilterDialogCubit() :super(FilterDialogState(
      initialGender: "",
      initialStatus: "",
      name: "",
      initialSpecies: ""));

  void changeInitialStatus(String value){
    emit(state.copyWith(initialStatus: value));
  }

  void changeInitialGender(String gender){
    emit(state.copyWith(initialGender: gender));
  }

  void changeInitialName(String name){
    emit(state.copyWith(name: name));
  }

  void changeInitialSpecies(String species){
    emit(state.copyWith(species: species));
  }

  void refreshValue(){
    emit(state.copyWith(initialGender: "",initialStatus: "",name: "",species: ""));
  }

}