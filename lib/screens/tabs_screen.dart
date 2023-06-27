import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/screens/widgets/news_item.dart';
import 'package:news/screens/widgets/source_item.dart';

import '../models/Sources.dart';
import '../network/remote/api_manager.dart';

class TabsScreen extends StatefulWidget {
  List<Sources>sources;
  TabsScreen(this.sources);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(length: widget.sources.length,
            child: TabBar(
              indicatorColor: Colors.transparent,
              onTap: (value){
                selectedIndex=value;
                setState(() {

                });
              },
              isScrollable: true,
              tabs: widget.sources.map((e) {
                return Tab(
                  child: SourceItem(e ,widget.sources.indexOf(e)==selectedIndex)
                );
              }).toList()
            )),
        FutureBuilder(
          future: ApiManager.getNewsData(widget.sources[selectedIndex].id??""),
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
                  Text(snapshot.data?.message??""),
                  TextButton(onPressed: (){},
                      child: Text("Try agian")),
                ],
              );


            }
          var newsData= snapshot.data?.articles??[];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                return NewsItem(newsData[index]);
              },itemCount: newsData.length,),
            );
          
        },)
      ],
    );
  }
}
