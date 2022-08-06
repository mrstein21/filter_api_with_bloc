import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shared/mixins/network/error_handling.dart';
import 'package:flutter_shared/mixins/toast.dart';
import 'package:flutter_shared/model/character.dart';
import 'package:flutter_shared/model/res/character_res.dart';
import 'package:flutter_shared/provider/character_provider.dart';
import 'package:stream_transform/stream_transform.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {

  EventTransformer<E> throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }

  HomeBloc() : super(HomeLoadingState()){
    on<LoadDataEvent>((event, emit)async{
      try{
        emit(HomeLoadingState());
        CharacterRes res=await CharacterProvider().
        getCharacter(1,name: event.name,gender: event.gender,status: event.status);
        emit(
            HomeLoadedState(
                list: res.results!,
                nextPage: 2,
                hasNext: res.results!.length<=5?false :true)
        );
      }catch(err,stack){
        emit(HomeErrorState(message: ErrorHandling(err).message));
      }
    });


    on<LoadMoreDataEvent>((event, emit)async{
      try{
        HomeLoadedState homeLoadedState=state as HomeLoadedState;
        if(homeLoadedState.hasNext==true){
          CharacterRes res= await CharacterProvider().getCharacter(
              homeLoadedState.nextPage,name: event.name,status: event.status,gender: event.gender);
          if(res.results!.isNotEmpty){
            List<Character>list=List.from(homeLoadedState.list);
            list.addAll(res.results!);
            emit(homeLoadedState.copyWith(
                list: list,
                nextPage: homeLoadedState.nextPage+1,
                hasNext: true
            ));
          }else{
            emit(HomeLoadedState(
                list: homeLoadedState.list,
                nextPage: homeLoadedState.nextPage+1,
                hasNext: false
            ));
          }
        }
      }catch(err,stack){
        showToast(err);
      }
    },transformer: throttleDroppable( Duration(milliseconds: 100))
    );
  }

}