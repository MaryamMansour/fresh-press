
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' ;

import 'package:news/screens/home/cubit/states.dart';
import 'package:news/screens/home/repo/repo.dart';

import '../../../models/NewsResponse.dart';
import '../../../models/SourceResponse.dart';
import '../../../models/Sources.dart';
import '../../../shared/components/constants.dart';

class HomeCubit extends Cubit <HomeStates> {

  HomeCubit(this.baseRepository) : super(HomeInitStete());
  static HomeCubit get(context) => BlocProvider.of(context);

List<Sources>src=[];
List<Articles>news=[];
  int selectedIndex=0;
  BaseRepository baseRepository;

void changeSource(int index)
{
   selectedIndex=index;
   emit(HomeChangeSourceState());
}

   Future<void> getSources(String category) async{

    emit(HomeGetSourcesLoadingState());
     baseRepository.getSources(category).then((value) {
       var jsonResponse=jsonDecode(value.body);
      SourceResponse sourceResponse=SourceResponse.fromJson(jsonResponse);
      // return sourceResponse;
       if(sourceResponse.status!="ok"){
       emit(HomeConnectionErrorState());
       return;
       }


       src = sourceResponse.sources??[];
       emit(HomeGetSourcesSuccessState());

   }).catchError((error) {
      emit(HomeGetSourcesErrorState(error));
    });}



  Future<void> getNewsData()async{

    emit(HomeGetNewsLoadingState());
     baseRepository.getNewsData(src[selectedIndex].id??"").then((value) {

       var jsonResponse=jsonDecode(value.body);
       NewsResponse newsResponse=NewsResponse.fromJson(jsonResponse);
       if(newsResponse.status!="ok"){
         emit(HomeConnectionErrorState());
         return;
       }
       news = newsResponse.articles??[];
       emit(HomeGetNewsSuccessState());
       // return newsResponse;
     }).catchError((error){
       emit(HomeGetNewsErrorState(error));
     });



  }

}