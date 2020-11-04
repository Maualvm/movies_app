import 'package:flutter/material.dart';
import 'package:movies/HttpHelper.dart';
import 'package:movies/Movie.dart';

class MovieList extends StatelessWidget {
  HttpHelper movieHelper = new HttpHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: movieHelper.getPopularMovies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if(snapshot.hasData == true) {
            List<Movie> movies = snapshot.data;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${movies[index].title}'),
                );
              },
            );
          } 
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}