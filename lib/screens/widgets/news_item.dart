import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return Card(
     shape: OutlineInputBorder(
       borderRadius: BorderRadius.circular(16),
       borderSide: BorderSide(
         color: Colors.transparent
       )
     ),
      child: Container(
        padding:EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: (article.urlToImage??""),
                height: 160,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

            ),
          SizedBox(height: 10,),
          Text(article.title??"", style: TextStyle(
            fontSize: 16,fontWeight: FontWeight.bold,

          ),maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
            SizedBox(height: 10,),
            Text(article.description??"",style: TextStyle(
              fontSize: 13,color: Colors.black54
            ),),
            SizedBox(height: 20,),
            Text(article.author??"",
                style: TextStyle(
                fontSize: 12,color: Colors.black54
            )),
            Text(article.publishedAt?.substring(0,10)??"",
            style: TextStyle(
              fontSize: 10,color: Colors.black54
            ),
            textAlign:TextAlign.right,),
          ],
        ),
      ),
    );
    
  }
}
