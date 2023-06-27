import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/tabs_screen.dart';

import '../models/SourceResponse.dart';
import '../network/remote/api_manager.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel categoryModel;
  NewsScreen(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError)
        {
          return Column(
            children: [
              Text("sth went wrong!"),
              TextButton(onPressed: (){},
                  child: Text("Try agian")),
            ],
          );
        }

        if(snapshot.data?.status!="ok")
        {

          return Column(
            children: [
              Text("Error!"),
              TextButton(onPressed: (){},
                  child: Text("Try agian")),
            ],
          );


        }
        var src= snapshot.data?.sources??[];

        return TabsScreen(src);





      },);
  }
}
