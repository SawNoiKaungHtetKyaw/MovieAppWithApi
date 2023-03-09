///Base URL
const String kBASE_URL = "https://api.themoviedb.org/3";

///End Point
const String kGetNowPlayingEndPoint = "/movie/now_playing";
const String kGetGenreIdEndPoint = "/genre/movie/list";
const String kGetGenreByMovieEndPoint = "/discover/movie";
const String kGetPopularMovieEndPoint = "/movie/popular";
const String kGetActorsEndPoint = "/person/popular";
const String kGetDetailsEndPoint = "/movie/{$kPathParameter}";
const String kGetCreditsEndPoint = "/movie/{$kPathParameter}/credits";
const String kGetSimilarMovieEndPoint = "/movie/{$kPathParameter}/similar";

///API Token
const String kApiToken = "6ba57a8fa213613268b61de49d70fffe";

///Qurey Params
const String kApiKey = "api_key";
const String kPageKey = 'page';
const String kWithGenres = 'with_genres';

//Path Params
const String kPathParameter = "movie_id";
