import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:news/network/remote/api_manager.dart';
import 'package:news/screens/categories.dart';
import 'package:news/screens/home/news_screen.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/screens/widgets/drawer_widget.dart';

class HomeLayout extends StatefulWidget {
  static const routeName ="HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(onDrawerClick),
      appBar: AppBar(
        elevation: 3,
        centerTitle: true,
        backgroundColor:Color(0xFF007500),
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)
          )
        ),
        title: Text(categoryModel==null?"News":categoryModel!.name),
      ),
      body:
      categoryModel==null?
        CategoriesScreen(onCategorySelected):
          NewsScreen(categoryModel!),
    );
  }

  CategoryModel? categoryModel=null;

  void onCategorySelected(category){
    categoryModel=category;

    setState(() {

    });
  }
  void onDrawerClick(num){
    if(num == DrawerWidget.CATEFORY){
      categoryModel=null;
    }else{

    }
    setState(() {
      Navigator.pop(context);
    });

  }
}
