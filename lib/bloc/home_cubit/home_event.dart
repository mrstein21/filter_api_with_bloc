import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}


class LoadDataEvent extends HomeEvent{
  String name="";
  String species="";
  String gender="";
  String status="";

  LoadDataEvent({this.name="", this.species="", this.gender="", this.status=""});


  @override
  // TODO: implement props
  List<Object?> get props => [name,species,gender,status];

}


class LoadMoreDataEvent extends HomeEvent{
  String name="";
  String species="";
  String gender="";
  String status="";

  LoadMoreDataEvent({this.name="", this.species="", this.gender="", this.status=""});
  @override
  // TODO: implement props
  List<Object?> get props => [name,species,gender,status];

}
