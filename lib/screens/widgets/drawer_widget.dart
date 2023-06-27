import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
Function onDrawerClick;
DrawerWidget(this.onDrawerClick);
static int CATEFORY=1;
static int SETTINGS=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width*.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              color: Color(0xFF39A552),
                child: Text("News",style:
                TextStyle(fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),)),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                onDrawerClick(CATEFORY);

              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Categories",
                style: TextStyle(fontSize: 20),),
              ),
            ),
            InkWell(
              onTap: (){
                onDrawerClick(SETTINGS);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Setteings",style: TextStyle(fontSize: 20),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
