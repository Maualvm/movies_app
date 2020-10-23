import 'package:flutter/material.dart';
import 'package:movies/HttpHelper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  // States
  String result;
  HttpHelper helper;

  @override
  void initState() {
    helper = new HttpHelper();
		result = 'Loading...';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    helper.getMovieList().then(
      (json) {
        setState(() {
          result = json;
        });
      }
    );
    return Container(
      child: Text(result),
    );
  }
}