import 'package:equatable/equatable.dart';
import 'package:flutter_shared/model/character.dart';

abstract class HomeState extends Equatable{

}

class HomeErrorState extends HomeState{
  String message;
  HomeErrorState({
    required this.message
   });
  @override
  List<Object?> get props => [message];
}

class HomeLoadingState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState{
  List<Character> list=[];
  int nextPage=1;
  bool hasNext=true;
  HomeLoadedState({
    required this.list,
    required this.nextPage,
    required this.hasNext
  });

  HomeLoadedState copyWith({List<Character>? list,int? nextPage, bool? hasNext}){
    return HomeLoadedState(
        list: list ?? this.list,
        nextPage: nextPage  ?? this.nextPage,
        hasNext: hasNext ?? this.hasNext
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [list,nextPage,hasNext];
}