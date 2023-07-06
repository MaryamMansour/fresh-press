import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/home/cubit/cubit.dart';
import 'package:news/screens/home/cubit/states.dart';
import 'package:news/screens/home/repo/dto/local.dart';
import 'package:news/screens/home/repo/dto/remote.dart';
import 'package:news/screens/tabs_screen.dart';

import '../../models/SourceResponse.dart';
import '../../network/remote/api_manager.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel categoryModel;
  NewsScreen(this.categoryModel);
var connect = true;

  @override
  Widget build(BuildContext context) {


    return BlocProvider(create: (context) => HomeCubit(connect?RemoteRepo():LocalRepo())..getSources(categoryModel.id),
    child: BlocConsumer<HomeCubit , HomeStates>(
      listener: (context, state) {
      if( state is HomeGetNewsLoadingState ||
          state is HomeGetSourcesLoadingState)
        {
          showDialog(context: context, builder: (context) {
           return AlertDialog(
              title:  Center(child: CircularProgressIndicator()),
            );
          },);
        }
      else if (state is HomeGetSourcesSuccessState )
        {
          HomeCubit.get(context).getNewsData();
        }
      else if (state is HomeGetSourcesErrorState )
        {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text("Error"),
              content: Text (state.error),
            );
          },);
        }
      else if (state is HomeGetNewsSuccessState )
      {
        Navigator.pop(context);
      }
      else if (state is HomeChangeSourceState )
      {
       HomeCubit.get(context).getNewsData();
      }
      else if (state is HomeGetNewsErrorState)
      {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text (state.error),
          );
        },);
      }
      },
      builder: (context, state) {
        return TabsScreen(HomeCubit.get(context).src);
      },
    ),
    );
    // return FutureBuilder<SourceResponse>(
    //   future: ApiManager.getSources(categoryModel.id),
    //   builder: (context, snapshot) {
    //     if(snapshot.connectionState==ConnectionState.waiting)
    //     {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if(snapshot.hasError)
    //     {
    //       return Column(
    //         children: [
    //           Text("sth went wrong!"),
    //           TextButton(onPressed: (){},
    //               child: Text("Try agian")),
    //         ],
    //       );
    //     }
    //
    //     if(snapshot.data?.status!="ok")
    //     {
    //
    //       return Column(
    //         children: [
    //           Text("Error!"),
    //           TextButton(onPressed: (){},
    //               child: Text("Try agian")),
    //         ],
    //       );
    //
    //
    //     }
    //     var src= snapshot.data?.sources??[];
    //
    //     return TabsScreen(src);
    //
    //
    //
    //
    //
    //   },);
  }
}
