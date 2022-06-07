import 'package:equatable/equatable.dart';

class FilterDialogState extends Equatable{
  String name="";
  String initialGender="";
  String initialStatus="";
  String initialSpecies="";
  FilterDialogState({
    required this.initialGender,
    required this.initialStatus,
    required this.initialSpecies,
    required this.name}
    );
  FilterDialogState copyWith({String? initialGender,String? initialStatus,String? name,String? species}){
    return FilterDialogState(
        initialGender: initialGender ?? this.initialGender,
        initialStatus: initialStatus ?? this.initialStatus,
        name: name ?? this.name,
        initialSpecies: species ?? this.initialSpecies
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [initialGender,initialStatus,initialSpecies,name];

}