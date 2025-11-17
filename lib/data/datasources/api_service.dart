import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sonyliv/data/models.dart';

class ApiService {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNTRjNjNmMDMzYTZhMTY4MDQwN2ZhNzNlY2U3OTU2MSIsIm5iZiI6MTc1OTk4NDI4OC44NDgsInN1YiI6IjY4ZTczYWEwNTJjZDFlMzIzNmU2YTRmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TkoH_wzyx90jR2HFxMGPoL9Z8ZOC54tJFNuoPsV0Wgw"; // from TMDB account

  Future<List<Movie>> fetchTrendingMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/trending/movie/day"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed with status: ${response.statusCode}");
    }
  }
}
