import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: buildContainer(context) ,
      subtitle: buildContainer(context),
    );
  }

  Widget buildContainer(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width*.9,
      height: size.height/18,
      color: Colors.grey[400],
     );
  }
}