import 'package:flutter/material.dart';

import '../model/article.dart';

class NewCard extends StatelessWidget {
  final Article article;
  const NewCard({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,

      child: ListTile(
        title: Text('${article.title}'),
        subtitle: Text('${article.description}'),
        trailing:Image.network('${article.urlToImage}'),
        // '${snapshot.data![index].urlToImage}'
      ),

    );
  }
}
