class Movies {
  List<Movie> movies = new List();

  Movies.fromjsonList(List<dynamic> json) {
    if(json == null) return;

    for (var item in json) {
      Movie movie = new Movie.fromJsonMap(item);
      movies.add(movie);
    }
  }

}

class Movie {

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String title;
  double voteAverage;

  Movie(this.popularity, this.voteCount, this.video, this.posterPath, this.id, this.adult, this.title, this.voteAverage);

  Movie.fromJsonMap(Map<String, dynamic> json) {
    this.popularity = json['popularity']/1;
    this.voteCount = json['vote_count'];
    this.video = json['video'];
    this.posterPath = json['poster_path'];
    this.id = json['id'];
    this.adult = json['adult'];
    this.title = json['title'];
    this.voteAverage = json['vote_average']/1;
  }

}