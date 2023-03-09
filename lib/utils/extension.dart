extension ImageExtension on String {
  String getImage() => "https://image.tmdb.org/t/p/w500$this";

  String getVote() {
    int vote = int.parse(this);
    return (vote >= 1) ? "$vote VOTES" : "$vote VOTE";
  }
}
