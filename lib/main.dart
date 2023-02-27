import 'package:flutter/material.dart';
import 'screen/homepage.dart';
class myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_page(),
    );
  }
}

void main()=>runApp(myapp());