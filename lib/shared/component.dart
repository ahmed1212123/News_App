import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article,context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: SizedBox(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articleBuilder(list,) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context)=>
      ListView.separated(
          itemBuilder: (context,index)=>buildArticleItem(list[index],context),
          separatorBuilder: (context,index)=> myDivider(),
          itemCount: 10
      ),
  fallback: (context)=>  Center(child: CircularProgressIndicator()),
);