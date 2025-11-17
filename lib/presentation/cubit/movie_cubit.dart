import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_state.dart';
import 'package:sonyliv/data/datasources/api_service.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final ApiService _api = ApiService();

  void fetchTrendingMovies() async {
    try {
      emit(MovieLoading());

      final movies = await _api.fetchTrendingMovies();

      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
