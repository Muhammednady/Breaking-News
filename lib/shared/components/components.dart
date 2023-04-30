import 'package:flutter/material.dart';
import 'package:news_app/modules/webview_screen/webview_screen.dart';

Widget buildArticleItem(Map article, context) => InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebViewSCreen(Url: article['url']),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
             /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),*/
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article['title']} ',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget buildArticlesList(List articles, context, {isSearch = false}) =>
    articles.isEmpty
        ? isSearch
            ? Center(
                child: Text(
                'No Articles',
                style: Theme.of(context).textTheme.bodyMedium,
              ))
            : Center(child: CircularProgressIndicator())
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                buildArticleItem(articles[index], context),
            separatorBuilder: (context, index) => buildSeperator(),
          );

Widget buildSeperator() => Padding(
    padding: EdgeInsetsDirectional.only(start: 10),
    child: Container(
      height: 1.0,
    ));

Widget DefaultTextFormField({
  required String? hintText,
  required String? label,
  required TextInputType type,
  required TextEditingController? controll,
  void Function()? onclicked,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
  void Function()? suffixpressed,
  required String? Function(String?) validate,
  required void Function(String)? onFinishEntering,
}) =>
    TextFormField(
      validator: validate,
      controller: controll,
      obscureText: isPassword,
      keyboardType: type,
      onTap: onclicked,
      onFieldSubmitted: onFinishEntering,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        hintText: hintText,
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );
              /*
              
https://www.reuters.com/resizer/x-cgODGGu4ZsmG7NqyKJ_9Ge8_8=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/34WKFZGX3BJOTB7YI7GFKUTYSU.jpg                            
                  )*/