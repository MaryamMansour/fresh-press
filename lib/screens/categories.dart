import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySelect;
  CategoriesScreen(this.onCategorySelect);
  static const String routeName ="categoriesScreen";
  var categories=CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch ,
        children: [
          Text("Pick your category of interset",
          style: (TextStyle(fontSize: 18,fontWeight:
          FontWeight.bold)),),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16
            ),
                itemBuilder: (context, index) {
                  return InkWell(

                    child: CategoryItem(categories[index],index),
                    onTap: (){
                      onCategorySelect(categories[index]);

                    },
                  );
                },
            itemCount: categories.length,),
          )
        ],
      ),
    );
  }
}
