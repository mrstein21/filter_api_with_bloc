import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shared/bloc/filter_dialog_cubit/filter_dialog_cubit.dart';
import 'package:flutter_shared/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_shared/bloc/home_bloc/home_state.dart';
import 'package:flutter_shared/ui/home/widget/filter_dialog.dart';
import 'package:flutter_shared/ui/home/widget/loading_section.dart';
import 'package:flutter_shared/ui/home/widget/no_data_section.dart';
import 'package:flutter_shared/ui/home/widget/row_character.dart';
import 'package:flutter_shared/ui/home/widget/section_header.dart';

import '../../bloc/home_bloc/home_event.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController=TextEditingController();
  TextEditingController _speciesEditingController=TextEditingController();
  late FilterDialogCubit _filterDialogCubit;
  late HomeBloc _bloc;


  void showBottomSheet(){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context){
          return FilterDialog(
            nameController: _searchController,
            speciesController: _speciesEditingController,
          );
        }
    );
  }

  @override
  void initState() {
    _bloc=BlocProvider.of<HomeBloc>(context)..add(LoadDataEvent());
    _filterDialogCubit=BlocProvider.of<FilterDialogCubit>(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: SectionHeader(
              searchController: _searchController,
              onSubmit: (String value){
                _filterDialogCubit.changeInitialName(value);
                _bloc..add(LoadDataEvent(name: _filterDialogCubit.state.name));
              },
              onFilter: (){
                showBottomSheet();
              }
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollNotification){
              if(scrollNotification.metrics.pixels==scrollNotification.metrics.maxScrollExtent){
                if(_bloc.state is HomeLoadedState){
                  _bloc..add(
                      LoadMoreDataEvent(
                          name: _filterDialogCubit.state.name,
                          species: _filterDialogCubit.state.initialSpecies,
                          status: _filterDialogCubit.state.initialStatus,
                          gender: _filterDialogCubit.state.initialGender
                      )
                  );
                }
              }
              return true;
            },
            child: RefreshIndicator(
              onRefresh: ()async{
                _filterDialogCubit.refreshValue();
                _bloc..add(LoadDataEvent());
                _speciesEditingController.clear();
                _searchController.clear();
              },
              child: BlocBuilder<HomeBloc,HomeState>(
                builder: (context,state){
                  if(state is HomeLoadingState){
                    return LoadingSection();
                  }else if(state is HomeLoadedState){
                    return state.list.isEmpty?
                    NoDataSection(message: "Characters Not Found"):
                    ListView.builder(
                        itemCount: state.hasNext?state.list.length+1:state.list.length,
                        itemBuilder: (context,index){
                          if(index<state.list.length){
                            return RowCharacter(character: state.list[index],);
                          }
                          return LoadingSection();
                        }
                    );
                  }else{
                    HomeErrorState homeErrorState = state as HomeErrorState;
                    return NoDataSection(message: homeErrorState.message );
                  }
                },
              ),
            ),
          ),
        )
    );
  }
}
